#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      Ben
#
# Created:     14/11/2020
# Copyright:   (c) Ben 2020
# Licence:     <your licence>
#-------------------------------------------------------------------------------
# Code adapted from: https://pythonprogramming.net/embedding-live-matplotlib-graph-tkinter-gui/
# The code for changing pages was derived from: http://stackoverflow.com/questions/7546050/switch-between-two-frames-in-tkinter
# License: http://creativecommons.org/licenses/by-sa/3.0/

import matplotlib
matplotlib.use("TkAgg")
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2Tk
from matplotlib.figure import Figure
import matplotlib.animation as animation
from matplotlib import style
import serial
import struct
import tkinter as tk
from tkinter import ttk
import math


LARGE_FONT= ("Verdana", 12)
style.use("ggplot")
f = Figure(figsize=(5,5), dpi=100)
a = f.add_subplot(111)
a.axis((0,1440,-0.1,1.1))
a.set_xlabel("Time (µs)")
a.set_ylabel("LED Current (A)")
x = list(range(1600))
x = [num *0.9 for num in x]
l2, = a.plot(x, list(range(1600)))
GUI_state = 0


class SeaofBTCapp(tk.Tk):
    ser = 0
    def __init__(self, ser, *args, **kwargs):
        global f
        self.ser = ser
        tk.Tk.__init__(self, *args, **kwargs)

#        tk.Tk.iconbitmap(self, default="clienticon.ico")
#        tk.Tk.wm_title(self, "Sea of BTC client")

        container = tk.Frame(self)
        container.pack(side="top", fill="both", expand = True)
        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)

        self.frames = {}

        for F in (StartPage, PageOne, PageTwo, PageThree):

            frame = F(container, self, ser)

            self.frames[F] = frame

            frame.grid(row=0, column=0, sticky="nsew")

        self.show_frame(StartPage)
        self.ani = animation.FuncAnimation(f, self.animate, interval=100) #https://stackoverflow.com/questions/48564181/how-to-stop-funcanimation-by-func-in-matplotlib

    def show_frame(self, cont):
        global stream_wave
        global GUI_state
        if cont == StartPage:
            GUI_state = 0
        elif cont == PageOne:
            GUI_state = 1
        elif cont == PageTwo:
            GUI_state = 2
            print("hi")
            self.cont.monitorTemp()
        elif cont == PageThree:
            GUI_state = 3
        frame = self.frames[cont]
        frame.tkraise()

    def animate(self, i):
        global GUI_state
        if GUI_state == 3:
            self.ani.event_source.interval = 50
            self.ser.write(b'\x01')
            s=self.ser.read(1600*2)
            y=list(struct.iter_unpack("1600H", s))
            y = list(y[0])
            y = [num / 65535 for num in y]
            l2.set_ydata(y)
        else:
            self.ani.event_source.interval = 1000


class StartPage(tk.Frame):

    def __init__(self, parent, controller, ser):
        tk.Frame.__init__(self,parent)
        label = tk.Label(self, text="Start Page", font=LARGE_FONT)
        label.pack(pady=10,padx=10)

        button = ttk.Button(self, text="Visit Page 1",
                            command=lambda: controller.show_frame(PageOne))
        button.pack()

        button2 = ttk.Button(self, text="Visit Page 2",
                            command=lambda: controller.show_frame(PageTwo))
        button2.pack()

        button3 = ttk.Button(self, text="Graph Page",
                            command=lambda: controller.show_frame(PageThree))
        button3.pack()

class PageOne(tk.Frame):

    def __init__(self, parent, controller, ser):
        tk.Frame.__init__(self, parent)
        label = tk.Label(self, text="Page One!!!", font=LARGE_FONT)
        label.pack(pady=10,padx=10)

        button1 = ttk.Button(self, text="Back to Home",
                            command=lambda: controller.show_frame(StartPage))
        button1.pack()

        button2 = ttk.Button(self, text="Page Two",
                            command=lambda: controller.show_frame(PageTwo))
        button2.pack()


class PageTwo(tk.Frame):

    def __init__(self, parent, controller, ser):
        self.ser = ser
        tk.Frame.__init__(self, parent)
        label = tk.Label(self, text="Page Two!!!", font=LARGE_FONT)
        label.pack(pady=10,padx=10)
        label = tk.Label(self, text="Temperature: ", font=LARGE_FONT)
        label.pack(pady=10,padx=10)

        button1 = ttk.Button(self, text="Back to Home",
                            command=lambda: controller.show_frame(StartPage))
        button1.pack()

        button2 = ttk.Button(self, text="Page One",
                            command=lambda: controller.show_frame(PageOne))
        button2.pack()

    def monitorTemp(self):
        global GUI_state
        self.ser.write(b'\x01')
        s = self.ser.read(2)
        print(GUI_state)
        adc_temp = list(struct.iter_unpack("H", s))
        adc_temp = list(adc_temp[0])[0]
        #adcToTemp()
        while GUI_state == 2:
            tk.Frame.after(self, 500, self.monitorTemp)

    def adcToTemp(adc, therm_nominal, temp_nominal, b_coefficient):
        steinhart
        raw = adc
        raw = adcMax() / raw - 1
        raw = SERIES_RESISTOR / raw
        steinhart = raw / therm_nominal  # (R/Ro)
        steinhart = math.log(steinhart)  # ln(R/Ro)
        steinhart /= b_coefficient  # 1/B * ln(R/Ro)
        steinhart += 1.0 / (temp_nominal + 273.15)  # + (1/To)
        steinhart = 1.0 / steinhart  # Invert
        steinhart -= 273.15
        return steinhart


class PageThree(tk.Frame):

    def __init__(self, parent, controller, ser):
        tk.Frame.__init__(self, parent)
        label = tk.Label(self, text="Graph Page!", font=LARGE_FONT)
        label.pack(pady=10,padx=10)

        button1 = ttk.Button(self, text="Back to Home",
                            command=lambda: controller.show_frame(StartPage))
        button1.pack()

        canvas = FigureCanvasTkAgg(f, self)
        canvas.draw()
        canvas.get_tk_widget().pack(side=tk.BOTTOM, fill=tk.BOTH, expand=True)

        toolbar = NavigationToolbar2Tk(canvas, self)
        toolbar.update()
        canvas._tkcanvas.pack(side=tk.TOP, fill=tk.BOTH, expand=True)


def main():
    ser = serial.Serial('COM7')
    ser.close()
    ser.open()
    app = SeaofBTCapp(ser)
    app.mainloop()


if __name__ == '__main__':
    main()

