# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


from serial.tools import list_ports
import re
import sys

# Teensy USB serial microcontroller program id data:
VENDOR_ID = "16C0"
PRODUCT_ID = "0483"
SERIAL_NUMBER = "MHZ_LED"
MAGIC_SEND = "kc1oISEIZ60AYJqH4J1P" #Magic number sent to Teensy to verify that they are an LED driver
MAGIC_RECEIVE = "kvlWfsBplgasrsh3un5K" #Magic number received from Teensy verifying it is an LED driver

class comPorts():
    def __init__(self, app):
        self.ser_num = '' #Serial number of the USB connected device
        self.com_list = [] #List of valid Teensy COM ports
        self.getTeensyPort() #Get list of Teensy COM ports

    #https://forum.pjrc.com/threads/25295-Automatically-find-a-Teensy-Board-with-Python-and-PySerial
    def getTeensyPort(self):
        for self.port in list(list_ports.comports()):
            if "USB VID:PID=%s:%s SER=%s"%(VENDOR_ID, PRODUCT_ID, SERIAL_NUMBER) in self.port[2]:
                try:
                    self.ser_num = re.search('MHZ_LED[A-Z0-9_-][A-Z0-9_-]', self.port[2]).group(0)
                except AttributeError:
                    pass
                self.com_list.append((self.port[0], self.ser_num))

        if len(self.com_list) > 0:




# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    TeensyPort = getTeensyPort()
    if TeensyPort:
        print("Teensy found on port %s" % TeensyPort)
    else:
        print("No compatible Teensy found. Aborting.")
        sys.exit(1)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
