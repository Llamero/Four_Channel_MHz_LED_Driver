from PyQt5 import QtWidgets
import sys
import mainWindow
import guiResources

if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    window = mainWindow.Ui(app)
    app.exec_()
    window.ser.disconnectSerial() #Cleanly disconnect serial on close
    sys.exit()