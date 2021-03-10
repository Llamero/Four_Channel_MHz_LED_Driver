from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont
import qdarkstyle  # This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet
from collections import OrderedDict
import os
import pyqtgraph as pg
import guiMapper
import guiSequence as seq
import guiConfigIO as fileIO
import calibrationPlot as plot
import driverUSB
import statusWindow
import sys
from timeit import default_timer as timer
import pickle

DIAL_UPDATE_RATE = 0.05 #Time in ms between updates from dial when in manual control - prevents dial from locking GUI with continuous updates when dial is swept

class Ui(QtWidgets.QMainWindow):
    status_signal = QtCore.pyqtSignal(object) #Need to initialize outside of init() https://stackoverflow.com/questions/2970312/pyqt4-qtcore-pyqtsignal-object-has-no-attribute-connect

    def __init__(self, app):
        self.app = app
        super(Ui, self).__init__()

        #Initialize splash screen to show on load
        self.splash_dict = {"main": os.path.join(os.path.dirname(__file__), "Four Channel MHz LED Driver-main.png"),
                            "upload": os.path.join(os.path.dirname(__file__), "Four Channel MHz LED Driver-upload.png"),
                            "download": os.path.join(os.path.dirname(__file__), "Four Channel MHz LED Driver-download.png")}
        self.startup = True #Flag that program is in startup
        self.splash = QtWidgets.QSplashScreen(QtGui.QPixmap(self.splash_dict["main"]))
        self.splash.setFont(QFont('Arial', 15))
        self.splash.show()
        self.splash.showMessage("Loading program...", alignment=QtCore.Qt.AlignBottom, color=QtCore.Qt.white)

        # Set look and feel
        uic.loadUi('QtDesigner_GUI.ui', self)
        self.gui_state_file = 'gui_state.obj'
        self.initializeLookAndFeel()

        #Initialize message box
        self.message_box = QtWidgets.QMessageBox() # https://pythonbasics.org/pyqt-qmessagebox/
        self.message_box.setIcon(QtWidgets.QMessageBox.Warning)

        #Initialize signal that is emitted when a new status packet is received
        self.status_signal.connect(self.updateMain)

        # Map gui widgets to ordered dictionaries
        self.splash.showMessage("Initializing models...", alignment=QtCore.Qt.AlignBottom, color=QtCore.Qt.white)
        self.config_model = guiMapper.initializeConfigModel(self)
        self.sync_model = guiMapper.initializeSyncModel(self)
        self.main_model = guiMapper.initializeMainModel(self)
        self.intensity_delay_timer = timer() #Timer for delaying updates from intensity dial

        # Initialize status dictionaries
        self.status_dynamic_dict = OrderedDict([("Channel", 0),
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
        self.status_dict = OrderedDict(list(self.status_dynamic_dict.items()) + [("Name", 0),
                                                           ("COM Port", 0),
                                                           ("Serial", 0),
                                                           ("Control", 0)])
        self.status_window_list = []

       # Hide dummy widgets
        for channel in range(1, 5):
            for button in range(4):
                if channel <= button:
                    self.config_model["Channel" + str(channel)][button].setVisible(False)

        # Assign events to widgets
        self.ser = driverUSB.usbSerial(self)
        guiMapper.initializeEvents(self)
        fileIO.checkCurrentLimits(self)
        plot.initializeCalibrationPlot(self)
        self.splash.showMessage("Searching for connected drivers...", alignment=QtCore.Qt.AlignBottom, color=QtCore.Qt.white)
        self.ser.getDriverPort(True)
        if self.splash.isVisible():
            self.splash.finish(self)
        self.startup = False #Set flag to exiting startup
        self.show()

    def initializeLookAndFeel(self):
        try:
            with open(self.gui_state_file, "rb") as file:
                gui_skin_mode = pickle.load(file)
            print(gui_skin_mode)
            if gui_skin_mode == "dark":
                self.toggleSkin(self.menu_view_skins_dark, self.menu_view_skins_light, "dark")
            else:
                raise EOFError
        except EOFError: #Default to light skin if no made has been saved yet
            self.toggleSkin(self.menu_view_skins_light, self.menu_view_skins_dark, "light")

    def getValue(self, widget):
        if isinstance(widget, QtWidgets.QLineEdit):
            return widget.text()
        elif isinstance(widget, QtWidgets.QRadioButton) or isinstance(widget, QtWidgets.QCheckBox) or isinstance(
                    widget, QtWidgets.QPushButton):
            return widget.isChecked()
        elif isinstance(widget, QtWidgets.QSpinBox) or isinstance(widget, QtWidgets.QDoubleSpinBox) or isinstance(
                widget, QtWidgets.QSlider) or isinstance(widget, QtWidgets.QDial):
            return widget.value()
        elif isinstance(widget, QtWidgets.QToolBox):
            return widget.itemText(widget.currentIndex())
        elif isinstance(widget, list):
            if isinstance(widget[0], QtWidgets.QRadioButton) or isinstance(widget[0], QtWidgets.QPushButton):
                for element in widget:
                    if element.isChecked():
                        return element.text()

        elif isinstance(widget, QtWidgets.QTabWidget):
            return widget.tabText(widget.currentIndex())
        elif isinstance(widget, QtWidgets.QTableWidget):
            pass
        elif isinstance(widget, str) or widget is None:
            return str(widget)

    def setValue(self, widget, value):
        try:
            if isinstance(widget, QtWidgets.QLineEdit):
                widget.setText(str(value))
            elif isinstance(widget, QtWidgets.QRadioButton) or isinstance(widget, QtWidgets.QCheckBox) or isinstance(
                    widget, QtWidgets.QPushButton):
                widget.setChecked(bool(value))
            elif isinstance(widget, QtWidgets.QSpinBox) or isinstance(widget, QtWidgets.QDoubleSpinBox) or isinstance(
                    widget, QtWidgets.QSlider) or isinstance(widget, QtWidgets.QDial):
                widget.setValue(value)
            elif isinstance(widget, QtWidgets.QToolBox):
                for index in range(widget.count()):
                    if str(value) == widget.itemText(index):
                        widget.setCurrentIndex(index)
            elif isinstance(widget, list):
                if isinstance(widget[0], QtWidgets.QRadioButton) or isinstance(widget[0], QtWidgets.QPushButton):
                    for element in widget:
                        if element.text() == str(value):
                            element.setChecked(True)
            elif isinstance(widget, QtWidgets.QTabWidget):
                for index in range(widget.count()):
                    if value == widget.tabText(index):
                        widget.setCurrentIndex(index)
            elif isinstance(widget, QtWidgets.QTableWidget):
                pass
            elif isinstance(widget, str):
                seq.loadSequence()
        except ValueError:
            return False
        else:
            return True

    def createStatusWindow(self):
        self.status_window_list.append(statusWindow.statusWindow(self.app, self))
        self.status_window_list[len(self.status_window_list)-1].show()

    def updateSerialNumber(self, serial_number):
        self.configure_name_driver_serial_label2.setText(serial_number)
        self.main_model["Serial"].setText(serial_number)
        self.status_dict["Serial"] = serial_number

    def updateMain(self, status_dict):
        if self.getValue(self.main_model["Control"]) == "LED Driver": #If the LED driver is the input source, update GUI with driver status
            self.main_model["Channel"][status_dict["Channel"]].setChecked(True)
            if status_dict["Mode"] > 0:
                self.setValue(self.main_model["Mode"][0], 0) #Set slider to Manual
                status_list = list(status_dict.items())

                try:
                    self.setValue(self.main_model["Intensity"], (status_list[status_dict["Mode"]%2][1]/self.getAdcCurrentLimit(status_dict["Channel"]))*self.main_model["Intensity"].maximum())
                except (OverflowError, ZeroDivisionError): #This can happen when initializing connection - so default intensity to 0
                    self.setValue(self.main_model["Intensity"], 0)

            else:
                self.setValue(self.main_model["Mode"][0], 1) #Set slider to Sync

    def syncDisableMain(self, sync_active): #Disable manual control widgets if the sync is active
        self.main_model["Intensity"].setEnabled(not sync_active)
        self.main_intensity_spinbox.setReadOnly(sync_active)
        for widget in self.main_model["Mode"][1:4]:
            widget.setEnabled(not sync_active)

        if sync_active:
            for led_widget in self.main_model["Channel"]:
                led_widget.setEnabled(False)

        if not sync_active:
            software_control = self.getValue(self.main_model["Control"]) == "Software"
            self.toggleSoftwareControl(software_control)
            for led_number in range(1,5):
                self.toggleLedActive(led_number)


        self.ser.updateStatus()

    def toggleSkin(self, enable_widget, disable_widget, mode):
        enable_widget.setChecked(True)
        disable_widget.setChecked(False)
        if mode == "dark":
            self.app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt5())

        else:
            self.app.setStyleSheet("")
        with open(self.gui_state_file, "wb") as file:
            pickle.dump(mode, file)
        self.app.setFont(QFont("MS Shell Dlg 2", 12))


    def changeDriverName(self, widget):
        name = self.getValue(widget)
        self.main_model["Name"].setText(str(name))
        self.status_dict["Name"] = name


    def toggleLedActive(self, led_number):
        led_state = self.getValue(self.config_model["LED" + str(led_number)]["Active"])
        widget_list = [self.config_model["LED" + str(led_number)]["ID"], self.config_model["LED" + str(led_number)]["Current Limit"]]
        for channel in range(1,5):
            widget_list.append(eval("self.configure_LED_merge_channel" + str(channel) + "_button" + str(led_number) + ""))
        widget_list.append(self.sync_model["Digital"]["High"]["LED"][led_number])
        widget_list.append(self.sync_model["Digital"]["Low"]["LED"][led_number])
        widget_list.append(self.sync_model["Analog"]["LED"][led_number])
        widget_list.append(self.sync_model["Confocal"]["Image"]["LED"][led_number])
        widget_list.append(self.sync_model["Confocal"]["Flyback"]["LED"][led_number])
        widget_list.append(self.main_model["Channel"][led_number-1])
        for widget in widget_list:
            widget.setEnabled(led_state)

    def toggleResistorActive(self, resistor_number):
            resistor_state = self.getValue(self.config_model["Resistor" + str(resistor_number)]["Active"])
            self.config_model["Resistor" + str(resistor_number)]["Value"].setEnabled(resistor_state)
            fileIO.checkCurrentLimits(self)

    def changeLedName(self, led_number, widget):
        name = self.getValue(widget)
        widget_list = [self.main_model["Channel"][led_number-1],
                       self.sync_model["Digital"]["Low"]["LED"][led_number],
                       self.sync_model["Digital"]["High"]["LED"][led_number],
                       self.sync_model["Analog"]["LED"][led_number],
                       self.sync_model["Confocal"]["Image"]["LED"][led_number],
                       self.sync_model["Confocal"]["Flyback"]["LED"][led_number],
                       eval("self.configure_current_limit_LED" + str(led_number) + "_label")]
        for channel in range(1,5):
            widget_list.append(self.config_model["Channel" + str(channel)][led_number-1])

        for widget in widget_list:
            widget.setText(str(name))

    def toggleScanMode(self):
        scan_mode = self.getValue(self.sync_model["Confocal"]["Delay"]["Mode"])
        if scan_mode == "Unidirectional":
            self.sync_confocal_delay3_label1.setText("3) Time from LED event to trigger reset:")
            self.sync_confocal_delay3_label1.setToolTip("Set the additional time required for line sync trigger to reset after the LED event.")
            self.sync_confocal_delay3_box.setToolTip("Set the additional time required for line sync trigger to reset after the LED event.")
            self.sync_confocal_delay3_label2.setToolTip("Set the additional time required for line sync trigger to reset after the LED event.")
        else:
            self.sync_confocal_delay3_label1.setText("3) Bidirectional: Time between LED events:")
            self.sync_confocal_delay3_label1.setToolTip("Set the time between the forward scan LED event window and the reverse scan LED event window.")
            self.sync_confocal_delay3_box.setToolTip("Set the time between the forward scan LED event window and the reverse scan LED event window.")
            self.sync_confocal_delay3_label2.setToolTip("Set the time between the forward scan LED event window and the reverse scan LED event window.")


    def syncDialAndSpinbox(self, widget_in, widget_out, force = False):
        time = timer()
        if self.intensity_delay_timer < time or force:
            self.intensity_delay_timer = time + DIAL_UPDATE_RATE
            if isinstance(widget_in, QtWidgets.QDial):
                value = float(self.getValue(widget_in)) * 100.0 / float(widget_in.maximum())
                out_value = self.getValue(widget_out)
            else:
                value = round(self.getValue(widget_in) * widget_out.maximum() / 100)
                out_value = self.getValue(widget_out)

            if value != out_value:
                self.setValue(widget_out, value)
                if self.getValue(self.main_model["Control"][0]):
                    self.ser.updateStatus()

    def toggleAnalogChannel(self, widget):
        name = self.getValue(widget)
        if name == "Unbuffered - Current":
            enable = False
        else:
            enable = True
        for channel in range(4):
            self.sync_model["Analog"]["Channel"][channel].setEnabled(enable)

    def disableUsedOutputs(self, channel, source):
        if source == "sync":
            widget_list = self.config_model["Fan"]["Channel"]
        else:
            widget_list = self.sync_model["Output"]

        for index, button in enumerate(widget_list):
            if index == channel and channel != 0:
                button.setEnabled(False)
            else:
                button.setEnabled(True)

    def toggleSoftwareControl(self, software_enable):
        self.main_model["Intensity"].setEnabled(software_enable)
        self.main_model["Mode"][0].setEnabled(software_enable)
        self.main_model["Mode"][3].setEnabled(software_enable)
        self.main_intensity_spinbox.setReadOnly(not software_enable)

    def lockInterface(self, widget):
        self.gui_master_tab.setCurrentIndex(0) #Jump to main page before locking interface
        self.gui_master_tab.setEnabled(not widget.isChecked())

    def verifyCell(self, item):
        seq.verifyCell(self, item.column(), item.row(), item.text(), item.tableWidget())

    def waitCursor(self, override_cursor = True): #https://stackoverflow.com/questions/8218900/how-can-i-change-the-cursor-shape-with-pyqt
        if override_cursor:
            QtWidgets.QApplication.setOverrideCursor(QtCore.Qt.WaitCursor)
        else:
            QtWidgets.QApplication.restoreOverrideCursor()

    def startSplash(self, image):
        if self.startup:
            self.splash.showMessage("Downloading LED driver configuration...", alignment=QtCore.Qt.AlignBottom, color=QtCore.Qt.white)
        else:
            if self.splash.isVisible(): #Close the current splash screen if one is active
                self.splash.close()
            self.splash = QtWidgets.QSplashScreen(QtGui.QPixmap(self.splash_dict[image]))
            self.splash.setFont(QFont('Arial', 10))
            self.splash.show()

    def stopSplash(self):
        if self.splash.isVisible():
            self.splash.close()

    def splashText(self, text):
        if self.splash.isVisible() and not self.startup:
            self.splash.showMessage(text, alignment=QtCore.Qt.AlignBottom, color=QtCore.Qt.white)

    def setAdcCurrentLimit(self, value_list):
        for led_number, value in enumerate(value_list):
            self.config_model["LED" + str(led_number+1)]["Current Limit"].setWhatsThis(str(value))

    def getAdcCurrentLimit(self, led_number):
        try:
            return int(self.config_model["LED" + str(led_number+1)]["Current Limit"].whatsThis())
        except ValueError:
            return 0.01
