from collections import OrderedDict
import guiSequence as seq
import guiConfigIO as fileIO
from PyQt5 import QtGui

def initializeConfigModel(gui):
    config_model = OrderedDict()
    config_model["Driver name"] = gui.configure_name_driver_line_edit
    # LEDs
    for led_number in range(1, 5):
        config_model["LED" + str(led_number)] = OrderedDict(
            [("ID", eval("gui.configure_name_LED" + str(led_number) + "_line_edit")),
             ("Active", eval("gui.configure_name_LED" + str(led_number) + "_box")),
             ("Current Limit", eval("gui.configure_current_limit_LED" + str(led_number) + "_spin_box"))])

    #Channels
    for channel in range(1,5):
        config_model["Channel" + str(channel)] = []
        for led_number in range(1,5):
            config_model["Channel" + str(channel)].append(eval("gui.configure_LED_merge_channel" + str(channel) + "_button" + str(led_number)))

    # Current sense resistors
    for resistor in range(1, 5):
        config_model["Resistor" + str(resistor)] = OrderedDict(
            [("Value", eval("gui.configure_resistor" + str(resistor) + "_spin_box")),
             ("Active", eval("gui.configure_resistor" + str(resistor) + "_box"))])

    # Temperature cutoffs
    config_model["Temperature"] = OrderedDict()
    for source in ["Transistor", "Resistor", "External"]:
        config_model["Temperature"][source] = OrderedDict(
            [("Warn", eval("gui.configure_temperature_" + source.lower() + "_warn_box")),
             ("Fault", eval("gui.configure_temperature_" + source.lower() + "_fault_box"))])

    # Fan settings
    config_model["Fan"] = OrderedDict()
    for source in ["Driver", "External"]:
        config_model["Fan"][source] = OrderedDict(
            [("Min", eval("gui.configure_fan_" + source.lower() + "_min_box")),
             ("Max", eval("gui.configure_fan_" + source.lower() + "_max_box"))])
    config_model["Fan"]["Channel"] = []
    for channel in range(4):
        config_model["Fan"]["Channel"].append(eval("gui.configure_fan_external_output" + str(channel) + "_box"))

    # External Thermistor
    config_model["Thermistor"] = OrderedDict(
        [("Resistance", gui.configure_thermistor_resistance_box), ("Beta", gui.configure_thermistor_beta_box)])

    # Audio settings
    config_model["Audio"] = OrderedDict(
        [("Status", gui.configure_audio_status_slider), ("Alarm", gui.configure_audio_alarm_slider)])

    # Pushbuttons
    config_model["Pushbutton"] = OrderedDict([("Intensity", gui.configure_pushbutton_intensity_slider),
                                                   ("Alarm", [gui.configure_pushbutton_alarm_flash_button,
                                                              gui.configure_pushbutton_alarm_chase_button,
                                                              gui.configure_pushbutton_alarm_pulse_button,
                                                              gui.configure_pushbutton_alarm_solid_button,
                                                              gui.configure_pushbutton_alarm_disable_button])])

    return config_model

