from serial.tools import list_ports
import re
import serial
from cobs import cobs

# Teensy USB serial microcontroller program id data:
VENDOR_ID = "16C0"
PRODUCT_ID = "0483"
SERIAL_NUMBER = "MHZ_LED"
MAGIC_SEND = "kc1oISEIZ60AYJqH4J1P" #Magic number sent to Teensy to verify that they are an LED driver
MAGIC_RECEIVE = "kvlWfsBplgasrsh3un5K" #Magic number received from Teensy verifying it is an LED driver

class usbSerial():
    def __init__(self, app):
        self.debug = True #Prints debug messages
        self.ser_num = None #Serial number of the USB connected device
        self.com_list_teensy = []  # List of USB COM ports that have the same VENDOR_ID and PRODUCT_ID as a Teensy
        self.com_list_custom = [] #List of valid Teensy COM ports with a custom serial number that is "MHZ_LEDXX:
        self.getTeensyPort() #Get list of Teensy COM ports
        self.active_serial = None #Active serial connection, None if no port is currently active

    #https://forum.pjrc.com/threads/25295-Automatically-find-a-Teensy-Board-with-Python-and-PySerial
    def getTeensyPort(self):
        for self.port in list(list_ports.comports()):
            if "USB VID:PID=%s:%s SER=%s"%(VENDOR_ID, PRODUCT_ID, SERIAL_NUMBER) in self.port[2]: #Search for COM ports that have correct vendor and product IDs
                self.com_list_teensy.append((self.port[0], self.ser_num))

                try: #See if the connection has a valid custom serial number
                    self.ser_num = re.search('MHZ_LED[A-Z0-9_-][A-Z0-9_-]', self.port[2]).group(0)
                    self.com_list_custom.append((self.port[0], self.ser_num))
                except AttributeError:
                    pass

        if len(self.com_list_teensy) > 0: #If at least one Teensy was found, exchange magic numbers to confirm it is an LED driver
            if len(self.com_list_custom) > 0: #If at least one custom serial number was found, only check devices with custom serial numbers
                for self.com_port in self.com_list_custom:
                    ser = serial.Serial(self.com_port)
                    ser.close()
                    ser.open()

    def connectSerial(self, port):
        try:
            self.active_serial = serial.Serial(port)
            if self.active_serial.isOpen(): #Close serial port if it is already open
                self.active_serial.close()
            self.active_serial.open() #Open serial connection
            return True

        except serial.SerialException: #Return False if unable to establish connection to serial port
            if self.debug:
                print("Failed to connect to COM port")
            self.active_serial = None
            return False

    def magicNumberCheck(self):
        pass

    def serial_send(self, packet):
        try:
            cobs_packet = cobs.encode(packet)
            self.active_serial.write(cobs_packet)
            return True
        except serial.SerialException:
            if self.debug:
                print("Failed to send data packet to driver.")
            return False


    def serial_receive(self, size = 4, read_timeout = 1):
        try:
            self.active_serial.timeout(read_timeout)
            read_buffer = self.active_serial.read(size)
            if(size == 4):
                self.processCommand(read_buffer)
            return read_buffer
        except serial.SerialException:
            print("Failed to receive data packet from driver.")
            return None
        except cobs.DecodeError:
            print("Invalid COBS packet received.")
            return None





