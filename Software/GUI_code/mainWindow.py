from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont
import qdarkstyle  # This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet
from collections import OrderedDict
import os
import pyqtgraph as pg
import guiMapper
import guiSequence as seq
import guiConfigIO as fileIO
import guiPlotter as plot
import driverUSB
import statusWindow

class Ui(QtWidgets.QMainWindow):
    def __init__(self, app):
        self.app = app
        super(Ui, self).__init__()
        self.splash_dict = {"main": os.path.join(os.path.dirname(__file__), "Four Channel MHz LED Driver-main.png"),
                            "upload": os.path.join(os.path.dirname(__file__), "Four Channel MHz LED Driver-upload.png"),
                            "download": os.path.join(os.path.dirname(__file__), "Four Channel MHz LED Driver-download.png")}
        self.startup = True #Flag that program is in startup
        self.splash = QtWidgets.QSplashScreen(QtGui.QPixmap(self.splash_dict["main"]))
        self.splash.setFont(QFont('Arial', 15))
        self.splash.show()
        self.splash.showMessage("Loading program...", alignment=QtCore.Qt.AlignBottom, color=QtCore.Qt.white)
        self.status = statusWindow.statusWindow(self.app, self)
        self.status.show()
        # Set look and feel
        uic.loadUi('QtDesigner_GUI.ui', self)
        self.app.setStyleSheet("")
        self.app.setFont(QFont("MS Shell Dlg 2", 12))

        #Initialize message box
        self.message_box = QtWidgets.QMessageBox() # https://pythonbasics.org/pyqt-qmessagebox/
        self.message_box.setIcon(QtWidgets.QMessageBox.Warning)

        # Map gui widgets to ordered dictionaries
        self.splash.showMessage("Initializing models...", alignment=QtCore.Qt.AlignBottom, color=QtCore.Qt.white)
        self.config_model = guiMapper.initializeConfigModel(self)
        self.sync_model = guiMapper.initializeSyncModel(self)

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
            if isinstance(widget[0], QtWidgets.QRadioButton):
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
                if isinstance(widget[0], QtWidgets.QRadioButton):
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
    def updateSerialNumber(self, serial_number):
        self.configure_name_driver_serial_label2.setText(serial_number)
        self.main_driver_serial_label2.setText(serial_number)


    def toggleSkin(self, enable_widget, disable_widget, mode):
        enable_widget.setChecked(True)
        disable_widget.setChecked(False)
        if mode == "dark":
            self.app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt5())

        else:
            self.app.setStyleSheet("")

        self.app.setFont(QFont("MS Shell Dlg 2", 12))

    def changeDriverName(self, widget):
        name = self.getValue(widget)
        self.main_driver_name_label2.setText(str(name))

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
        widget_list.append(eval("self.main_channel_LED" + str(led_number) + "_button"))
        for widget in widget_list:
            widget.setEnabled(led_state)

    def toggleResistorActive(self, resistor_number):
            resistor_state = self.getValue(self.config_model["Resistor" + str(resistor_number)]["Active"])
            self.config_model["Resistor" + str(resistor_number)]["Value"].setEnabled(resistor_state)
            fileIO.checkCurrentLimits(self)

    def changeLedName(self, led_number, widget):
        name = self.getValue(widget)
        widget_list = [eval("self.main_channel_LED" + str(led_number) + "_button"),
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
            self.sync_confocal_delay3_label1.setText("3) From flyback to line trigger reset:")
            self.sync_confocal_delay3_label1.setToolTip("Set the additional time required for line sync trigger to reset after the flyback window.")
            self.sync_confocal_delay3_box.setToolTip("Set the additional time required for line sync trigger to reset after the flyback window.")
        else:
            self.sync_confocal_delay3_label1.setText("3) Bidirectional: time between windows:")
            self.sync_confocal_delay3_label1.setToolTip("Set the time required for the scan to traverse the FOV (i.e. the end of one flyback to the start of another).")
            self.sync_confocal_delay3_box.setToolTip("Set the time required for the scan to traverse the FOV (i.e. the end of one flyback to the start of another).")

    def syncDialAndSpinbox(self, widget_in, widget_out):
        if isinstance(widget_in, QtWidgets.QDial):
            value = float(self.getValue(widget_in)) * 100.0 / float(widget_in.maximum())
            out_value = self.getValue(widget_out)
        else:
            value = round(self.getValue(widget_in) * widget_out.maximum() / 100)
            out_value = self.getValue(widget_out)

        if value != out_value:
            self.setValue(widget_out, value)

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
        self.main_intensity_dial.setEnabled(software_enable)
        self.main_toggle_slider.setEnabled(software_enable)
        self.main_intensity_spinbox.setReadOnly(not software_enable)


    def lockInterface(self, widget):
        self.gui_master_tab.setCurrentIndex(0) #Jump to main page before locking interface
        self.gui_master_tab.setEnabled(not widget.isChecked())

    def updateActiveLED(self, led_number):
        plot.setCalibrationScale(self)

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
