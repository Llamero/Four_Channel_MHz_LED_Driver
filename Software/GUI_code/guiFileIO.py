import tempfile
from PyQt5 import QtGui
from collections import OrderedDict
import ast

def downloadConfiguration(gui, file):
    pass

def uploadConfiguration(gui):
    pass

def saveConfiguration(gui):
    def writeLines(prefix, dictionary):
        nonlocal gui
        nonlocal file
        for key, value in dictionary.items():
            if isinstance(value, OrderedDict):
                writeLines(prefix + key + ":", value)
            else:
                file.write(prefix + key + ":" + str(gui.getValue(value)) + "\n")
            pass

    path = QtGui.QFileDialog.getSaveFileName(gui, 'Save File', '', 'TXT(*.txt)')
    with open(str(path[0]), 'w', newline='') as file:
        writeLines("", gui.config_model)

def loadConfiguration(gui):
    path = QtGui.QFileDialog.getOpenFileName(gui, 'Open File', '', 'TXT(*.txt)')
    with open(str(path[0]), 'r', newline='') as file:
        lines = file.readlines()
    for line in lines:
        line = line.strip('\n')
        line_list = line.split(":")
        dictionary = gui.config_model
        for index, key in enumerate(line_list):
            if index < len(line_list)-1:
                dictionary = dictionary[key]
            else:
                entry = gui.getValue(dictionary)
                if isinstance(entry, str): #Block values that are meant to be strings from getting evaluated
                    value = key
                else:
                    try:
                        value = ast.literal_eval(key)
                    except ValueError:
                        value = ast.literal_eval("\'" + key+ "\'") #Fix literal_eval ValueError - https://stackoverflow.com/questions/14611352/malformed-string-valueerror-ast-literal-eval-with-string-representation-of-tup
                gui.setValue(dictionary, value)
                
                

def downloadSync(gui, file):
    pass

def uploadSync(gui):
    pass

def saveSync(gui):
    pass

def loadSync(gui):
    pass