from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont
import qdarkstyle #This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet
from collections import OrderedDict
import os
import usbThread



class Ui(QtWidgets.QMainWindow):
    def __init__(self, app):
        self.app = app
        super(Ui, self).__init__()

        #Set look and feel
        uic.loadUi('QtDesigner_GUI.ui', self)
        self.menu_view_dark_mode.triggered.connect(self.test)
        self.app.setStyleSheet("")
        self.app.setFont(QFont("MS Shell Dlg 2", 12))

        #Hide dummy widgets
        for channel in range (1,5):
            for button in range(1, 5):
                if channel < button:
                    widget = eval("self.configure_LED_merge_channel" + str(channel) + "_button" + str(button))
                    widget.setVisible(False)

        self.config_model = OrderedDict()
        self.initializeModel()
        widget = self.config_model["Temperature"]["Transistor"]["Warn"]
        if isinstance(widget, QtWidgets.QLineEdit):
            print(widget.text())
        elif isinstance(widget, QtWidgets.QRadioButton) or isinstance(widget, QtWidgets.QCheckBox):
            print(widget.isChecked())
        elif isinstance(widget, QtWidgets.QSpinBox) or isinstance(widget, QtWidgets.QDoubleSpinBox):
            print(widget.value())
        self.show()

    def test(self):
        if self.menu_view_dark_mode.isChecked():
            self.app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt5())

        else:
            self.app.setStyleSheet("")

        self.app.setFont(QFont("MS Shell Dlg 2", 12))

    def initializeModel(self):
        self.config_model["Driver name"] = self.configure_name_driver_line_edit
        for led_number in range(1,5):
            self.config_model["LED" + str(led_number)] = OrderedDict(
                [("ID", eval("self.configure_name_LED" + str(led_number) + "_line_edit")), ("Active", eval("self.configure_name_LED" + str(led_number) + "_box")),
                 ("Current limit", eval("self.configure_current_limit_LED" + str(led_number) + "_spin_box")), ("Channels", [
                    eval("self.configure_LED_merge_channel1_button" + str(led_number)),
                    eval("self.configure_LED_merge_channel2_button" + str(led_number)),
                    eval("self.configure_LED_merge_channel3_button" + str(led_number)),
                    eval("self.configure_LED_merge_channel4_button" + str(led_number))])])
        for resistor in range(1,5):
            self.config_model["Resistor" + str(resistor)] = OrderedDict(
                [("Value", eval("self.configure_resistor" + str(resistor) + "_spin_box")),
                 ("Active", eval("self.configure_resistor" + str(resistor) + "_box"))])
        self.config_model["Temperature"] = OrderedDict()
        for source in ["Transistor", "Resistor", "External"]:
            self.config_model["Temperature"][source] = OrderedDict([("Warn", eval("self.configure_temperature_" + source.lower() + "_warn_box")), ("Fault", eval("self.configure_temperature_" + source.lower() + "_fault_box"))])
