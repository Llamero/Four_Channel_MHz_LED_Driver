import math
import struct
import tempfile
from PyQt5 import QtGui
from collections import OrderedDict
import ast
import guiSequence as seq

#Thermistor properties
PCB_THERMISTOR_NOMINAL = 4700 #Value of thermistor on PCB at nominal temp (25°C)
PCB_B_COEFFICIENT = 3545 #Beta value for the PCB thermistor
EXT_THERMISTOR_NOMINAL = 4700 #Value of external thermistor at nominal temp (25°C)
EXT_B_COEFFICIENT = 3545 #Beta value for the PCB thermistor
SERIES_RESISTOR = 4700 #Resistor value in series with thermistor on PCB board

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
                    except SyntaxError:
                        gui.message_box.setText("Error: \"" + line + "\" could not be parsed. Load aborted at this step.")
                        gui.message_box.exec()
                        return
                if key_path[-1] == "Sequence": #Process sequence file loads separately
                    seq.setSequencePath(gui, key_path, value) #Save path to dictionary
                    widget = eval("gui.sync_" + key_path[0].lower() + "_" + key_path[1].lower() + "_sequence_table") #Assign to proper widget table
                    if value != "None":
                        seq.loadSequence(gui, widget, key_path, True) #Load sequence file to table
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

def checkCurrentLimits(gui):
    total_resistance = 0
    for resistor in range(1,5):
        if gui.getValue(gui.config_model["Resistor" + str(resistor)]["Active"]):
            total_resistance += 1/gui.getValue(gui.config_model["Resistor" + str(resistor)]["Value"])
    total_resistance = 1/total_resistance
    maximum_current = 3.33/total_resistance
    maximum_current = round(maximum_current, -int(math.floor(math.log10(abs(maximum_current))))+1) #Report max current to 2 significant figures - https://stackoverflow.com/questions/3410976/how-to-round-a-number-to-significant-figures-in-python

    gui.configure_current_limit_box.setTitle("LED Current Limit (" + str(maximum_current) + "A Max)")
    for led_number in range(1,5):
        gui.config_model["LED" + str(led_number)]["Current Limit"].setMaximum(maximum_current)
        gui.config_model["LED" + str(led_number)]["Current Limit"].setToolTip("Set the current limit (in amps) for LED #1"
                                                                              " - " + str(maximum_current) + " amps maximum.")
def bytesToConfig(byte_array, gui):
    global EXT_THERMISTOR_NOMINAL
    global EXT_B_COEFFICIENT
    start_index = 0
    index = 0
    while int(byte_array[index]) != 0:
        index += 1
    gui.setValue(gui.config_model["Driver name"], byte_array[start_index:index].decode())

    for led_number in range (1,5):
        index += 1
        start_index = index
        while int(byte_array[index]) != 0:
            index += 1
        gui.setValue(gui.config_model["LED" + str(led_number)]["ID"], byte_array[start_index:index].decode())
    index += 1
    config_values = struct.unpack("<????HHHHBBBBffff????HHHHHHHHHHBiiBBHBB", byte_array[index:]) #Parse byte array values: https://docs.python.org/3/library/struct.html#struct-alignment
    print(config_values)

    #Calculate total resistance to be able to convert current limit values
    total_resistance = 0
    for resistor in range (1,5):
        resistance = config_values[resistor + 11]
        active = config_values[resistor + 15]
        if active:
            total_resistance += 1/resistance
        gui.setValue(gui.config_model["Resistor" + str(resistor)]["Value"], resistance)
        gui.setValue(gui.config_model["Resistor" + str(resistor)]["Active"], active)
    total_resistance = 1 / total_resistance

    for led_number in range(1, 5):
        current_limit = config_values[led_number + 3]
        current_limit = (3.3*(current_limit/65535))/total_resistance

        gui.setValue(gui.config_model["LED" + str(led_number)]["Active"], config_values[led_number - 1])
        gui.setValue(gui.config_model["LED" + str(led_number)]["Current Limit"], current_limit)
        channel_id = gui.getValue(gui.config_model["LED" + str(config_values[led_number + 7])]["ID"])
        gui.setValue(gui.config_model["Channel" + str(led_number)], channel_id)

    #Get external thermistor properties to convert ADC values to temperatures
    EXT_THERMISTOR_NOMINAL = config_values[31]  # Value of external thermistor at nominal temp (25°C)
    EXT_B_COEFFICIENT = config_values[32]  # Beta value for the PCB thermistor

    for index, source in enumerate(["Transistor", "Resistor", "External"]):
        external = False
        if source == "External":
            external = True
        gui.setValue(gui.config_model["Temperature"][source]["Warn"], adcToTemp(config_values[20], external))
        gui.setValue(gui.config_model["Temperature"][source]["Fault"], adcToTemp(config_values[23], external))

    for index, source in enumerate(["Driver", "External"]):
        external = False
        if source == "External":
            external = True
        gui.setValue(gui.config_model["Fan"][source]["Min"], adcToTemp(config_values[20], external))
        gui.setValue(gui.config_model["Fan"][source]["Max"], adcToTemp(config_values[23], external))

    channel_id = gui.config_model["Fan"]["Channel"][config_values[30]].text()
    gui.setValue(gui.config_model["Fan"]["Channel"], channel_id)

    gui.setValue(gui.config_model["Audio"]["Status"], config_values[33])
    gui.setValue(gui.config_model["Audio"]["Alarm"], config_values[34])

    gui.setValue(gui.config_model["Pushbutton"]["Intensity"], round(config_values[35]/65535*100))
    channel_id = gui.config_model["Pushbutton"]["Alarm"][config_values[36]].text()
    gui.setValue(gui.config_model["Pushbutton"]["Alarm"], channel_id)



def adcToTemp(adc, external = False):
    if external:
        therm_nominal = EXT_THERMISTOR_NOMINAL
        b_coefficient = EXT_B_COEFFICIENT
    else:
        therm_nominal = PCB_THERMISTOR_NOMINAL
        b_coefficient = PCB_B_COEFFICIENT
    raw = adc
    raw = 65535 / raw - 1
    raw = SERIES_RESISTOR / raw
    steinhart = raw / therm_nominal
    steinhart = math.log(steinhart)
    steinhart /= b_coefficient
    steinhart += 1.0 / (25 + 273.15)
    steinhart = 1.0 / steinhart
    steinhart -= 273.15
    return round(steinhart)

def tempToAdc(temperature, external = False):
    if external:
        therm_nominal = EXT_THERMISTOR_NOMINAL
        b_coefficient = EXT_B_COEFFICIENT
    else:
        therm_nominal = PCB_THERMISTOR_NOMINAL
        b_coefficient = PCB_B_COEFFICIENT

    steinhart = temperature
    steinhart += 273.15
    steinhart = 1.0 / steinhart
    steinhart -= 1.0 / (25 + 273.15)
    steinhart *= b_coefficient
    steinhart = math.exp(steinhart)
    raw = steinhart * therm_nominal
    raw = SERIES_RESISTOR / raw
    raw = 65535 / (raw + 1)
    return round(raw)


