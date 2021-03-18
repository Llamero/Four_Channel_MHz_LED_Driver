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
SLEW_TIME = 1e-6 #Time for LED to switch between intensities
debug = False

class syncPlotWindow(QtWidgets.QDialog):
    sync_update_signal = QtCore.pyqtSignal(object)  # Need to initialize outside of init() https://stackoverflow.com/questions/2970312/pyqt4-qtcore-pyqtsignal-object-has-no-attribute-connect
    status_signal = QtCore.pyqtSignal(object)  # Need to initialize outside of init() https://stackoverflow.com/questions/2970312/pyqt4-qtcore-pyqtsignal-object-has-no-attribute-connect
    def __init__(self, app, main_window):
        self.app = app
        self.gui = main_window
        super(syncPlotWindow, self).__init__()
        # Set look and feel
        uic.loadUi('Sync_Plot_GUI.ui', self)
        #Connect signals
        self.gui.sync_update_signal.connect(self.sync_update_signal.emit)
        self.sync_update_signal.connect(self.updateWindow)  # Update status when new status signal is received
        self.gui.status_signal.connect(self.status_signal.emit)  # Connect mainWindow status signal to dialog status signal
        self.status_signal.connect(self.updateStatus) #Update status when new status signal is received
        # Set dark skin if in dark mode since skin is reverted when window is opened.
        if self.gui.menu_view_skins_dark.isChecked():
            self.app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt5())
        else:
            self.app.setStyleSheet("")
        self.app.setFont(QFont("MS Shell Dlg 2", 12))
        self.y_ref = [OrderedDict([("PWM", []), ("Current", []), ("LED", [])]),
                         OrderedDict([("PWM", []), ("Current", []), ("LED", [])])] #Y values of reference sequence line
        self.x_ref = [[], []] #X values of reference sequence line

        self.status_dict = copy.deepcopy(self.gui.status_dict)
        self.seq_list = guiMapper.initializeSeqList(self.gui)
        self.seq_dict = self.gui.seq_dict
        self.plots = [OrderedDict([("PWM", self.graph_intensity_pwm0), ("Current", self.graph_intensity_current0), ("LED", self.graph_channel0)]),
                      OrderedDict([("PWM", self.graph_intensity_pwm1), ("Current", self.graph_intensity_current1), ("LED", self.graph_channel1)])]

        self.y_values = copy.deepcopy(self.y_ref)
        self.x_values = copy.deepcopy(self.x_ref)  # X values of reference sequence line


        self.state_dict = OrderedDict([("Digital", ["LOW", "HIGH"]), ("Analog", ["Active", "Active"]), ("Confocal", ["Standby", "Scanning"]),
                                       ("Serial", ["Active", "Active"]), ("Custom", ["Active", "Active"])])
        for plot_dict in self.plots:
            for key, value in plot_dict.items():
                self.initializePlot(value, key)
        self.updateWindow()

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
        elif key == "Current":
            status_plot.setLabel('left', "(% LED Current Limit)", **label_style)
        else:
            status_plot.setLabel('left', "(LED Channel #)", **label_style)
            status_plot.setYRange(0, 4.2, padding=0)
            status_plot.getAxis('left').setTickSpacing(1, 1)

        # Use invisible axes to add margins to plot
        status_plot.showAxis("top")
        status_plot.getAxis('top').setPen('k', width=2)
        status_plot.getAxis('top').setTextPen('k', width=2)
        status_plot.showAxis("right")
        status_plot.getAxis('right').setStyle(showValues=False)

        #Set default axis labels
        status_plot.setLabel('bottom', "Time", "s", **label_style)
        status_plot.setLabel('right', "Hold", **label_style)

        # Set grid
        status_plot.getAxis('bottom').setGrid(150)
        status_plot.getAxis('left').setGrid(150)

    def updateWindow(self):
        def widgetIndex(widget_list):
            for w_index, n_widget in enumerate(widget_list):
                if self.gui.getValue(n_widget):
                    return w_index
            else:
                self.showMessage(self.gui, "Error: Widget index not found!")
                return None

        sync_model = self.gui.sync_model

        #Get the active sync mode
        mode = sync_model["Mode"].whatsThis()
        print(mode)
        self.main_tab.setTabText(0, mode + ": " + self.gui.state_dict[mode][0])
        self.main_tab.setTabText(1, mode + ": " + self.gui.state_dict[mode][1])

        if mode == "Digital":
            for index, trigger in enumerate(["Low", "High"]):
                self.main_tab.setTabEnabled(index, True)
                if sync_model["Digital"][trigger]["Mode"].whatsThis() == "LED Off":
                    self.x_ref[index] = [0]  # Set duration to hold
                    for key in self.y_ref[index]:
                        self.y_ref[index][key] = [0] # Set all intensities to 0, and channel is not changed (0)
                elif sync_model["Digital"][trigger]["Mode"].whatsThis() == "Constant Value":
                    duration = self.gui.getValue(sync_model["Digital"][trigger]["Duration"])
                    if duration == 0:
                        self.x_ref[index] = [0]
                    else:
                        self.x_ref[index] = [0, duration, duration + SLEW_TIME]
                    for key in self.y_ref[index]:
                        if isinstance(sync_model["Digital"][trigger][key], list):
                            self.y_ref[index][key] = [widgetIndex(sync_model["Digital"][trigger][key])]
                            if duration > 0:
                                self.y_ref[index][key].extend([widgetIndex(sync_model["Digital"][trigger][key]), 0]) #Extend to hold at off to intensity profile if intensity is pulsed for a fixed duration
                        else:
                            self.y_ref[index][key] = [self.gui.getValue(sync_model["Digital"][trigger][key])]
                            if duration > 0:
                                self.y_ref[index][key].extend([self.gui.getValue(sync_model["Digital"][trigger][key]), 0]) #Extend to hold at off to intensity profile if intensity is pulsed for a fixed duration
                else:
                    seq_widget = self.seq_list[index]
                    n_rows = len(self.seq_dict[seq_widget]["LED #"])
                    elapsed_time = 0
                    if n_rows == 0: #If there isn't a sequence specified, default to holding the LED off
                        self.x_ref[index] = [0]  # Set duration to hold
                        for key in self.y_ref[index]:
                            self.y_ref[index][key] = [0]  # Set all intensities to 0, and channel is not changed (0)
                    else:
                        for key in self.y_ref[index]:
                            self.y_ref[index][key] = []  # Clear all lists
                        self.x_ref[index] = []

                        #If a hold isn't specified at the end of the sequence add a hold at off
                        if self.seq_dict[seq_widget]["Duration (s)"][n_rows-1] != 0:
                            for key in self.seq_dict[seq_widget]:
                                self.seq_dict[seq_widget][key].append(0)
                            n_rows += 1

                        for row in range(n_rows):
                            duration = float(self.seq_dict[seq_widget]["Duration (s)"][row])
                            self.x_ref[index].append(elapsed_time+SLEW_TIME)
                            list_length = 1 #If hold is reached, only add one more time point
                            if duration > 0: #If hold is not reached add two time points as sequence is a step function
                                self.x_ref[index].append(elapsed_time+duration)
                                list_length = 2
                            self.y_ref[index]["LED"].extend([int(self.seq_dict[seq_widget]["LED #"][row])]*list_length)
                            self.y_ref[index]["PWM"].extend([float(self.seq_dict[seq_widget]["LED PWM (%)"][row])]*list_length)
                            self.y_ref[index]["Current"].extend([float(self.seq_dict[seq_widget]["LED current (%)"][row])]*list_length)
                            elapsed_time += duration
                            if duration == 0:
                                break
                        else:
                            self.showMessage("ERROR: Something went very wrong - a hold was not reached at the end of a sequence and this should be impossible.")

        elif mode == "Analog":
            #Disable second tab as there is only one analog state
            self.main_tab.setTabEnabled(0, True)
            self.main_tab.setTabEnabled(1, False)

            #Initialize plots to 0
            for index in range(2):
                self.x_ref[index] = [0]
                for key in self.y_ref[index]:
                    self.y_ref[index][key] = [0]

        elif mode == "Confocal":
            for index, trigger in enumerate(["Standby", "Scanning"]):
                self.main_tab.setTabEnabled(index, True)
                if sync_model["Confocal"][trigger]["Mode"].whatsThis() == "LED Off":
                    self.x_ref[index] = [0]  # Set duration to hold
                    for key in self.y_ref[index]:
                        self.y_ref[index][key] = [0] # Set all intensities to 0, and channel is not changed (0)
                elif sync_model["Confocal"][trigger]["Mode"].whatsThis() == "Constant Value":
                    duration = self.gui.getValue(sync_model["Confocal"][trigger]["Duration"])
                    if duration == 0:
                        self.x_ref[index] = [0]
                    else:
                        self.x_ref[index] = [0, duration, duration + SLEW_TIME]
                    for key in self.y_ref[index]:
                        if isinstance(sync_model["Confocal"][trigger][key], list):
                            self.y_ref[index][key] = [widgetIndex(sync_model["Confocal"][trigger][key])]
                            if duration > 0:
                                self.y_ref[index][key].extend([widgetIndex(sync_model["Confocal"][trigger][key]), 0]) #Extend to hold at off to intensity profile if intensity is pulsed for a fixed duration
                        else:
                            self.y_ref[index][key] = [self.gui.getValue(sync_model["Confocal"][trigger][key])]
                            if duration > 0:
                                self.y_ref[index][key].extend([self.gui.getValue(sync_model["Confocal"][trigger][key]), 0]) #Extend to hold at off to intensity profile if intensity is pulsed for a fixed duration
                else:
                    seq_widget = self.seq_list[index+2]
                    n_rows = len(self.seq_dict[seq_widget]["LED #"])
                    elapsed_time = 0
                    if n_rows == 0: #If there isn't a sequence specified, default to holding the LED off
                        self.x_ref[index] = [0]  # Set duration to hold
                        for key in self.y_ref[index]:
                            self.y_ref[index][key] = [0]  # Set all intensities to 0, and channel is not changed (0)
                    else:
                        for key in self.y_ref[index]:
                            self.y_ref[index][key] = []  # Clear all lists
                        self.x_ref[index] = []

                        #If a hold isn't specified at the end of the sequence add a hold at off
                        if self.seq_dict[seq_widget]["Duration (s)"][n_rows-1] != 0:
                            for key in self.seq_dict[seq_widget]:
                                self.seq_dict[seq_widget][key].append(0)
                            n_rows += 1

                        for row in range(n_rows):
                            duration = float(self.seq_dict[seq_widget]["Duration (s)"][row])
                            self.x_ref[index].append(elapsed_time+SLEW_TIME)
                            list_length = 1 #If hold is reached, only add one more time point
                            if duration > 0: #If hold is not reached add two time points as sequence is a step function
                                self.x_ref[index].append(elapsed_time+duration)
                                list_length = 2
                            self.y_ref[index]["LED"].extend([int(self.seq_dict[seq_widget]["LED #"][row])]*list_length)
                            self.y_ref[index]["PWM"].extend([float(self.seq_dict[seq_widget]["LED PWM (%)"][row])]*list_length)
                            self.y_ref[index]["Current"].extend([float(self.seq_dict[seq_widget]["LED current (%)"][row])]*list_length)
                            elapsed_time += duration
                            if duration == 0:
                                break
                        else:
                            self.showMessage("ERROR: Something went very wrong - a hold was not reached at the end of a sequence and this should be impossible.")

        else:
            print("Not implemented")

        #Update hold labels:
        self.hold_label0.setText("Hold at end: PWM = " + str(self.y_ref[0]["PWM"][-1]) + "%, Current = " + str(self.y_ref[0]["Current"][-1]) + "%, Channel = " + str(self.y_ref[0]["LED"][-1]) + ".  Elapsed hold time: 00:00:00")
        self.hold_label1.setText("Hold at end: PWM = " + str(self.y_ref[1]["PWM"][-1]) + "%, Current = " + str(self.y_ref[1]["Current"][-1]) + "%, Channel = " + str(self.y_ref[1]["LED"][-1]) + ".  Elapsed hold time: 00:00:00")

        #Plot reference lines
        for index in range(2):
            if self.main_tab.isTabEnabled(index):
                for key, seq_plot in self.plots[index].items():
                    seq_plot.plot(self.x_ref[index], self.y_ref[index][key], pen=pg.mkPen('m', width=1), clear=True)


    def updateStatus(self):
        pass

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




