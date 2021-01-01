from PyQt5 import QtWidgets
import sys
import mainWindow

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = mainWindow.Ui(app)
    app.exec_()