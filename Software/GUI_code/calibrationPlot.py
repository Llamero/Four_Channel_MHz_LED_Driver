from PyQt5 import QtCore, QtGui, QtWidgets
from pyqtgraph import PlotWidget
import pyqtgraph as pg
import numpy as np
from collections import deque

sample_rate = 1.252
x_data = [x/sample_rate for x in range(1600)]
n_samples = round(1000*sample_rate) #Number of ADC samples to include in plot
offset = 5 #Number of samples to offset from start to let ADC stabilize
x_line = [0, n_samples / sample_rate]
rolling_average_window = 10

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
    plot.setXRange(0, n_samples/sample_rate, padding=0)
    plot.getAxis('bottom').setTickSpacing(200, 200)

    # Initialize y_data before setCalibrationScale is called
    gui.calibration_y_data = np.zeros(n_samples + offset)

    # Initialize rolling average buffer (stores last N waveforms)
    gui.calibration_rolling_buffer = deque(maxlen=rolling_average_window)

    # Create persistent plot curves
    gui.calibration_curve_limit = plot.plot(pen=pg.mkPen('m', width=1))
    gui.calibration_curve_data  = plot.plot(pen=pg.mkPen('g', width=1), connect="finite")
    setCalibrationScale(gui)

    # Create dashed yellow pen
    dashed_yellow_pen = pg.mkPen(
        color=(255, 255, 0, 100),  # Subtle yellow
        width=1,
        style=QtCore.Qt.DashLine
    )

    # Add vertical lines - these will never be cleared
    gui.vline_100 = pg.InfiniteLine(pos=200, angle=90, pen=dashed_yellow_pen, movable=False)
    gui.vline_800 = pg.InfiniteLine(pos=800, angle=90, pen=dashed_yellow_pen, movable=False)
    plot.addItem(gui.vline_100)
    plot.addItem(gui.vline_800)

    # Call updatePlot with zeros to initialize all curves
    updatePlot(gui, np.zeros(n_samples + offset))
    setRollingAverage(gui)

def activeCurrent(gui):
    #Get current limit of active LED
    for led_number in range(1,5):
        widget = eval("gui.main_channel_LED" + str(led_number) + "_button")
        if gui.getValue(widget):
            return gui.getValue(gui.config_model["LED" + str(led_number)]["Current Limit"]) * gui.getValue(gui.calibration_current_box) / 100  # Return current limit * scale
    else:
        return None

def setCalibrationScale(gui):
    current = activeCurrent(gui)
    gui.calibration_plot_window.setYRange(0, current * 1.2, padding=0)

    # Call updatePlot with zeros to initialize all curves
    updatePlot(gui, gui.calibration_y_data)

def setRollingAverage(gui):
    # Create new deque with new maxlen, preserving existing data
    window_size = gui.getValue(gui.calibration_avg_box)
    gui.calibration_rolling_buffer = deque(gui.calibration_rolling_buffer, maxlen=window_size)

def startAnimation(gui, timeline):
    lockTabWidget(gui, True)
    timeline.setFrameRange(0, 144)
    setCalibrationScale(gui)
    timeline.frameChanged.connect(lambda: gui.ser.driverCalibration())
    timeline.start()
    gui.calibration_run_button.clicked.disconnect()
    gui.calibration_run_button.setText("Stop")
    gui.calibration_run_button.clicked.connect(lambda: stopAnimation(gui, timeline))

def stopAnimation(gui, timeline):
    lockTabWidget(gui, False)
    timeline.stop()
    gui.ser.updateStatus() #Return the driver to the original status
    gui.calibration_run_button.setText("Run")
    gui.calibration_run_button.clicked.connect(lambda: startAnimation(gui, timeline))

def updatePlot(gui, y_data):
    current = activeCurrent(gui)
    y_line = [current, current]

    # Add latest waveform to rolling buffer
    y_data = [item * 1.04 for item in y_data]
    gui.calibration_rolling_buffer.append(y_data[offset:n_samples + offset])

    # Calculate rolling average across all waveforms in buffer
    rolling_avg = np.mean(gui.calibration_rolling_buffer, axis=0)

    # Update data without clearing - InfiniteLines are preserved
    gui.calibration_curve_limit.setData(x_line, y_line)
    gui.calibration_curve_data.setData(x_data[:n_samples], rolling_avg)

def lockTabWidget(gui, lock):
    for tab_index in range(gui.gui_master_tab.count()):
        tab_name = gui.gui_master_tab.tabText(tab_index)
        tab_enable = not lock
        if tab_name != "Calibration":
            gui.gui_master_tab.setTabEnabled(tab_index, tab_enable)
        else:
            gui.gui_master_tab.setTabEnabled(tab_index, True)


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
