import csv
import tempfile
from PyQt5 import QtGui, QtCore
from PyQt5.QtWidgets import QMessageBox
import guiConfigIO as FileIO
import struct

maximum_rows = 10000 # Maximum number or rows allowed
row_subsample = maximum_rows  #Only load the last segment of the table for very large tables to prevent lag

def loadSequence(gui, widget, path_keys, get_path=False):  # derived from - https://stackoverflow.com/questions/12608835/writing-a-qtablewidget-to-a-csv-or-xls
    if get_path:
        path = getSequencePath(gui, path_keys)
    else:
        path = None
    if not path:
        path = QtGui.QFileDialog.getOpenFileName(gui, 'Open File', '', 'CSV(*.csv)')[0] #If no path is specified, ask for valid path

    if path: #If path is specified, load file
        try: #Try to open file at path
            # Count number of rows in CSV file
            with open(str(path), 'rU') as stream: #Verify that the seq table is valid
                widget_headers = verifySequence(gui, stream, widget)

            # Import csv file
            if widget_headers: #Load valid seq table into widget
                with open(str(path), 'rU') as stream:
                    reader = csv.reader(stream)

                    # Remove header from stream
                    next(reader, None)

                    # Clear table
                    widget.setRowCount(0)
                    widget.itemChanged.disconnect() #Speed up CSV loading by preventing widget from validating every cell as data is loaded
                    for row_data in reader:
                        row = widget.rowCount()
                        if row < maximum_rows:
                            widget.insertRow(row)
                            for column, data in enumerate(row_data):
                                if column < len(widget_headers):
                                    item = QtGui.QTableWidgetItem(str(data))
                                    widget.setItem(row, column, item)
                        else:
                            gui.message_box.setText("The maximum number of rows is capped at " + str(maximum_rows) + ".")
                            gui.message_box.exec()
                            break

                    if row < maximum_rows:
                        widget.insertRow(row+1) #Add one extra row to allow for editing
                    widget.itemChanged.connect(lambda: verifyCell(gui, widget.item.column(), widget.item.row(), widget.item.text()))

        except FileNotFoundError:
            gui.message_box.setText("\"" + str(path) + "\" is not a valid path. Please find the sequence file manually.")
            gui.message_box.exec()
            setSequencePath(gui, path_keys, None) #Clear invalid path from model
            loadSequence(gui, widget, path_keys)

        else:
            setSequencePath(gui, path_keys, str(path))

def saveSequence(gui, widget, path_keys, get_path=None):  # derived from - https://stackoverflow.com/questions/12608835/writing-a-qtablewidget-to-a-csv-or-xls
    if get_path:
        path = getSequencePath(gui, path_keys)
    else:
        path = None
    if not path: #If no path is specified, ask for valid path
        path = QtGui.QFileDialog.getSaveFileName(gui, 'Save File', '', 'CSV(*.csv)')[0]

    if path: #If path is valid, save
        widget_header_obj = [widget.horizontalHeaderItem(c) for c in range(widget.columnCount())]
        widget_headers = [x.text() for x in widget_header_obj if x is not None]
        with tempfile.TemporaryFile(mode="w+", suffix=".csv", newline='') as stream:  # "newline=''" removes extra newline from windows - https://stackoverflow.com/questions/3191528/csv-in-python-adding-an-extra-carriage-return-on-windows
            writer = csv.writer(stream)
            writer.writerow(widget_headers)
            for row in range(widget.rowCount()):
                row_data = [None] * len(widget_headers)
                for column in range(widget.columnCount()):
                    item = widget.item(row, column)
                    if item is not None:
                        row_data[column] = str(item.text())

                if row_data != [None] * len(widget_headers): #Exclude empty rows
                    writer.writerow(row_data)

            widget_headers = verifySequence(gui, stream, widget)

            if widget_headers:
                try: #Try to open specific path
                    with open(str(path), 'w', newline='') as output_file:
                        stream.seek(0)
                        file_writer = csv.writer(output_file)
                        for row_data in csv.reader(stream):
                            file_writer.writerow(row_data)

                except FileNotFoundError:
                    gui.message_box.setText(str(path) + " is not a valid path. Please find the sequence file manually.")
                    gui.message_box.exec()
                    setSequencePath(gui, path_keys, None)  # Clear invalid path from model
                    saveSequence(gui, widget, None)

                else:
                    setSequencePath(gui, path_keys, str(path))

