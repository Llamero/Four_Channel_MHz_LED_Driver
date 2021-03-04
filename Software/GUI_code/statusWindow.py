import math
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
import guiPlotter as plot
import driverUSB
import time
import copy

N_MEASUREMENTS = 50 #Number of measurements per plot
MIN_TEMP_RANGE = 6 #Number of degrees at maximum zoom on the temperature plot
PLOT_PADDING = 1.1 #Factor of dark space above and below plot line so that plot line doesn't touch top of widget
debug = True

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
        self.dynamic_dict = OrderedDict([("Channel", 0),
                                         ("PWM", 0),
                                         ("Current", 0),
                                         ("Mode", 0),
                                         ("State", 0),
                                         ("Control", 0),
                                         ("Transistor", 0),
                                         ("Resistor", 0),
                                         ("External", 0),
                                         ("Driver Fan", 0),
                                         ("External Fan", 0)])

        self.static_dict = OrderedDict([("Name", 0),
                                        ("COM Port", 0),
                                        ("Serial", 0),
                                        ("Control", 0)])

        self.status_dict = OrderedDict(list(self.dynamic_dict.items()) + list(self.static_dict.items()) + [("Count", 0)])

        self.plots = OrderedDict([("PWM", self.graph_intensity_pwm), ("Current", self.graph_intensity_current),
                                  ("Transistor", self.graph_temperature_transistor), ("Resistor", self.graph_temperature_resistor), ("External", self.graph_temperature_external)])

        self.y_values = OrderedDict([("PWM", deque([0]*N_MEASUREMENTS)), ("Current", deque([0]*N_MEASUREMENTS)),
                                  ("Transistor", deque([-1000]*N_MEASUREMENTS)), ("Resistor", deque([-1000]*N_MEASUREMENTS)), ("External", deque([-1000]*N_MEASUREMENTS))])

        self.state_dict = OrderedDict([("Digital", ["LOW", "HIGH"]), ("Analog", ["Active", "Active"]), ("Confocal", ["Standby", "Scanning"]),
                                       ("Serial", ["Active", "Active"]), ("Custom", ["Active", "Active"])])

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

        if key == "PWM":
            status_plot.setLabel('left', "(% Duty Cycle)", **label_style)
        elif key == "Current":
            status_plot.setLabel('left', "(% LED Current Limit)", **label_style)
        else:
            status_plot.setLabel('left', "", "°C", **label_style)
            status_plot.setYRange(21 - MIN_TEMP_RANGE / 2, 21 + MIN_TEMP_RANGE / 2, padding=0)
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
        self.timeline.frameChanged.connect(lambda: self.updateStatusWindow())
        self.timeline.start()

    def stopAnimation(self):
        self.timeline.stop()

    def sendStatus(self):
        def widgetIndex(widget_list):
            nonlocal self
            for w_index, n_widget in enumerate(widget_list):
                if self.gui.getValue(n_widget):
                    return w_index
            else:
                self.gui.showMessage("Error: Widget index not found!")
                return None

        status_list = [0]*11
        mode = widgetIndex(self.gui.main_model["Mode"])
        dial_max = self.gui.main_model["Intensity"].maximum()
        channel = widgetIndex(self.gui.main_model["Channel"])
        if mode == 2:
            pwm = 65535
            current = round((self.gui.getValue(self.gui.main_model["Intensity"]) / dial_max) * self.gui.getAdcCurrentLimit(channel))
        elif mode == 3:
            current = 0
            pwm = 0
        else:
            pwm = round((self.gui.getValue(self.gui.main_model["Intensity"]) / dial_max) * 65535)
            current = self.gui.getAdcCurrentLimit(channel)

        #Send only GUI states - set all driver specific values to 0 since they are just padding
        status_list[0] = channel
        status_list[1] = pwm
        status_list[2] = current
        status_list[3] = mode
        status_list[5] = widgetIndex(self.gui.main_model["Control"])
        if debug:
            print("Send: " + str(status_list))
        return status_list

    def updateStatus(self, reply):
        status_change = False
        status_list = struct.unpack("<BHHB??HHHHH", reply)
        if debug:
            print("Recv: " + str(status_list))
        count = self.status_dict["Count"]
        for index, key in enumerate(self.dynamic_dict):
            if key in ["Channel", "Mode", "Control", "State"] or count == 0:
                self.status_dict[key] = status_list[index]
            else: #Calculate running average of measured values per update
                self.status_dict[key] += status_list[index]
            if self.dynamic_dict[key] != status_list[index]:
                self.dynamic_dict[key] = status_list[index]
                status_change = True
        if status_change:
            self.gui.updateMain(self.dynamic_dict)
        self.status_dict["Count"] += 1

    def updateStatusWindow(self):
        round_to_n = lambda x, n: x if x == 0 else round(x, -int(math.floor(math.log10(abs(x)))) + (n - 1)) #Roudn to sig fig - https://stackoverflow.com/questions/3410976/how-to-round-a-number-to-significant-figures-in-python
        count = self.status_dict["Count"]
        if count > 0: #Update values if at least one new update was received
            for key, value in self.status_dict.items():
                unit = ""
                if key == "Channel":
                    value += 1
                    self.updateLabel(key, value)
                    key = "Channel Name"
                    value = self.gui.getValue(self.gui.config_model["LED" + str(value)]["ID"])
                elif key in ["Transistor", "Resistor", "External"]:
                    self.status_dict[key] = fileIO.adcToTemp(value/count)
                    if self.status_dict[key] > -100:
                        value = round_to_n(self.status_dict[key], 3)
                        unit = " °C"
                    else:
                        value = "Not Connected"
                elif key in ["Driver Fan", "External Fan", "PWM"]:
                    self.status_dict[key] = ((value / count)/65535)*100
                    value = round_to_n(self.status_dict[key], 3)
                    unit = " %"
                elif key == "Current":
                    self.status_dict[key] = ((value / count) / self.gui.getAdcCurrentLimit(self.status_dict["Channel"])) * 100
                    value = round_to_n(self.status_dict[key], 3)
                    unit = " %"
                elif key == "Control":
                    value = self.gui.main_model["Control"][int(value)].text()
                elif key == "Mode":
                    if self.status_dict[key] == 0:
                        value = "Sync - " + self.gui.sync_model["Mode"].whatsThis()
                    elif self.status_dict[key] in [1, 2]:
                        value = "Manual"
                    else:
                        value = "Off"
                elif key == "State":
                    try:
                        if self.status_dict["Mode"] == 0:
                            value = self.state_dict[self.gui.sync_model["Mode"].whatsThis()][self.status_dict[key]]
                        elif self.status_dict["Mode"] == 1:
                            value = "PWM"
                        elif self.status_dict["Mode"] == 2:
                            value = "Current"
                        else:
                            value = "Off"
                    except KeyError:
                        value = "Loading..."

                if key not in ["Count"]:
                    self.updateLabel(key, value, unit)
            self.status_dict["Count"] = 0 #Reset the averaging counter

        #Update plots
        show_plot = self.isVisible() and self.gui.getValue(self.main_tab) in ["Intensity Plots", "Temperature Plots"]
        self.x_axis_offset += 1
        for key, status_plot in self.plots.items():
            if self.x_axis_offset == N_MEASUREMENTS:
                self.x_axis_offset = 0
            x_values = list(range(self.x_axis_offset, self.x_axis_offset + N_MEASUREMENTS))
            if show_plot:
                status_plot.setXRange(self.x_axis_offset, N_MEASUREMENTS+self.x_axis_offset, padding=0)

            if key in ["Transistor", "Resistor", "External"]:
                self.y_values[key][0] = self.status_dict[key]
                self.y_values[key].rotate(-1)
                if show_plot:
                    y_list = list(self.y_values[key])
                    try:
                        list_max = max(y for y in y_list if y > -273.15)  # Exclude None: https://stackoverflow.com/questions/2295461/list-minimum-in-python-with-none
                        list_min = min(y for y in y_list if y > -273.15)
                        y_mean = (list_max + list_min) / 2
                        y_range = list_max - list_min
                        if y_range < MIN_TEMP_RANGE * PLOT_PADDING:
                            y_range = MIN_TEMP_RANGE * PLOT_PADDING
                        status_plot.setYRange(y_mean - y_range / 2, y_mean + y_range / 2, padding=0)
                    except ValueError:
                        pass
                    status_plot.plot(x_values, y_list, pen=pg.mkPen('g', width=1), connect="finite", clear=True)

            else:
                self.y_values[key][0] = self.status_dict[key]
                self.y_values[key].rotate(-1)
                if show_plot:
                    y_list = list(self.y_values[key])
                    status_plot.setYRange(0, max(y_list)*PLOT_PADDING, padding=0)
                    status_plot.plot(x_values, y_list, pen=pg.mkPen('g', width=1), connect="finite", clear=True)

    def updateLabel(self, key, value, unit = ""):
        widget = key.lower()
        widget = eval("self.text_" + widget.replace(" ", "_") + "_label")
        widget.setText(key + ": " + str(value) + unit)

    def showMessage(self, text):
        self.gui.waitCursor(False)
        self.gui.stopSplash()
        self.gui.message_box.setText(text)
        self.gui.message_box.exec()




