import tempfile
from PyQt5 import QtGui
from collections import OrderedDict
import ast
import guiSequence as seq

def saveConfiguration(gui, model, file=None):
    def writeLines(prefix, dictionary):
        nonlocal gui
        nonlocal file
        for key, value in dictionary.items():
            if isinstance(value, OrderedDict):
                writeLines(prefix + key + "::", value)
            else:
                file.write(prefix + key + "::" + str(gui.getValue(value)) + "\n")
            pass

    if file is None:
        path = QtGui.QFileDialog.getSaveFileName(gui, 'Save File', '', 'TXT(*.txt)')
        if path[0] != "":
            with open(str(path[0]), 'w', newline='') as file:
                writeLines("", model)

    else:
        writeLines("", model)

def loadConfiguration(gui, model, file=None):
    lines = []
    if file is None:
        path = QtGui.QFileDialog.getOpenFileName(gui, 'Open File', '', 'TXT(*.txt)')
        if path[0] != "":
            with open(str(path[0]), 'r', newline='') as file:
                lines = file.readlines()
    else:
        lines = file.readlines()

    for line in lines:
        line = line.strip('\n')
        line_list = line.split("::")
        dictionary = model
        key_path = []
        for index, key in enumerate(line_list):
            if index < len(line_list)-1:
                try:
                    key_path.append(key)
                    dictionary = dictionary[key]
                except (KeyError, TypeError):
                    gui.message_box.setText("Error: \"" + key +"\" is not a valid key in \"" + line + "\". Load aborted at this step.")
                    gui.message_box.exec()
                    return
            else:
                entry = gui.getValue(dictionary)
                if isinstance(entry, str): #Block values that are meant to be strings from getting evaluated
                    value = key
                else:
                    try:
                        value = ast.literal_eval(key)
                    except ValueError:
                        value = ast.literal_eval("\'" + key+ "\'") #Fix literal_eval ValueError - https://stackoverflow.com/questions/14611352/malformed-string-valueerror-ast-literal-eval-with-string-representation-of-tup
                if key_path[-1] == "Sequence": #Process sequence file loads separately
                    seq.setSequencePath(gui, key_path, value) #Save path to dictionary
                    widget = eval("gui.sync_" + key_path[0].lower() + "_" + key_path[1].lower() + "_sequence_table") #Assign to proper widget table
                    if value != "None":
                        seq.loadSequence(gui, widget, key_path) #Load sequence file to table
                elif not gui.setValue(dictionary, value):
                    gui.message_box.setText("Error: \"" + key +"\" is not a valid value in \"" + line + "\". Load aborted at this step.")
                    gui.message_box.exec()
                    return

def downloadConfiguration(gui, file):
    pass

def uploadConfiguration(gui):
    pass