def findUnsavedSeqThenSave(gui, model):
    seq_list = [["Digital", "Low"], ["Digital", "High"], ["Confocal", "Image"], ["Confocal", "Flyback"]]
    for dictionary in seq_list:
        if model[dictionary[0]][dictionary[1]]["Sequence"] is None:
            gui.message_box.setText("Sequence table \"" + dictionary[0] + "::" + dictionary[1] + "\" has not yet been saved. Please save sequence files first if you want them included with the configuration.")
            gui.message_box.exec()
    FileIO.saveConfiguration(gui, model)


def verifySequence(gui, stream, widget):
    stream.seek(0)
    row_count = sum(1 for row in csv.reader(stream))

    # Verify file
    stream.seek(0)
    reader = csv.reader(stream)

    # Verify header
    csv_headers = next(reader, None)
    widget_header_obj = [widget.horizontalHeaderItem(c) for c in range(widget.columnCount())]
    widget_headers = [x.text() for x in widget_header_obj if x is not None]
    if csv_headers is not None and row_count > 1 and len(csv_headers) >= len(widget_headers):
        for column, data in enumerate(widget_headers):
            if csv_headers[column] != data and column < 4:
                gui.message_box.setText(
                    "Error: CSV header \"" + data + "\" does not match table header \"" + widget_headers[
                        column] + "\". Process aborted.")
                gui.message_box.exec()
                return False

    # Verify data
    for row, row_data in enumerate(reader):
        if len(widget_headers) > len(row_data):
            gui.message_box.setText(
                "Error: Row #" + str(row + 1) + " has only " + str(len(row_data)) + " cells. At least " + str(
                    len(widget_headers)) + " cells are required.  Import aborted.")
            gui.message_box.exec()
            return False
        for column, data in enumerate(row_data):
            if column < len(widget_headers):
                if not verifyCell(gui, column, row, data):
                    return False

    return widget_headers

def verifyCell(gui, column, row, data, widget=None):
    if widget:
        widget_name = widget.objectName().split("_")
        path_keys = [widget_name[1].capitalize(), widget_name[2].capitalize(), widget_name[3].capitalize()]
        dynamicallyCheckTable(gui, widget, path_keys, row+1, column)

    else:
        try:
            data = float(data)
        except:
            gui.message_box.setText(
                "Error: \"" + str(data) + "\" at row #" + str(row + 1) + " column #" + str(column + 1) + " is not a number. Process aborted.")
            gui.message_box.exec()
            return False

        if column == 0:
            if data not in [1, 2, 3, 4]:
                gui.message_box.setText("Error: \"" + str(data) + "\" at row #" + str(
                    row + 1) + " is not a valid LED integer (1-4). Process aborted.")
                gui.message_box.exec()
                return False
        elif column in [1, 2]:
            if data < 0 or data > 100 or data is None:
                gui.message_box.setText("Error: \"" + str(data) + "\" at row #" + str(
                    row + 1) + " is not a valid percentage (0-100). Process aborted.")
                gui.message_box.exec()
                return False
        elif column == 3:
            if (data < 1e-5 and data != 0) or data > 4294 or data is None:
                gui.message_box.setText("Error: \"" + str(data) + "\" at row #" + str(
                    row + 1) + " is not a valid duration (0 or 1e-5 - 4294 seconds). Process aborted.")
                gui.message_box.exec()
                return False
        return True

