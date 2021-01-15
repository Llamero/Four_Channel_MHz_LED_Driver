from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont
import qdarkstyle  # This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet
from collections import OrderedDict
import guiSequence as seq
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

        # Hide dummy widgets
        for channel in range(1, 5):
            for button in range(1, 5):
                if channel < button:
                    widget = eval("self.configure_LED_merge_channel" + str(channel) + "_button" + str(button))
                    widget.setVisible(False)

        self.config_model = OrderedDict()
        self.sync_model = OrderedDict()
        self.initializeConfigModel()
        self.menu_view_dark_mode.triggered.connect(self.toggleSkin)
        # self.loadSequence(self.sync_confocal_image_sequence_table)
        self.sync_confocal_image_sequence_save_button.clicked.connect(lambda: seq.saveSequence(self, self.sync_confocal_image_sequence_table))
        self.sync_confocal_image_sequence_load_button.clicked.connect(lambda: seq.loadSequence(self, self.sync_confocal_image_sequence_table))
        print(self.getValue(self.config_model["Fan"]["Driver"]["Min"]))
        self.show()

    def toggleSkin(self):
        if self.menu_view_dark_mode.isChecked():
            self.app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt5())

        else:
            self.app.setStyleSheet("")

        self.app.setFont(QFont("MS Shell Dlg 2", 12))

    def initializeConfigModel(self):
        self.config_model["Driver name"] = self.configure_name_driver_line_edit
        # LEDs
        for led_number in range(1, 5):
            self.config_model["LED" + str(led_number)] = OrderedDict(
                [("ID", eval("self.configure_name_LED" + str(led_number) + "_line_edit")),
                 ("Active", eval("self.configure_name_LED" + str(led_number) + "_box")),
                 ("Current limit", eval("self.configure_current_limit_LED" + str(led_number) + "_spin_box")),
                 ("Channels", [
                     eval("self.configure_LED_merge_channel1_button" + str(led_number)),
                     eval("self.configure_LED_merge_channel2_button" + str(led_number)),
                     eval("self.configure_LED_merge_channel3_button" + str(led_number)),
                     eval("self.configure_LED_merge_channel4_button" + str(led_number))])])
        # Current sense resistors
        for resistor in range(1, 5):
            self.config_model["Resistor" + str(resistor)] = OrderedDict(
                [("Value", eval("self.configure_resistor" + str(resistor) + "_spin_box")),
                 ("Active", eval("self.configure_resistor" + str(resistor) + "_box"))])

        # Temperature cutoffs
        self.config_model["Temperature"] = OrderedDict()
        for source in ["Transistor", "Resistor", "External"]:
            self.config_model["Temperature"][source] = OrderedDict(
                [("Warn", eval("self.configure_temperature_" + source.lower() + "_warn_box")),
                 ("Fault", eval("self.configure_temperature_" + source.lower() + "_fault_box"))])

        # Fan settings
        self.config_model["Fan"] = OrderedDict()
        for source in ["Driver", "External"]:
            self.config_model["Fan"][source] = OrderedDict(
                [("Min", eval("self.configure_fan_" + source.lower() + "_min_box")),
                 ("Max", eval("self.configure_fan_" + source.lower() + "_max_box"))])
        self.config_model["Fan"]["Channel"] = [self.configure_fan_external_output1_box, self.configure_fan_external_output2_box, self.configure_fan_external_output3_box]

        # External Thermistor
        self.config_model["Thermistor"] = OrderedDict([("Resistance", self.configure_thermistor_resistance_box), ("Beta", self.configure_thermistor_beta_box)])

        # Audio settings
        self.config_model["Audio"] = OrderedDict([("Status", self.configure_audio_status_slider), ("Alarm", self.configure_audio_alarm_slider)])

        # Pushbuttons
        self.config_model["Pushbutton"] = OrderedDict([("Intensity", self.configure_pushbutton_intensity_slider),
                                                       ("Alarm", [self.configure_pushbutton_alarm_flash_button, self.configure_pushbutton_alarm_chase_button,
                                                                  self.configure_pushbutton_alarm_pulse_button, self.configure_pushbutton_alarm_solid_button])])

    def getValue(self, widget):
        if isinstance(widget, QtWidgets.QLineEdit):
            return widget.text()
        elif isinstance(widget, QtWidgets.QRadioButton) or isinstance(widget, QtWidgets.QCheckBox):
            return widget.isChecked()
        elif isinstance(widget, QtWidgets.QSpinBox) or isinstance(widget, QtWidgets.QDoubleSpinBox) or isinstance(
                widget, QtWidgets.QSlider) or isinstance(widget, QtWidgets.QDial):
            return widget.value()
        elif isinstance(widget, QtWidgets.QTableWidget):
            pass

    def setValue(self, widget, value):
        if isinstance(widget, QtWidgets.QLineEdit):
            return widget.setText(value)
        elif isinstance(widget, QtWidgets.QRadioButton) or isinstance(widget, QtWidgets.QCheckBox):
            return widget.setChecked(value)
        elif isinstance(widget, QtWidgets.QSpinBox) or isinstance(widget, QtWidgets.QDoubleSpinBox) or isinstance(
                widget, QtWidgets.QSlider) or isinstance(widget, QtWidgets.QDial):
            return widget.setValue(value)


