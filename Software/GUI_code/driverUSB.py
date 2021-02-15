from collections import OrderedDict
import re
from cobs import cobs
from PyQt5 import QtCore, QtWidgets
from PyQt5.QtSerialPort import QSerialPortInfo, QSerialPort
import inspect
from collections import OrderedDict
import guiConfigIO as fileIO
import time
import struct
import guiSequence as seq
import tempfile
import sys

# Teensy USB serial microcontroller program id data:
VENDOR_ID = 0x16C0
PRODUCT_ID = 0x0483
SERIAL_NUMBER = "MHZ_LED"
MAGIC_SEND = "kc1oISEIZ60AYJqH4J1P" #Magic number sent to Teensy to verify that they are an LED driver
MAGIC_RECEIVE = "kvlWfsBplgasrsh3un5K" #Magic number received from Teensy verifying it is an LED driver
debug = True

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
        self.prefix_dict = {} #byte prefix identifying data packet type
        self.in_prefix_dict = {}  # byte prefix identifying data packet type
        self.command_dict = {} #Mapping of prefix to function that will process the command
        self.dropped_frame_counter = 0 #Track total number of invalid frames
        self.default_action_number = len(self.gui.menu_connection.actions()) #Get number of actions in connection menu when there are no connected drivers
        self.default_serial_number = self.gui.configure_name_driver_serial_label2.text()
        self.seq_table_list = [self.gui.sync_digital_low_sequence_table, self.gui.sync_digital_high_sequence_table, self.gui.sync_confocal_image_sequence_table, self.gui.sync_confocal_flyback_sequence_table] #List of sequence table widgets
        #Initialize connection menu action group
        self.conn_menu_action_group = QtWidgets.QActionGroup(self.gui.menu_connection) #Connection menu action group to have options act like radio buttons
        self.conn_menu_action_group.setExclusive(True)
        self.conn_menu_action_group.triggered.connect(self.onTriggered)
        self.stream_buffer = None #Buffer for storing active data streams - used to send large files
        for action in self.gui.menu_connection.actions():
            self.conn_menu_action_group.addAction(action)

        #Initialize prefix routing dicts
        self.initializeRoutingDictionaries()

    #https://forum.pjrc.com/threads/25295-Automatically-find-a-Teensy-Board-with-Python-and-PySerial
    def getDriverPort(self, on_boot = False):
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
                    self.uploadTime()
                    self.disconnectSerial()
        if on_boot: #On boot, automatically connect to the first driver in the menu
            action = self.gui.menu_connection.actions()[0]
            action.setChecked(True)
            self.onTriggered(action)
        else: #If check was performed through menu, inform of result
            if len(self.gui.menu_connection.actions()) > self.default_action_number:
                self.gui.message_box.setText("Success: " + str(len(self.gui.menu_connection.actions()) - self.default_action_number) + " LED driver(s) were found.")
                self.gui.message_box.exec()
            else:
                self.gui.message_box.setText("No LED drivers were found. Make sure the following:\n1) USB cables are connected properly\n2) No other program is connected to the LED driver\n3) The LED driver software has been uploaded to the Teensy board")
                self.gui.message_box.exec()

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
                    if debug:
                        print("Can't open port1")
                    self.disconnectSerial()
                    return False
            else:
                if debug:
                    print("Can't open port2")
                self.disconnectSerial()
                return False

        except: #Return False if unable to establish connection to serial port
            if debug:
                print("Failed to connect to COM port, with QSerialPort Error #" + str(self.active_port.error()))
            self.disconnectSerial()
            return False

    def disconnectSerial(self):
        if self.active_port is not None:
            if self.active_port.isOpen(): #Close serial port if it is already open
                self.active_port.clear() #Clear buffer of any remaining data
                self.active_port.close() #close connection
                self.active_port = None

        self.gui.menu_connection_disconnect.setChecked(True)
        self.gui.updateSerialNumber(self.default_serial_number)


    @QtCore.pyqtSlot()
    def receive(self):
        if self.active_port is not None: #Should be redundant - better safe than sorry
            temp_buffer = bytearray(self.active_port.readAll().data())
            if len(temp_buffer) > 1:
                for i, byte in enumerate(temp_buffer):
                    if byte == 0:
                        try:
                            self.command_queue.append(cobs.decode(bytes(self.serial_buffer)))
                            self.serial_buffer = []
                            self.serialRouter()
                            return
                        except cobs.DecodeError:
                            self.gui.message_box.setText("Warning: Invalid COBS frame received from driver. Check connection.")
                            self.gui.message_box.exec()
                            if debug:
                                print("Invalid COBS packet") #########################################################  ADD MESSAGE BOX OUTPUT?
                                print(temp_buffer[:i])
                            self.serial_buffer = []
                            self.dropped_frame_counter += 1

                    else:
                        self.serial_buffer.append(byte)

            else:
                if debug:
                    print("Invalid single byte packet")
                self.dropped_frame_counter += 1
            self.active_port.waitForReadyRead(10) #if code does not return, that means a partial packet may have been received, so wait to see if more bytes are incoming

    @QtCore.pyqtSlot()
    def send(self, message = None, cobs_encode = True):
        if self.active_port is None: #If driver is disconnected, then don't try to send packet
            return
        if cobs_encode:
            packet = bytearray(self.prefix_dict[inspect.stack()[1].function].to_bytes(1, "big")) #Add routing prefix based on name of calling function
            if message:
                if isinstance(message, str):
                    message = bytearray(message.encode())
                elif isinstance(message, int):
                    message = message.to_bytes(1, "big")
                packet.extend(bytearray(message))
            if debug:
                print("Func: " + str(inspect.stack()[1].function) + ", Tx: " + str(packet))
            self.active_port.write(cobs.encode(bytes(packet)))
            self.active_port.write(bytes(1))  # Send NULL framing byte
        else:
            if debug:
                print("Func: " + str(inspect.stack()[1].function) + ", Tx: " + str(message[:50]))
                if len(message) > 50:
                    print("↑ Total tx packet length: " + str(len(message)))
            self.active_port.write(message)
        wait_time = 200
        if message:
            wait_time += round(len(message) / 10)
        self.active_port.waitForBytesWritten(wait_time) #Wait for data to be sent

    def uploadStream(self, message):
        self.send(self.stream_buffer, False)

    def onTriggered(self, action):
        if str(action.objectName()) == "menu_connection_disconnect":
            self.disconnectSerial()
        elif str(action.objectName()) == "menu_connection_search":
            self.getDriverPort()
        else:
            port = action.toolTip()
            serial_number = action.whatsThis()
            if self.connectSerial(port):
                self.downloadDriverConfiguration()
                self.gui.updateSerialNumber(serial_number)

            else:
                self.conn_menu_action_group.removeAction(action)
                self.gui.menu_connection.removeAction(action)
                self.gui.message_box.setText("Error: Failed to open LED driver port.  Check USB connection and confirm no other software is connected to the driver.")
                self.gui.message_box.exec()


    def serialRouter(self):
        if self.command_queue:
            command = bytearray(self.command_queue.pop(0))
            if debug:
                print("Rx: " + str(command))
            try:
                self.command_dict[command[0]](command[1:])
                if debug:
                    print("Frame processed. " + str(self.dropped_frame_counter) + " dropped frames so far.")
            except KeyError:
                if debug:
                    print("Invalid prefix: " + str(command[0]))
                self.dropped_frame_counter += 1

    def initializeRoutingDictionaries(self):
        self.prefix_dict = {"showDriverMessage": 0,
                                "magicNumberCheck": 1,
                                "downloadDriverConfiguration": 2,
                                "uploadDriverConfiguration": 3,
                                "downloadSyncConfiguration": 4,
                                "uploadSyncConfiguration": 5,
                                "downloadSeqFile": 6,
                                "uploadSeqFile": 7,
                                "downloadDriverId": 8,
                                "uploadTime": 9,
                                "uploadStream": 10}  # byte prefix identifying data packet type

        self.command_dict = {self.prefix_dict["showDriverMessage"]: self.showDriverMessage,
                             self.prefix_dict["magicNumberCheck"]: self.magicNumberCheck,
                             self.prefix_dict["downloadDriverConfiguration"]: self.downloadDriverConfiguration,
                             self.prefix_dict["uploadDriverConfiguration"]: self.uploadDriverConfiguration,
                             self.prefix_dict["downloadSyncConfiguration"]: self.downloadSyncConfiguration,
                             self.prefix_dict["uploadSyncConfiguration"]: self.uploadSyncConfiguration,
                             self.prefix_dict["downloadSeqFile"]: self.downloadSeqFile,
                             self.prefix_dict["uploadSeqFile"]: self.uploadSeqFile,
                             self.prefix_dict["downloadDriverId"]: self.downloadDriverId,
                             self.prefix_dict["uploadTime"]: self.uploadTime,
                             self.prefix_dict["uploadStream"]: self.uploadStream}  # Mapping of prefix to function that will process the command

    def showDriverMessage(self, reply=None):
        if reply is not None:
            reply = reply.decode()
            self.gui.message_box.setText(reply)
            self.gui.message_box.exec()
        else:
            pass

    def magicNumberCheck(self, reply=None):
        if reply is not None:
            reply = reply.decode()
            if str(reply) == MAGIC_RECEIVE:
                self.downloadDriverId()
        else:
            self.send(MAGIC_SEND)
            self.active_port.waitForReadyRead(100)  # Wait for reply

    def downloadDriverConfiguration(self, reply=None):
        if reply is not None:
            fileIO.bytesToConfig(reply, self.gui, self.prefix_dict["downloadDriverConfiguration"])
        else:
            if self.active_port is None:
                self.gui.message_box.setText("Error: LED driver is disconnected.")
                self.gui.message_box.exec()
            else:
                self.send()
                self.active_port.waitForReadyRead(100)  # Wait for reply

    def uploadDriverConfiguration(self, reply=None):
        if reply is not None:
            pass
        else:
            self.send(fileIO.configToBytes(self.gui, self.prefix_dict["uploadDriverConfiguration"]))

    def downloadSyncConfiguration(self, reply=None):
        if reply is not None:
            pass
        else:
            if self.active_port is None:
                pass
            else:
                self.send()
                self.active_port.waitForReadyRead(100)  # Wait for reply

    def uploadSyncConfiguration(self, reply=None):
        if reply is not None:
            pass
        else:
            for index, ref_widget in enumerate(self.seq_table_list):
                self.uploadSeqFile(None, ref_widget)
                return


    def downloadSeqFile(self, reply=None):
        if reply is not None:
            pass
        else:
            if self.active_port is None:
                self.gui.message_box.setText("Error: LED driver is disconnected.")
                self.gui.message_box.exec()
            else:
                self.send()
                self.active_port.waitForReadyRead(100)  # Wait for reply

    def uploadSeqFile(self, reply=None, widget=None):
        message = bytearray()
        if reply is not None:
            message.extend(struct.pack("B", self.prefix_dict["uploadSeqFile"]))
            message.extend(reply)
            self.stream_buffer = seq.sequenceToBytes(self.gui, self.seq_table_list[ord(reply)])
            message.extend(struct.pack("<L", len(self.stream_buffer)))
            self.send(message, False)
            self.active_port.waitForReadyRead(500)  # Wait for reply
        else:
            if self.active_port is None:
                self.gui.message_box.setText("Error: LED driver is disconnected.")
                self.gui.message_box.exec()
            else:
                for index, ref_widget in enumerate(self.seq_table_list):
                    if widget == ref_widget or widget == index: #Widget could be the calling widget object or a numerical index identifier
                        message.extend(struct.pack("B", index))
                        self.send(message)
                        self.active_port.waitForReadyRead(500)  # Wait for reply

    def downloadDriverId(self, reply=None):
        if reply is not None:
            reply = reply.decode()
            menu_item = QtWidgets.QAction(reply, self.gui)
            menu_item.setToolTip(self.getPortInfo(self.active_port)["Port"]) #Add port# to tool tip to distinguish drivers with identical names
            menu_item.setWhatsThis(self.getPortInfo(self.active_port)["Serial"])  # Add port# to tool tip to distinguish drivers with identical names
            menu_item.setCheckable(True)
            menu_item.setChecked(False)
            for action in self.gui.menu_connection.actions():
                if action.toolTip() == menu_item.toolTip():
                    break
            else:
                self.gui.menu_connection.insertAction(self.gui.menu_connection_disconnect, menu_item)
                self.conn_menu_action_group.addAction(menu_item)
        else:
            self.send()
            self.active_port.waitForReadyRead(100)  # Wait for reply

    def uploadTime(self, reply=None):
        if reply is not None:
            pass
        else:
            time_now = round(time.mktime(time.localtime()))-time.timezone
            time_now = bytearray(struct.pack("<L", int(time_now)))
            self.send(time_now)