def dynamicallyCheckTable(gui, widget, path_keys, end_row, end_column):
    widget_header_obj = [widget.horizontalHeaderItem(c) for c in range(widget.columnCount())]
    widget_headers = [x.text() for x in widget_header_obj if x is not None]

    with tempfile.TemporaryFile(mode="w+", suffix=".csv", newline='') as stream:  # "newline=''" removes extra newline from windows - https://stackoverflow.com/questions/3191528/csv-in-python-adding-an-extra-carriage-return-on-windows
        writer = csv.writer(stream)
        writer.writerow(widget_headers)
        valid_row_count = 0
        start_row = end_row-row_subsample
        if start_row < 0:
            start_row = 0
        for row in range(start_row, end_row):
            row_data = [None] * len(widget_headers)
            for column in range(widget.columnCount()):
                item = widget.item(row, column)
                if item is not None:
                    row_data[column] = str(item.text())
                    if row_data[column] == "" or not verifyCell(gui, column, row, row_data[column]):
                        widget.setItem(row, column, None)
                        row_data[column] = None
                        break
                    if row == end_row-1 and column == end_column:
                        setSequencePath(gui, path_keys, None)  # Flag the sequence table is changed but not yet saved
                        break

            if None not in row_data:
                writer.writerow(row_data)
                valid_row_count += 1

        if valid_row_count > 0:
            if verifySequence(gui, stream, widget):
                if valid_row_count >= end_row-start_row:
                    if widget.rowCount() < maximum_rows:
                        widget.insertRow(widget.rowCount())

def getSequencePath(gui, path):
    dictionary = gui.sync_model
    for key in path:
        dictionary = dictionary[key]
    return dictionary

def setSequencePath(gui, path, value):
    dictionary = getSequencePath(gui, path[:-1])
    dictionary[path[-1]] = value

def bytesToSequence(gui, byte_array, widget):
    pass

def sequenceToBytes(gui, widget):
    byte_array = bytearray()
    widget_header_obj = [widget.horizontalHeaderItem(c) for c in range(widget.columnCount())]
    widget_headers = [x.text() for x in widget_header_obj if x is not None]
    with tempfile.TemporaryFile(mode="w+", suffix=".csv", newline='') as stream:  # "newline=''" removes extra newline from windows - https://stackoverflow.com/questions/3191528/csv-in-python-adding-an-extra-carriage-return-on-windows
        writer = csv.writer(stream)
        writer.writerow(widget_headers)
        for row in range(widget.rowCount()):
            row_data = [None] * len(widget_headers)
            for column in range(widget.columnCount()):
                item = widget.item(row, column)
                if item is not None:
                    row_data[column] = str(item.text())

            if row_data != [None] * len(widget_headers):  # Exclude empty rows
                writer.writerow(row_data)

        widget_headers = verifySequence(gui, stream, widget)

        if widget_headers:
            stream.seek(0)
            converted_row=[None]*4
            total_resistance = float(gui.configure_current_limit_box.whatsThis())
            for index, row_data in enumerate(csv.reader(stream)):
                if index > 0: #Don't send headers to LED driver
                    converted_row[0] = int(row_data[0])
                    converted_row[1] = round((float(row_data[1])*65535)/100) #Convert percent to ADC value
                    converted_row[3] = round(float(row_data[3])*1e6) #convert seconds to microseconds
                    led_current = (float(row_data[2])/100)*gui.getValue(gui.config_model["LED" + str(converted_row[0])]["Current Limit"])
                    led_voltage = led_current*total_resistance
                    converted_row[2] = round((led_voltage/3.3)*65535)
                    byte_array.extend(struct.pack("<BHHI", *converted_row))

            return byte_array

        else:
            return None

def bytesToSequence(byte_array, gui, widget, path_keys):
    widget_header_obj = [widget.horizontalHeaderItem(c) for c in range(widget.columnCount())]
    widget_headers = [x.text() for x in widget_header_obj if x is not None]
    if len(byte_array % 9) == 0:
        row_list = [struct.unpack("<BHHI", byte_array[i:i+9]) for i in range(0, len(byte_array), 9)] #Unpack byte_array to list of row data - https://stackoverflow.com/questions/6614891/turning-a-list-into-nested-lists-in-python
        with tempfile.TemporaryFile(mode="w+", suffix=".csv", newline='') as stream:  # "newline=''" removes extra newline from windows - https://stackoverflow.com/questions/3191528/csv-in-python-adding-an-extra-carriage-return-on-windows
            writer = csv.writer(stream)
            writer.writerow(widget_headers) #Add header to temp file
            for row_data in row_list:
                writer.writerow(row_data) #Write rows to temp file

            print(tempfile.gettempdir())
