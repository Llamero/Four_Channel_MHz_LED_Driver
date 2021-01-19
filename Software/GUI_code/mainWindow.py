from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont
import qdarkstyle  # This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet
from collections import OrderedDict
import guiMapper
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
                widget.setValue(float(value))
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


    def toggleLedActive(self, led_number):
        led_state = self.getValue(self.config_model["LED" + str(led_number)]["Active"])
        widget_list = [self.config_model["LED" + str(led_number)]["ID"], self.config_model["LED" + str(led_number)]["Current limit"]]
        widget_list += self.config_model["LED" + str(led_number)]["Channels"]
        widget_list.append(self.sync_model["Digital"]["High"]["LED"][led_number])
        widget_list.append(self.sync_model["Digital"]["Low"]["LED"][led_number])
        widget_list.append(self.sync_model["Analog"]["LED"][led_number])
        widget_list.append(self.sync_model["Confocal"]["Image"]["LED"][led_number])
        widget_list.append(self.sync_model["Confocal"]["Flyback"]["LED"][led_number])
        for widget in widget_list:
            widget.setEnabled(led_state)




