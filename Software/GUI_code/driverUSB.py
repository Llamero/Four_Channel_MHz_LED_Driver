from collections import OrderedDict
import re
from cobs import cobs
from PyQt5 import QtCore, QtWidgets
from PyQt5.QtSerialPort import QSerialPortInfo, QSerialPort
import inspect
from collections import OrderedDict
import guiConfigIO as fileIO
import tempfile

# Teensy USB serial microcontroller program id data:
VENDOR_ID = 0x16C0
PRODUCT_ID = 0x0483
SERIAL_NUMBER = "MHZ_LED"
MAGIC_SEND = "kc1oISEIZ60AYJqH4J1P" #Magic number sent to Teensy to verify that they are an LED driver
MAGIC_RECEIVE = "kvlWfsBplgasrsh3un5K" #Magic number received from Teensy verifying it is an LED driver

class usbSerial(QtWidgets.QWidget): #Implementation based on: https://stackoverflow.com/questions/55070483/connect-to-serial-from-a-pyqt-gui
    def __init__(self, gui, parent=None):
        super(usbSerial, self).__init__(parent)
        self.gui = gui
        self.debug = True #Prints debug messages
        self.ser_num = None #Serial number of the USB connected device
        self.com_list_teensy = []  # List of USB COM ports that have the same VENDOR_ID and PRODUCT_ID as a Teensy
        self.com_list_custom = [] #List of valid Teensy COM ports with a custom serial number that is "MHZ_LEDXX:
        self.com_list_verified = OrderedDict() #List of verified LED driver ports and their attributes
        self.active_port = QSerialPort() #Active serial connection, None if no port is currently active
        self.serial_buffer = [] #Stores incoming serial stream
        self.command_queue = [] #List of parsed and cobs decoded
        self.out_prefix_dict = {} #byte prefix identifying data packet type
        self.in_prefix_dict = {}  # byte prefix identifying data packet type
        self.command_dict = {} #Mapping of prefix to function that will process the command
        self.dropped_frame_counter = 0 #Track total number of invalid frames
        self.initializeRoutingDictionaries()
        self.getDriverPort()  # Get list of Teensy COM ports

    #https://forum.pjrc.com/threads/25295-Automatically-find-a-Teensy-Board-with-Python-and-PySerial
    def getDriverPort(self):
        for self.port in list(QSerialPortInfo.availablePorts()):
            port_info = self.getPortInfo(self.port)
            if port_info["Vendor"] == VENDOR_ID and port_info["Product"] == PRODUCT_ID: #Search for COM ports that have correct vendor and product IDs
                self.com_list_teensy.append(port_info)
                try: #See if the connection has a valid custom serial number
                    ser_num = re.search('MHZ_LED[A-Z0-9_-][A-Z0-9_-]', port_info["Serial"]).group(0)
                    self.com_list_custom.append((self.port[0], ser_num))
                except AttributeError:
                    pass

        if len(self.com_list_teensy) > 0: #If at least one Teensy was found, exchange magic numbers to confirm it is an LED driver
            port_list = self.com_list_teensy
            if len(self.com_list_custom) > 0: #If at least one custom serial number was found, only check devices with custom serial numbers
                port_list = self.com_list_custom

            for port_info in port_list:
                if self.connectSerial(port_info["Port"]):
                    self.magicNumberCheck()

    def getPortInfo(self, port):
        return {"Vendor": QSerialPortInfo(self.port).vendorIdentifier(),
                "Product": QSerialPortInfo(self.port).productIdentifier(),
                "Serial": QSerialPortInfo(self.port).serialNumber(),
                "Port": QSerialPortInfo(self.port).systemLocation()}

    def connectSerial(self, port):
        try:
            self.active_port = QSerialPort(port, baudRate=QSerialPort.Baud9600, readyRead=self.receive)
            if not self.active_port.isOpen(): #Close serial port if it is already open
                if self.active_port.open(QtCore.QIODevice.ReadWrite): #Open serial connection
                    self.active_port.clear() #Clear buffer of any remaining data
                    return True
                else:
                    print("Can't open port")
            else:
                print("Can't open port")

        except: #Return False if unable to establish connection to serial port
            print("Failed to connect to COM port, with QSerialPort Error #" + str(self.active_port.error()))
            self.active_port = None
            return False

    @QtCore.pyqtSlot()
    def receive(self):
        if self.active_port is not None:
            temp_buffer = bytearray(self.active_port.readAll().data())
            if len(temp_buffer) > 1:
                for i, byte in enumerate(temp_buffer):
                    if byte == 0:
                        try:
                            self.command_queue.append(cobs.decode(bytes(self.serial_buffer)))
                            self.serial_buffer = []
                            self.serialRouter()
                        except cobs.DecodeError:
                            print("Invalid COBS packet") #########################################################  ADD MESSAGE BOX OUTPUT?
                            self.dropped_frame_counter += 1

                    else:
                        self.serial_buffer.append(byte)

            else:
                print("Invalid single byte packet")
                self.dropped_frame_counter += 1

    @QtCore.pyqtSlot()
    def send(self, message = None):
        packet = bytearray(self.out_prefix_dict[inspect.stack()[1].function].to_bytes(1, "big")) #Add routing prefix based on name of calling function
        if message:
            if isinstance(message, str):
                message = bytearray(message.encode())
            elif isinstance(message, int):
                message = message.to_bytes(1, "big")
            packet.extend(bytearray(message))
        self.active_port.write(cobs.encode(bytes(packet)))
        self.active_port.write(bytes(1)) #Send NULL framing byte


    def serialRouter(self):
        if self.command_queue:
            command = bytearray(self.command_queue.pop(0))
            print(command)
            try:
                self.command_dict[command[0]](command[1:])
                print("Frame processed. " + str(self.dropped_frame_counter) + " dropped frames so far.")
            except KeyError:
                print("Invalid prefix")
                self.dropped_frame_counter += 1

    def initializeRoutingDictionaries(self):
        self.out_prefix_dict = {"showDriverMessage": 0,
                                "magicNumberCheck": 1,
                                "downloadDriverConfiguration": 2,
                                "uploadDriverConfiguration": 3,
                                "downloadSyncConfiguration": 4,
                                "uploadSyncConfiguration": 5,
                                "downloadSeqFile": 6,
                                "uploadSeqFile": 7}  # byte prefix identifying data packet type

        self.command_dict = {self.out_prefix_dict["showDriverMessage"]: self.showDriverMessage,
                             self.out_prefix_dict["magicNumberCheck"]: self.magicNumberCheck,
                             self.out_prefix_dict["downloadDriverConfiguration"]: self.downloadDriverConfiguration,
                             self.out_prefix_dict["uploadDriverConfiguration"]: self.uploadDriverConfiguration,
                             self.out_prefix_dict["downloadSyncConfiguration"]: self.downloadSyncConfiguration,
                             self.out_prefix_dict["uploadSyncConfiguration"]: self.uploadSyncConfiguration,
                             self.out_prefix_dict["downloadSeqFile"]: self.downloadSeqFile,
                             self.out_prefix_dict["uploadSeqFile"]: self.uploadSeqFile}  # Mapping of prefix to function that will process the command

    def showDriverMessage(self, reply=None):
        if reply:
            reply = reply.decode()
            self.gui.message_box.setText(reply)
            self.gui.message_box.exec()
        else:
            pass

    def magicNumberCheck(self, reply=None):
        if reply:
            reply = reply.decode()
            if str(reply) == MAGIC_RECEIVE:
                self.downloadDriverConfiguration()
        else:
            self.send(MAGIC_SEND)

    def downloadDriverConfiguration(self, reply=None):
        if reply:
            with tempfile.TemporaryFile(mode="w+", suffix=".txt", newline='') as stream:
                stream.write(reply.decode())
                fileIO.loadConfiguration(self.gui, self.gui.config_model, stream)
################################            self.gui.menu_connection.addAction(reply.decode()) ----Use Tooltip to save COM port, so menu list can be checked if COM port already is already in list - Have as function in GUI class
        else:
            self.send()

    def uploadDriverConfiguration(self, reply=None):
        if reply:
            pass
        else:
            with tempfile.TemporaryFile(mode="w+", suffix=".txt", newline='') as stream:
                fileIO.saveConfiguration(self.gui, self.gui.config_model, stream)
                message = stream.read()
                self.send(message)

    def downloadSyncConfiguration(self, reply=None):
        if reply:
            pass
        else:
            pass

    def uploadSyncConfiguration(self, reply=None):
        if reply:
            pass
        else:
            pass

    def downloadSeqFile(self, reply=None):
        if reply:
            pass
        else:
            pass

    def uploadSeqFile(self, reply=None):
        if reply:
            pass
        else:
            pass