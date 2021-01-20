from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont
import qdarkstyle  # This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet
from collections import OrderedDict
import guiMapper
import guiSequence as seq
import guiConfigIO as fileIO
import usbThread


class Ui(QtWidgets.QMainWindow):
    def __init__(self, app):
        self.app = app
        super(Ui, self).__init__()

        # Set look and feel
        uic.loadUi('QtDesigner_GUI.ui', self)
        self.app.setStyleSheet("")
        self.app.setFont(QFont("MS Shell Dlg 2", 12))

        #Initialize message box
        self.message_box = QtWidgets.QMessageBox() # https://pythonbasics.org/pyqt-qmessagebox/
        self.message_box.setIcon(QtWidgets.QMessageBox.Warning)

        # Hide dummy widgets
        for channel in range(1, 5):
            for button in range(1, 5):
                if channel < button:
                    widget = eval("self.configure_LED_merge_channel" + str(channel) + "_button" + str(button))
                    widget.setVisible(False)

        # Map gui widgets to ordered dictionaries
        self.config_model = guiMapper.initializeConfigModel(self)
        self.sync_model = guiMapper.initializeSyncModel(self)

        # Assign events to widgets
        guiMapper.initializeEvents(self)
        fileIO.checkCurrentLimits(self)
        print(self.getValue(self.sync_model["Digital"]["Low"]["LED"]))
        self.show()

    def toggleSkin(self):
        if self.menu_view_dark_mode.isChecked():
            self.app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt5())

        else:
            self.app.setStyleSheet("")

        self.app.setFont(QFont("MS Shell Dlg 2", 12))

    def getValue(self, widget):
        if isinstance(widget, QtWidgets.QLineEdit):
            return widget.text()
        elif isinstance(widget, QtWidgets.QRadioButton) or isinstance(widget, QtWidgets.QCheckBox):
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
            elif isinstance(widget, QtWidgets.QRadioButton) or isinstance(widget, QtWidgets.QCheckBox):
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

    def changeDriverName(self, widget):
        name = self.getValue(widget)
        self.main_driver_name_label2.setText(str(name))

    def toggleLedActive(self, led_number):
        led_state = self.getValue(self.config_model["LED" + str(led_number)]["Active"])
        widget_list = [self.config_model["LED" + str(led_number)]["ID"], self.config_model["LED" + str(led_number)]["Current limit"]]
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
                       eval("self.sync_digital_trigger_low_constant_LED" + str(led_number) + "_button"),
                       eval("self.sync_digital_trigger_high_constant_LED" + str(led_number) + "_button"),
                       eval("self.sync_analog_LED" + str(led_number) + "_button"),
                       eval("self.sync_confocal_image_constant_LED" + str(led_number) + "_button"),
                       eval("self.sync_confocal_flyback_constant_LED" + str(led_number) + "_button"),
                       eval("self.configure_current_limit_LED" + str(led_number) + "_label")]
        for channel in range(1,5):
            widget_list.append(eval("self.configure_LED_merge_channel" + str(channel) + "_button" + str(led_number) + ""))

        for widget in widget_list:
            widget.setText(str(name))

    def toggleScanMode(self):
        unidirectional = self.getValue(self.sync_confocal_scan_unidirectional_button)
        if unidirectional:
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
        for channel in range(1,5):
            button = eval("self.sync_analog_input" + str(channel) + "_button")
            button.setEnabled(enable)

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





