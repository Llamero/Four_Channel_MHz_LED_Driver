import math
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

    #Check if external fan and sync out are on the same channel and disable used channels
    for channel in range(1,4):
        if gui.getValue(gui.config_model["Fan"]["Channel"][channel]) and gui.getValue(gui.sync_model["Output"][channel]):
            gui.message_box.setText("Warning: The external fan output and sync output are both using output #" + str(channel) + ". Change one of these channels for the driver to function properly.")
            gui.message_box.exec()
        else:
            if gui.getValue(gui.config_model["Fan"]["Channel"][channel]):
                gui.disableUsedOutputs(channel, "config")
            else:
                gui.disableUsedOutputs(channel, "sync")
    checkCurrentLimits(gui)

def downloadConfiguration(gui, file):
    pass

def uploadConfiguration(gui):
    pass

def checkCurrentLimits(gui):
    total_resistance = 0
    for resistor in range(1,5):
        if gui.getValue(gui.config_model["Resistor" + str(resistor)]["Active"]):
            total_resistance += 1/gui.getValue(gui.config_model["Resistor" + str(resistor)]["Value"])
    total_resistance = 1/total_resistance
    maximum_current = 3.33/total_resistance
    maximum_current = round(maximum_current, -int(math.floor(math.log10(abs(maximum_current))))+1) #Report max current to 2 significant figures - https://stackoverflow.com/questions/3410976/how-to-round-a-number-to-significant-figures-in-python

    for led_number in range(1,5):
        gui.config_model["LED" + str(led_number)]["Current Limit"].setMaximum(maximum_current)
        gui.config_model["LED" + str(led_number)]["Current Limit"].setToolTip("Set the current limit (in amps) for LED #1"
                                                                              " - " + str(maximum_current) + " amps maximum.")
    gui.configure_current_limit_box.setTitle("LED Current Limit (" + str(maximum_current) + "A Max)")




