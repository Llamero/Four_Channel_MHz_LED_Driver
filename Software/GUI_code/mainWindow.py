from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont
import \
    qdarkstyle  # This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet
from collections import OrderedDict
import csv
import tempfile
import usbThread


class Ui(QtWidgets.QMainWindow):
    def __init__(self, app):
        self.app = app
        super(Ui, self).__init__()

        # Set look and feel
        uic.loadUi('QtDesigner_GUI.ui', self)
        self.menu_view_dark_mode.triggered.connect(self.test)
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
        # self.loadSequence(self.sync_confocal_image_sequence_table)
        self.sync_confocal_image_sequence_save_button.clicked.connect(lambda: self.saveSequence(self.sync_confocal_image_sequence_table))
        print(self.getValue(self.config_model["Fan"]["Driver"]["Min"]))
        self.show()

    def test(self):
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

    def loadSequence(self, widget): # derived from - https://stackoverflow.com/questions/12608835/writing-a-qtablewidget-to-a-csv-or-xls
        path = QtGui.QFileDialog.getOpenFileName(
                self, 'Open File', '', 'CSV(*.csv)')
        if path[0] != "":
            # Count number of rows in CSV file
            with open(str(path[0]), 'r') as stream:
                widget_headers = self.verifySequence(stream, widget)

            # Import csv file
            if widget_headers:
                with open(str(path[0]), 'r') as stream:
                    reader = csv.reader(stream)

                    # Remove header from stream
                    next(reader, None)

                    # Clear table
                    widget.setRowCount(0)
                    for row_data in csv.reader(stream):
                        row = widget.rowCount()
                        widget.insertRow(row)
                        for column, data in enumerate(row_data):
                            if column < len(widget_headers):
                                item = QtGui.QTableWidgetItem(str(data))
                                widget.setItem(row, column, item)

                widget.insertRow(row+1) # Add one more empty row to allow for editing




    def saveSequence(self, widget): # derived from - https://stackoverflow.com/questions/12608835/writing-a-qtablewidget-to-a-csv-or-xls
        path = QtGui.QFileDialog.getSaveFileName(
                self, 'Save File', '', 'CSV(*.csv)')
        if path[0] != "":
            widget_header_obj = [widget.horizontalHeaderItem(c) for c in range(widget.columnCount())]
            widget_headers = [x.text() for x in widget_header_obj if x is not None]
            with tempfile.TemporaryFile(mode="w+", suffix=".csv", newline='') as stream: # "newline=''" removes extra newline from windows - https://stackoverflow.com/questions/3191528/csv-in-python-adding-an-extra-carriage-return-on-windows
                writer = csv.writer(stream)
                writer.writerow(widget_headers)
                for row in range(widget.rowCount()):
                    row_data = [None]*len(widget_headers)
                    for column in range(widget.columnCount()):
                        item = widget.item(row, column)
                        if item is not None:
                            row_data[column] = str(item.text())
                        else:
                            break
                    else:
                        writer.writerow(row_data)
                        continue
                    break
                widget_headers = self.verifySequence(stream, widget)

    def verifySequence(self, stream, widget):
        stream.seek(0)
        row_count = sum(1 for row in csv.reader(stream))

        # Verify CSV file
        stream.seek(0)
        reader = csv.reader(stream)

        # Verify CSV header
        csv_headers = next(reader, None)
        widget_header_obj = [widget.horizontalHeaderItem(c) for c in range(widget.columnCount())]
        widget_headers = [x.text() for x in widget_header_obj if x is not None]
        print(csv_headers)
        if csv_headers is not None and row_count > 1 and len(csv_headers) >= len(widget_headers):
            for column, data in enumerate(widget_headers):
                if csv_headers[column] != data and column < 4:
                    self.message_box.setText(
                        "Error: CSV header \"" + data + "\" does not match table header \"" + widget_headers[
                            column] + "\". Import aborted.")
                    self.message_box.exec()
                    return False
        else:
            self.message_box.setText("Error: CSV file is empty or only contains headers, import aborted.")
            self.message_box.exec()
            return False

        # Verify csv file data
        for row, row_data in enumerate(reader):
            if len(widget_headers) > len(row_data):
                self.message_box.setText(
                    "Error: Row #" + str(row + 1) + " has only " + str(len(row_data)) + " cells. At least " + str(
                        len(widget_headers)) + " cells are required.  Import aborted.")
                self.message_box.exec()
                return False
            for column, data in enumerate(row_data):
                if column < len(widget_headers):
                    try:
                        data = float(data)
                    except:
                        self.message_box.setText(
                            "Error: \"" + str(data) + "\" at row #" + str(row + 1) + " is not a number. Import aborted.")
                        self.message_box.exec()
                        return False
                if column == 0:
                    if data not in [0, 1, 2, 3, 4]:
                        self.message_box.setText("Error: \"" + str(data) + "\" at row #" + str(
                            row + 1) + " is not a valid LED integer (0-4). Import aborted.")
                        self.message_box.exec()
                        return False
                elif column in [1, 2]:
                    if data < 0 or data > 100 or data is None:
                        self.message_box.setText("Error: \"" + str(data) + "\" at row #" + str(
                            row + 1) + " is not a valid percentage (0-100). Import aborted.")
                        self.message_box.exec()
                        return False
                elif column == 3:
                    if (data < 10e-6 and data != 0) or data > 3600 or data is None:
                        self.message_box.setText("Error: \"" + str(data) + "\" at row #" + str(
                            row + 1) + " is not a valid duration (0 or 0.00001-3600). Import aborted.")
                        self.message_box.exec()
                        return False
        return widget_headers
