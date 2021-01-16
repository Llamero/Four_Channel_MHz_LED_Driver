import csv
import tempfile
from PyQt5 import QtGui

def loadSequence(self, widget):  # derived from - https://stackoverflow.com/questions/12608835/writing-a-qtablewidget-to-a-csv-or-xls
    path = QtGui.QFileDialog.getOpenFileName(
        self, 'Open File', '', 'CSV(*.csv)')
    if path[0] != "":
        # Count number of rows in CSV file
        with open(str(path[0]), 'r') as stream:
            widget_headers = verifySequence(self, stream, widget)

        # Import csv file
        if widget_headers:
            with open(str(path[0]), 'r') as stream:
                reader = csv.reader(stream)

                # Remove header from stream
                next(reader, None)

                # Clear table
                widget.setRowCount(0)
                for row_data in csv.reader(stream):
                    row = widget.rowCount()
                    widget.insertRow(row)
                    for column, data in enumerate(row_data):
                        if column < len(widget_headers):
                            item = QtGui.QTableWidgetItem(str(data))
                            widget.setItem(row, column, item)

            widget.insertRow(row + 1)  # Add one more empty row to allow for editing

def saveSequence(self, widget):  # derived from - https://stackoverflow.com/questions/12608835/writing-a-qtablewidget-to-a-csv-or-xls
    path = QtGui.QFileDialog.getSaveFileName(
        self, 'Save File', '', 'CSV(*.csv)')
    if path[0] != "":
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

            widget_headers = verifySequence(self, stream, widget)

            if widget_headers:
                with open(str(path[0]), 'w', newline='') as output_file:
                    stream.seek(0)
                    reader = csv.reader(stream)
                    file_writer = csv.writer(output_file)
                    file_writer.writerows(reader)

def verifySequence(self, stream, widget):
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
                self.message_box.setText(
                    "Error: CSV header \"" + data + "\" does not match table header \"" + widget_headers[
                        column] + "\". Process aborted.")
                self.message_box.exec()
                return False
    else:
        self.message_box.setText("Error: Table is empty or only contains headers, process aborted.")
        self.message_box.exec()
        return False

    # Verify data
    for row, row_data in enumerate(reader):
        if len(widget_headers) > len(row_data):
            self.message_box.setText(
                "Error: Row #" + str(row + 1) + " has only " + str(len(row_data)) + " cells. At least " + str(
                    len(widget_headers)) + " cells are required.  Import aborted.")
            self.message_box.exec()
            return False
        for column, data in enumerate(row_data):
            if column < len(widget_headers):
                if not verifyCell(self, column, row, data):
                    return False

    return widget_headers

def verifyCell(self, column, row, data):
    try:
        data = float(data)
    except:
        self.message_box.setText(
            "Error: \"" + str(data) + "\" at row #" + str(row + 1) + " column #" + str(column + 1) + " is not a number. Process aborted.")
        self.message_box.exec()
        return False

    if column == 0:
        if data not in [0, 1, 2, 3, 4]:
            self.message_box.setText("Error: \"" + str(data) + "\" at row #" + str(
                row + 1) + " is not a valid LED integer (0-4). Process aborted.")
            self.message_box.exec()
            return False
    elif column in [1, 2]:
        if data < 0 or data > 100 or data is None:
            self.message_box.setText("Error: \"" + str(data) + "\" at row #" + str(
                row + 1) + " is not a valid percentage (0-100). Process aborted.")
            self.message_box.exec()
            return False
    elif column == 3:
        if (data < 10e-6 and data != 0) or data > 3600 or data is None:
            self.message_box.setText("Error: \"" + str(data) + "\" at row #" + str(
                row + 1) + " is not a valid duration (0 or 0.00001-3600). Process aborted.")
            self.message_box.exec()
            return False
    return True

def dynamicallyCheckTable(self, widget):
    widget_header_obj = [widget.horizontalHeaderItem(c) for c in range(widget.columnCount())]
    widget_headers = [x.text() for x in widget_header_obj if x is not None]

    with tempfile.TemporaryFile(mode="w+", suffix=".csv", newline='') as stream:  # "newline=''" removes extra newline from windows - https://stackoverflow.com/questions/3191528/csv-in-python-adding-an-extra-carriage-return-on-windows
        writer = csv.writer(stream)
        writer.writerow(widget_headers)
        valid_row_count = 0
        for row in range(widget.rowCount()):
            row_data = [None] * len(widget_headers)
            for column in range(widget.columnCount()):
                item = widget.item(row, column)
                if item is not None:
                    row_data[column] = str(item.text())
                    if row_data[column] == "" or not verifyCell(self, column, row, row_data[column]):
                            widget.setItem(row, column, None)
                            row_data[column] = None
                            break

            if None not in row_data:
                writer.writerow(row_data)
                valid_row_count += 1

        if valid_row_count > 0:
            if verifySequence(self, stream, widget):
                print(valid_row_count)
                if valid_row_count >= widget.rowCount():
                    widget.insertRow(widget.rowCount())
