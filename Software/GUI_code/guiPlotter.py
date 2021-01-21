from PyQt5 import QtCore, QtGui, QtWidgets
from pyqtgraph import PlotWidget
import pyqtgraph as pg
import numpy as np
from collections import deque

def initializeCalibrationPlot(gui):
    plot = gui.calibration_plot_window

    #Set look and feel
    default_font = QtGui.QFontInfo(gui.app.font())
    pg.setConfigOption('background', 'k')
    pg.setConfigOption('foreground', '#999')
    pg.setConfigOptions(antialias=True)
    label_style = {"color": "#999", "font-size": str(default_font.pointSize()) + "pt", "font-style": str(default_font.family())}
    plot.setLabel('left', "LED Current ", "A", **label_style)
    plot.setLabel('bottom', "Time (µs)", **label_style)

    #Use invisible axes to add margins to plot
    plot.showAxis("top")
    plot.getAxis('top').setPen('k', width=2)
    plot.getAxis('top').setTextPen('k', width=2)
    plot.showAxis("right")
    plot.getAxis('right').setPen('k', width=2)
    plot.getAxis('right').setTextPen('k', width=2)

    #Set
    plot.setXRange(0, 1440, padding=0)
    setCalibrationScale(gui)
    plot.getAxis('bottom').setTickSpacing(200, 200)

def activeCurrent(gui):
    #Get current limit of active LED
    led_list = []
    for led_number in range(1,5):
        led_list.append(eval("gui.main_channel_LED" + str(led_number) + "_button"))
    active_led = gui.getValue(led_list)[-1]
    return gui.getValue(gui.config_model["LED" + active_led]["Current Limit"])*gui.getValue(gui.calibration_current_box)/100 #Return current limit * scale

def setCalibrationScale(gui):
    current = activeCurrent(gui)
    gui.calibration_plot_window.setYRange(0, current * 1.2, padding=0)
    xlim = gui.calibration_plot_window.getViewBox().state["targetRange"][0][1]
    x = [0, xlim]
    y = [current, current]

def startAnimation(gui, timeline):
    timeline.setFrameRange(0, 720)
    timeline.frameChanged.connect(lambda: updatePlot(gui, timeline))
    timeline.start()





def updatePlot(gui, timeline):
    interval = timeline.frameCount()
    current = activeCurrent(gui)
    x_line = [0, 1440]
    y_line = [current, current]
    x_de = [x for x in range(1440)]
    y_de = deque([None]*1440)
    for x in x_de:
        period = 200
        if x%period < period/2:
            y_de[x] = 0.5
        else:
            y_de[x] = 0
    print(interval)
    y_de.rotate(interval)
    gui.calibration_plot_window.plot(x_de, y_de, pen=pg.mkPen('g', width=1), clear=True)
    gui.calibration_plot_window.plot(x_line, y_line, pen=pg.mkPen('m', width=1))




    # self.graphicsView.setObjectName("graphicsView")
    # self.splitter = QtWidgets.QSplitter(Dialog)
    # self.splitter.setGeometry(QtCore.QRect(10, 950, 1631, 41))
    # self.splitter.setOrientation(QtCore.Qt.Horizontal)
    # self.splitter.setObjectName("splitter")
    # self.pushButton = QtWidgets.QPushButton(self.splitter)
    # self.pushButton.setObjectName("pushButton")
    # self.pushButton_2 = QtWidgets.QPushButton(self.splitter)
    # self.pushButton_2.setObjectName("pushButton_2")
    #
    # self.retranslateUi(Dialog)
    # QtCore.QMetaObject.connectSlotsByName(Dialog)
    # self.pushButton.clicked.connect(self.draw)
    # self.pushButton_2.clicked.connect(self.clear)
    #
    # #        self.graphicsView.getAxis('bottom').setPen('w', width=2)
    # #        self.graphicsView.getAxis('left').setPen('w', width=2)
    # self.graphicsView.getAxis("bottom").setStyle(tickFont=self.font)
    # self.graphicsView.getAxis("left").setStyle(tickFont=self.font)
    # self.graphicsView.getAxis("bottom").setStyle(tickTextOffset=20)
    # self.graphicsView.getAxis("left").setStyle(tickTextOffset=20)
    # self.graphicsView.setLabel('bottom', "Time (µs)", **self.label_style)
    # self.graphicsView.setLabel('left', "LED Current (A)", **self.label_style)
    #

    #
