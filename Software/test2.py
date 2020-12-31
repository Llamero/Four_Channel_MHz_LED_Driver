from PyQt5 import QtGui, QtCore, QtWidgets, uic
from PyQt5.QtGui import QFont, QPalette, QColor
import qtmodern.styles
import qtmodern.windows
import sys

class Ui(QtWidgets.QMainWindow):
    def __init__(self, app):
        self.app = app
        super(Ui, self).__init__()
        print(QtWidgets.QStyleFactory.keys())
        uic.loadUi('QtDesigner_GUI.ui', self)
        self.menu_view_dark_mode.triggered.connect(self.test)
        qtmodern.styles.light(app)
        self.app.setStyleSheet("")
        self.app.setStyle(QtWidgets.QStyleFactory.create("windowsvista"))
        self.app.setFont(QFont("MS Shell Dlg 2", 12))
        self.show()

    def test(self):
        if(self.menu_view_dark_mode.isChecked()):
            qtmodern.styles.dark(app)

        else:
            qtmodern.styles.light(app)
            self.app.setStyleSheet("")
            self.app.setStyle(QtWidgets.QStyleFactory.create("windowsvista"))

        self.app.setFont(QFont("MS Shell Dlg 2", 12))

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = Ui(app)
    app.exec_()