import math
import re
import struct
import sys

from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont
import qdarkstyle  # This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet
from collections import OrderedDict, deque
import os
import pyqtgraph as pg
import guiMapper
import guiSequence as seq
import guiConfigIO as fileIO
import calibrationPlot as plot
import driverUSB
import time
import copy


MIN_TEMP_RANGE = 6 #Number of degrees at maximum zoom on the temperature plot
PLOT_PADDING = 1.1 #Factor of dark space above and below plot line so that plot line doesn't touch top of widget
debug = False

class syncPlotWindow(QtWidgets.QDialog):
    status_signal = QtCore.pyqtSignal(object)  # Need to initialize outside of init() https://stackoverflow.com/questions/2970312/pyqt4-qtcore-pyqtsignal-object-has-no-attribute-connect

    def __init__(self, app, main_window):
        self.app = app
        self.gui = main_window
        super(syncPlotWindow, self).__init__()
        # Set look and feel
        uic.loadUi('Sync_Plot_GUI.ui', self)
        if self.gui.menu_view_skins_dark.isChecked(): #Set dark skin if in dark mode since skin is reverted when window is opened.
            self.app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt5())
        else:
            self.app.setStyleSheet("")
        self.app.setFont(QFont("MS Shell Dlg 2", 12))

        self.status_dict = copy.deepcopy(self.gui.status_dict)
        self.gui.status_signal.connect(self.status_signal.emit)  # Connect mainWindow status signal to dialog status signal
        self.status_signal.connect(self.updateStatus) #Update status when new status signal is received
        self.plots = [OrderedDict([("PWM", self.graph_intensity_pwm), ("Current", self.graph_intensity_current)]),
                      OrderedDict([("PWM", self.graph_intensity_pwm), ("Current", self.graph_intensity_current)])]

        self.y_values = [OrderedDict([("PWM", []), ("Current", [])]),
                         OrderedDict([("PWM", []), ("Current", [])])]

        self.state_dict = OrderedDict([("Digital", ["LOW", "HIGH"]), ("Analog", ["Active", "Active"]), ("Confocal", ["Standby", "Scanning"]),
                                       ("Serial", ["Active", "Active"]), ("Custom", ["Active", "Active"])])
        for plot_dict in self.plots:
            for key, value in plot_dict.items():
                self.initializePlot(value, key)

    def initializePlot(self, status_plot, key):
        # Set look and feel
        default_font = QtGui.QFontInfo(self.gui.app.font())
        pg.setConfigOption('background', 'k')
        pg.setConfigOption('foreground', '#999')
        pg.setConfigOptions(antialias=True)
        label_style = {"color": "#999", "font-size": str(default_font.pointSize()) + "pt",
                       "font-style": str(default_font.family())}

        if key == "PWM":
            status_plot.setLabel('left', "(% Duty Cycle)", **label_style)
        else:
            status_plot.setLabel('left', "(% LED Current Limit)", **label_style)

        status_plot.setLabel('bottom', "", **label_style)

        # Use invisible axes to add margins to plot
        status_plot.showAxis("top")
        status_plot.getAxis('top').setPen('k', width=2)
        status_plot.getAxis('top').setTextPen('k', width=2)
        status_plot.showAxis("right")
        status_plot.getAxis('right').setPen('k', width=2)
        status_plot.getAxis('right').setTextPen('k', width=2)

        # Set
        status_plot.setXRange(0, N_MEASUREMENTS, padding=0)
        status_plot.getAxis('bottom').setTickSpacing(N_MEASUREMENTS/10, N_MEASUREMENTS/10)
        status_plot.getAxis('bottom').setStyle(showValues = False)
        status_plot.getAxis('bottom').setGrid(150)
        status_plot.getAxis('left').setGrid(150)

    def initializeSpeedModel(self):
        speed_model = OrderedDict()
        for speed in ["fast", "normal", "slow", "custom"]:
            speed_model[speed] = eval("self.graph_" + speed + "_update_button")
            speed_model[speed].clicked.connect(self.changeSpeed)

        custom_spinbox = self.graph_custom_update_spinbox
        custom_spinbox.valueChanged.connect(self.changeSpeed)

        return speed_model, custom_spinbox

    def activeCurrent(self):
        # Get current limit of active LED
        for led_number in range(1, 5):
            widget = eval("self.gui.main_channel_LED" + str(led_number) + "_button")
            if self.gui.getValue(widget):
                return self.gui.getValue(self.gui.config_model["LED" + str(led_number)]["Current Limit"]) * self.gui.getValue(
                    self.gui.calibration_current_box) / 100  # Return current limit * scale
        else:
            return None

    def setCalibrationScale(self):
        current = self.activeCurrent()
        self.gui.calibration_plot_window.setYRange(0, current * 1.2, padding=0)
        xlim = self.gui.calibration_plot_window.getViewBox().state["targetRange"][0][1]
        x = [0, xlim]
        y = [current, current]

    def showMessage(self, text):
        self.gui.waitCursor(False)
        self.gui.stopSplash()
        self.gui.message_box.setText(text)
        self.gui.message_box.exec()