def initializeSyncModel(gui):
    def initializeDigital():
        nonlocal gui
        sync_model["Digital"] = OrderedDict()
        sync_model["Digital"]["Channel"] = []
        for channel_number in range(1, 5):
            sync_model["Digital"]["Channel"].append(eval("gui.sync_digital_input" + str(channel_number) + "_button"))
        for trigger in ["Low", "High"]:
            sync_model["Digital"][trigger] = OrderedDict()
            sync_model["Digital"][trigger]["Mode"] = eval("gui.sync_digital_trigger_" + trigger.lower() + "_tab")
            sync_model["Digital"][trigger]["LED"] = []
            for led_number in range(5):
                sync_model["Digital"][trigger]["LED"].append(eval("gui.sync_digital_trigger_" + trigger.lower() + "_constant_LED" + str(led_number) + "_button"))
            sync_model["Digital"][trigger]["PWM"] = eval("gui.sync_digital_trigger_" + trigger.lower() + "_constant_config_PWM_box")
            sync_model["Digital"][trigger]["Current"] = eval("gui.sync_digital_trigger_" + trigger.lower() + "_constant_config_current_box")
            sync_model["Digital"][trigger]["Duration"] = eval("gui.sync_digital_trigger_" + trigger.lower() + "_constant_config_duration_box")
            sync_model["Digital"][trigger]["Sequence"] = ""

    def initializeAnalog():
        nonlocal gui
        sync_model["Analog"] = OrderedDict()
        sync_model["Analog"]["LED"] = []
        for led_number in range(5):
            sync_model["Analog"]["LED"].append(eval("gui.sync_analog_LED" + str(led_number) + "_button"))
        sync_model["Analog"]["Channel"] = []
        for channel_number in range(1, 5):
            sync_model["Analog"]["Channel"].append(eval("gui.sync_analog_input" + str(channel_number) + "_button"))
        sync_model["Analog"]["Mode"] = gui.sync_analog_output_tab
        sync_model["Analog"]["PWM"] = gui.sync_analog_output_PWM_avg_slider
        sync_model["Analog"]["Current"] = gui.sync_analog_output_current_avg_slider

    def initializeConfocal():
        nonlocal gui
        sync_model["Confocal"] = OrderedDict()
        sync_model["Confocal"]["Shutter"] = [gui.sync_confocal_shutter_low_button, gui.sync_confocal_shutter_high_button]
        sync_model["Confocal"]["Channel"] = []
        for channel_number in range(1, 5):
            sync_model["Confocal"]["Channel"].append(eval("gui.sync_confocal_line_input" + str(channel_number) + "_button"))
        sync_model["Confocal"]["Line"] = gui.sync_confocal_line_tab
        sync_model["Confocal"]["Digital"] = [gui.sync_confocal_line_digital_low_button, gui.sync_confocal_line_digital_high_button]
        sync_model["Confocal"]["Threshold"] = gui.sync_confocal_line_analog_threshold_box
        sync_model["Confocal"]["Polarity"] = [gui.sync_confocal_line_analog_polarity_above_button, gui.sync_confocal_line_analog_polarity_below_button]
        sync_model["Confocal"]["Delay"] = OrderedDict()
        sync_model["Confocal"]["Delay"]["Mode"] = [gui.sync_confocal_scan_unidirectional_button, gui.sync_confocal_scan_bidirectional_button]
        for delay in range(1,4):
            sync_model["Confocal"]["Delay"][str(delay)] = eval("gui.sync_confocal_delay" + str(delay) + "_box")
        for event in ["Image", "Flyback"]:
            sync_model["Confocal"][event] = OrderedDict()
            sync_model["Confocal"][event]["Mode"] = eval("gui.sync_confocal_" + event.lower() + "_tab")
            sync_model["Confocal"][event]["LED"] = []
            for led_number in range(5):
                sync_model["Confocal"][event]["LED"].append(eval("gui.sync_confocal_" + event.lower() + "_constant_LED" + str(led_number) + "_button"))
            sync_model["Confocal"][event]["PWM"] = eval("gui.sync_confocal_" + event.lower() + "_constant_config_PWM_box")
            sync_model["Confocal"][event]["Current"] = eval("gui.sync_confocal_" + event.lower() + "_constant_config_current_box")
            sync_model["Confocal"][event]["Duration"] = eval("gui.sync_confocal_" + event.lower() + "_constant_config_duration_box")
            sync_model["Confocal"][event]["Sequence"] = ""

    sync_model = OrderedDict()
    sync_model["Mode"] = gui.sync_toolbox
    initializeDigital()
    initializeAnalog()
    initializeConfocal()
    sync_model["Output"] = []
    for output in range(4):
        sync_model["Output"].append(eval("gui.sync_output" + str(output) + "_button"))

    return sync_model

