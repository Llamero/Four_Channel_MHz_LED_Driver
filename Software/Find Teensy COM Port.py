# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

import sys
import serial
from serial.tools import list_ports
import re

# Teensy USB serial microcontroller program id data:
VENDOR_ID = "16C0"
PRODUCT_ID = "0483"
SERIAL_NUMBER = "MHZ_LED"

#https://forum.pjrc.com/threads/25295-Automatically-find-a-Teensy-Board-with-Python-and-PySerial
def getTeensyPort():
    com_list = []
    for port in list(list_ports.comports()):
        if "USB VID:PID=%s:%s SER=%s"%(VENDOR_ID, PRODUCT_ID, SERIAL_NUMBER) in port[2]:
            try:
                ser_num = re.search('MHZ_LED[A-Z0-9_-][A-Z0-9_-]', port[2]).group(0)
            except AttributeError:
                ser_num = '' #This should never happen by defintion of the if statement
            com_list.append((port[0], ser_num))
    return com_list


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    TeensyPort = getTeensyPort()
    if TeensyPort:
        print("Teensy found on port %s" % TeensyPort)
    else:
        print("No compatible Teensy found. Aborting.")
        sys.exit(1)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
