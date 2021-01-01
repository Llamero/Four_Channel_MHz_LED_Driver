from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont, QPalette, QColor
import qdarkstyle #This awesome style sheet was made by Colin Duquesnoy and Daniel Cosmo Pizetta - https://github.com/ColinDuquesnoy/QDarkStyleSheet

class Ui(QtWidgets.QMainWindow):
    def __init__(self, app):
        self.app = app
        super(Ui, self).__init__()
        print(QtWidgets.QStyleFactory.keys())
        uic.loadUi('QtDesigner_GUI.ui', self)
        self.menu_view_dark_mode.triggered.connect(self.test)
        self.app.setStyleSheet("")
        self.app.setFont(QFont("MS Shell Dlg 2", 12))
        self.show()

    def test(self):
        if(self.menu_view_dark_mode.isChecked()):
            self.app.setStyleSheet(qdarkstyle.load_stylesheet_pyqt5())

        else:
            self.app.setStyleSheet("")

        self.app.setFont(QFont("MS Shell Dlg 2", 12))