def initializeEvents(gui):
    def mainEvents():
        nonlocal gui

        #Connect dial and spinbox values - https://www.youtube.com/watch?v=BSP9sB0JoaE
        gui.main_intensity_dial.valueChanged.connect(
            lambda: gui.syncDialAndSpinbox(gui.main_intensity_dial, gui.main_intensity_spinbox))
        gui.main_intensity_spinbox.valueChanged.connect(
            lambda: gui.syncDialAndSpinbox(gui.main_intensity_spinbox, gui.main_intensity_dial))

    def configureEvents():
        nonlocal gui
        def driverNameEvents():
            gui.configure_name_driver_line_edit.textChanged.connect(lambda: gui.changeDriverName(gui.configure_name_driver_line_edit))

        def ledCheckBoxEvents():
            nonlocal gui
            # Changes to LED check boxes - toggle whether LED is active
            gui.configure_name_LED1_box.stateChanged.connect(lambda: gui.toggleLedActive(1))
            gui.configure_name_LED2_box.stateChanged.connect(lambda: gui.toggleLedActive(2))
            gui.configure_name_LED3_box.stateChanged.connect(lambda: gui.toggleLedActive(3))
            gui.configure_name_LED4_box.stateChanged.connect(lambda: gui.toggleLedActive(4))

        def ledNameEvents():
            nonlocal gui
            # Changes to LED names - updates GUI LED references with new name
            gui.configure_name_LED1_line_edit.textChanged.connect(lambda: gui.changeLedName(1, gui.configure_name_LED1_line_edit))
            gui.configure_name_LED2_line_edit.textChanged.connect(lambda: gui.changeLedName(2, gui.configure_name_LED2_line_edit))
            gui.configure_name_LED3_line_edit.textChanged.connect(lambda: gui.changeLedName(3, gui.configure_name_LED3_line_edit))
            gui.configure_name_LED4_line_edit.textChanged.connect(lambda: gui.changeLedName(4, gui.configure_name_LED4_line_edit))

        def resistorCheckBoxEvents():
            nonlocal gui
            # Changes to resistor check boxes - toggle whether resistor is active
            gui.configure_resistor2_box.stateChanged.connect(lambda: gui.toggleResistorActive(2))
            gui.configure_resistor3_box.stateChanged.connect(lambda: gui.toggleResistorActive(3))
            gui.configure_resistor4_box.stateChanged.connect(lambda: gui.toggleResistorActive(4))

        def resistorValueEvents():
            for resistor_number in range(1,5):
                gui.config_model["Resistor" + str(resistor_number)]["Value"].valueChanged.connect(lambda: fileIO.checkCurrentLimits(gui))

        def fanChannelEvents():
            gui.config_model["Fan"]["Channel"][0].clicked.connect(lambda: gui.disableUsedOutputs(0, "config"))
            gui.config_model["Fan"]["Channel"][1].clicked.connect(lambda: gui.disableUsedOutputs(1, "config"))
            gui.config_model["Fan"]["Channel"][2].clicked.connect(lambda: gui.disableUsedOutputs(2, "config"))
            gui.config_model["Fan"]["Channel"][3].clicked.connect(lambda: gui.disableUsedOutputs(3, "config"))

        driverNameEvents()
        ledCheckBoxEvents()
        ledNameEvents()
        resistorCheckBoxEvents()
        resistorValueEvents()
        fanChannelEvents()
        gui.configure_save_button.clicked.connect(lambda: fileIO.saveConfiguration(gui, gui.config_model))
        gui.configure_load_button.clicked.connect(lambda: fileIO.loadConfiguration(gui, gui.config_model))

    def syncEvents():
        nonlocal gui

        def sequenceEvents():
            nonlocal gui
            # Save and load sequence files
            gui.sync_digital_trigger_low_sequence_save_button.clicked.connect(
                lambda: seq.saveSequence(gui, gui.sync_digital_low_sequence_table, ["Digital", "Low", "Sequence"]))
            gui.sync_digital_trigger_low_sequence_load_button.clicked.connect(
                lambda: seq.loadSequence(gui, gui.sync_digital_low_sequence_table, ["Digital", "Low", "Sequence"]))
            gui.sync_digital_trigger_high_sequence_save_button.clicked.connect(
                lambda: seq.saveSequence(gui, gui.sync_digital_high_sequence_table, ["Digital", "High", "Sequence"]))
            gui.sync_digital_trigger_high_sequence_load_button.clicked.connect(
                lambda: seq.loadSequence(gui, gui.sync_digital_high_sequence_table, ["Digital", "High", "Sequence"]))
            gui.sync_confocal_image_sequence_save_button.clicked.connect(
                lambda: seq.saveSequence(gui, gui.sync_confocal_image_sequence_table, ["Confocal", "Image", "Sequence"]))
            gui.sync_confocal_image_sequence_load_button.clicked.connect(
                lambda: seq.loadSequence(gui, gui.sync_confocal_image_sequence_table, ["Confocal", "Image", "Sequence"]))
            gui.sync_confocal_flyback_sequence_save_button.clicked.connect(
                lambda: seq.saveSequence(gui, gui.sync_confocal_flyback_sequence_table, ["Confocal", "Flyback", "Sequence"]))
            gui.sync_confocal_flyback_sequence_load_button.clicked.connect(
                lambda: seq.loadSequence(gui, gui.sync_confocal_flyback_sequence_table, ["Confocal", "Flyback", "Sequence"]))

            # Changes to sequence table
            gui.sync_digital_low_sequence_table.itemChanged.connect(
                lambda: seq.dynamicallyCheckTable(gui, gui.sync_digital_low_sequence_table, ["Digital", "Low", "Sequence"]))
            gui.sync_digital_high_sequence_table.itemChanged.connect(
                lambda: seq.dynamicallyCheckTable(gui, gui.sync_digital_high_sequence_table, ["Digital", "High", "Sequence"]))
            gui.sync_confocal_image_sequence_table.itemChanged.connect(
                lambda: seq.dynamicallyCheckTable(gui, gui.sync_confocal_image_sequence_table, ["Confocal", "Image", "Sequence"]))
            gui.sync_confocal_flyback_sequence_table.itemChanged.connect(
                lambda: seq.dynamicallyCheckTable(gui, gui.sync_confocal_flyback_sequence_table, ["Confocal", "Flyback", "Sequence"]))

        def outputChannelEvents():
            gui.sync_model["Output"][0].clicked.connect(lambda: gui.disableUsedOutputs(0, "sync"))
            gui.sync_model["Output"][1].clicked.connect(lambda: gui.disableUsedOutputs(1, "sync"))
            gui.sync_model["Output"][2].clicked.connect(lambda: gui.disableUsedOutputs(2, "sync"))
            gui.sync_model["Output"][3].clicked.connect(lambda: gui.disableUsedOutputs(3, "sync"))

        sequenceEvents()
        outputChannelEvents()
        gui.sync_analog_output_tab.currentChanged.connect(lambda: gui.toggleAnalogChannel(gui.sync_analog_output_tab))
        gui.sync_confocal_scan_unidirectional_button.toggled.connect(lambda: gui.toggleScanMode())
        gui.sync_save_button.clicked.connect(lambda: seq.findUnsavedSeqThenSave(gui, gui.sync_model))
        gui.sync_load_button.clicked.connect(lambda: fileIO.loadConfiguration(gui, gui.sync_model))

    mainEvents()
    syncEvents()
    configureEvents()



    #Dark mode view
    gui.menu_view_dark_mode.triggered.connect(gui.toggleSkin)





