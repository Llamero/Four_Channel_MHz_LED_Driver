import math

from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont
import qdarkstyle  # This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet
from collections import OrderedDict, deque
import os
import pyqtgraph as pg
import guiMapper
import guiSequence as seq
import guiConfigIO as fileIO
import guiPlotter as plot
import driverUSB
import time

N_MEASUREMENTS = 50 #Number of measurements per plot
MIN_TEMP_RANGE = 6 #Number of degrees at maximum zoom on the temperature plot
PLOT_PADDING = 1.1 #Factor of dark space above and below plot line so that plot line doesn't touch top of widget


class statusWindow(QtWidgets.QDialog):
    def __init__(self, app, main_window):
        self.app = app
        self.gui = main_window
        super(statusWindow, self).__init__()
        # Set look and feel
        uic.loadUi('Status_GUI.ui', self)
        self.app.setStyleSheet("")
        self.app.setFont(QFont("MS Shell Dlg 2", 12))
        self.timeline = guiMapper.TimeLine(loopCount=0, interval=100) #Animation object for animating plots
        self.x_axis_offset = 0 #Current x-axis offset to use for rastering the plots in time

        #Initialize widget dictionaries
        self.dynamic_dict = OrderedDict([("Channel", None),
                                                     ("PWM", None),
                                                     ("Current", None),
                                                     ("Mode", None),
                                                     ("Control", None),
                                                     ("Transistor", None),
                                                     ("Resistor", None),
                                                     ("External", None),
                                                     ("Driver Fan", None),
                                                     ("External Fan", None)])

        self.static_dict = OrderedDict([("Name", None),
                                        ("COM Port", None),
                                        ("Serial", None),
                                        ("Control", None),
                                        ("Input", None)])

        self.plots = OrderedDict([("Internal", self.graph_temperature_internal),
                                      ("External", self.graph_temperature_external),
                                      ("Current", self.graph_current)])

        self.y_values = OrderedDict([("Internal", OrderedDict([("Transistor", deque([-1000]*N_MEASUREMENTS)), ("Resistor", deque([-1000]*N_MEASUREMENTS))])),
                                      ("External", deque([-1000]*N_MEASUREMENTS)),
                                      ("Current", deque([0]*N_MEASUREMENTS))])
        for key, value in self.plots.items():
            self.initializePlot(value, key)
        self.startAnimation()

    def initializePlot(self, status_plot, key):
        # Set look and feel
        default_font = QtGui.QFontInfo(self.gui.app.font())
        pg.setConfigOption('background', 'k')
        pg.setConfigOption('foreground', '#999')
        pg.setConfigOptions(antialias=True)
        label_style = {"color": "#999", "font-size": str(default_font.pointSize()) + "pt",
                       "font-style": str(default_font.family())}

        if key == "Current":
            status_plot.setLabel('left', "LED Current ", "A", **label_style)
        else:
            status_plot.setLabel('left', "", "°C", **label_style)
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

    def startAnimation(self):
        self.timeline.setFrameRange(0, 100)
        self.timeline.frameChanged.connect(lambda: self.updatePlots())
        self.timeline.start()

    def stopAnimation(self):
        self.timeline.stop()

    def updatePlots(self):
        self.x_axis_offset += 1
        for key, status_plot in self.plots.items():
            if self.x_axis_offset == N_MEASUREMENTS:
                self.x_axis_offset = 0
            x_values = list(range(self.x_axis_offset, self.x_axis_offset + N_MEASUREMENTS))
            if self.isVisible():
                status_plot.setXRange(self.x_axis_offset, N_MEASUREMENTS+self.x_axis_offset, padding=0)

            if key == "Internal":
                for key2, y_value in self.y_values[key].items():
                    self.y_values[key][key2][0] = 10*math.sin(time.time()/3)+20
                    self.y_values[key][key2].rotate(-1)
                    if self.isVisible():
                        y_list = list(self.y_values[key][key2])
                        list_max = max(y for y in y_list if y > -273.15) #Exclude None: https://stackoverflow.com/questions/2295461/list-minimum-in-python-with-none
                        list_min = min(y for y in y_list if y > -273.15)
                        y_mean = (list_max + list_min) / 2
                        y_range = list_max - list_min
                        if y_range < MIN_TEMP_RANGE*PLOT_PADDING:
                            y_range = MIN_TEMP_RANGE*PLOT_PADDING
                        status_plot.setYRange(y_mean - y_range/2, y_mean + y_range/2, padding=0)

                        if key2 == "Transistor":
                            color = 'g'
                            clear_plot = True
                        else:
                            color = 'm'
                            clear_plot = False
                        status_plot.plot(x_values, y_list, pen=pg.mkPen(color, width=1), clear=clear_plot)

            elif key == "External":
                self.y_values[key][0] = 1
                self.y_values[key].rotate(-1)
                if self.isVisible():
                    y_list = list(self.y_values[key])
                    list_max = max(y for y in y_list if y > -273.15)  # Exclude None: https://stackoverflow.com/questions/2295461/list-minimum-in-python-with-none
                    list_min = min(y for y in y_list if y > -273.15)
                    y_mean = (list_max + list_min) / 2
                    y_range = list_max - list_min
                    if y_range < MIN_TEMP_RANGE * PLOT_PADDING:
                        y_range = MIN_TEMP_RANGE * PLOT_PADDING
                    status_plot.setYRange(y_mean - y_range / 2, y_mean + y_range / 2, padding=0)
                    status_plot.plot(x_values, y_list, pen=pg.mkPen('g', width=1), connect="finite", clear=True)

            else:
                self.y_values[key][0] = 1
                self.y_values[key].rotate(-1)
                if self.isVisible():
                    y_list = list(self.y_values[key])
                    status_plot.setYRange(0, max(y_list)*PLOT_PADDING, padding=0)
                    status_plot.plot(x_values, y_list, pen=pg.mkPen('g', width=1), connect="finite", clear=True)




