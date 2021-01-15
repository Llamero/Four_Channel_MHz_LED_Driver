from collections import OrderedDict
import guiSequence as seq



from PyQt5 import QtGui

def initializeConfigModel(self):
    config_model = OrderedDict()
    config_model["Driver name"] = self.configure_name_driver_line_edit
    # LEDs
    for led_number in range(1, 5):
        config_model["LED" + str(led_number)] = OrderedDict(
            [("ID", eval("self.configure_name_LED" + str(led_number) + "_line_edit")),
             ("Active", eval("self.configure_name_LED" + str(led_number) + "_box")),
             ("Current limit", eval("self.configure_current_limit_LED" + str(led_number) + "_spin_box")),
             ("Channels", [
                 eval("self.configure_LED_merge_channel1_button" + str(led_number)),
                 eval("self.configure_LED_merge_channel2_button" + str(led_number)),
                 eval("self.configure_LED_merge_channel3_button" + str(led_number)),
                 eval("self.configure_LED_merge_channel4_button" + str(led_number))])])
    # Current sense resistors
    for resistor in range(1, 5):
        config_model["Resistor" + str(resistor)] = OrderedDict(
            [("Value", eval("self.configure_resistor" + str(resistor) + "_spin_box")),
             ("Active", eval("self.configure_resistor" + str(resistor) + "_box"))])

    # Temperature cutoffs
    config_model["Temperature"] = OrderedDict()
    for source in ["Transistor", "Resistor", "External"]:
        config_model["Temperature"][source] = OrderedDict(
            [("Warn", eval("self.configure_temperature_" + source.lower() + "_warn_box")),
             ("Fault", eval("self.configure_temperature_" + source.lower() + "_fault_box"))])

    # Fan settings
    config_model["Fan"] = OrderedDict()
    for source in ["Driver", "External"]:
        config_model["Fan"][source] = OrderedDict(
            [("Min", eval("self.configure_fan_" + source.lower() + "_min_box")),
             ("Max", eval("self.configure_fan_" + source.lower() + "_max_box"))])
    config_model["Fan"]["Channel"] = [self.configure_fan_external_output1_box,
                                           self.configure_fan_external_output2_box,
                                           self.configure_fan_external_output3_box]

    # External Thermistor
    config_model["Thermistor"] = OrderedDict(
        [("Resistance", self.configure_thermistor_resistance_box), ("Beta", self.configure_thermistor_beta_box)])

    # Audio settings
    config_model["Audio"] = OrderedDict(
        [("Status", self.configure_audio_status_slider), ("Alarm", self.configure_audio_alarm_slider)])

    # Pushbuttons
    config_model["Pushbutton"] = OrderedDict([("Intensity", self.configure_pushbutton_intensity_slider),
                                                   ("Alarm", [self.configure_pushbutton_alarm_flash_button,
                                                              self.configure_pushbutton_alarm_chase_button,
                                                              self.configure_pushbutton_alarm_pulse_button,
                                                              self.configure_pushbutton_alarm_solid_button])])

    return config_model

def initializeEvents(self):
    #Dark mode view
    self.menu_view_dark_mode.triggered.connect(self.toggleSkin)

    #Save and load sequence files
    self.sync_digital_trigger_low_sequence_save_button.clicked.connect(lambda: seq.saveSequence(self, self.sync_digital_trigger_low_sequence_table))
    self.sync_digital_trigger_low_sequence_load_button.clicked.connect(lambda: seq.loadSequence(self, self.sync_digital_trigger_low_sequence_table))
    self.sync_digital_trigger_high_sequence_save_button.clicked.connect(lambda: seq.saveSequence(self, self.sync_digital_trigger_high_sequence_table))
    self.sync_digital_trigger_high_sequence_load_button.clicked.connect(lambda: seq.loadSequence(self, self.sync_digital_trigger_high_sequence_table))
    self.sync_confocal_image_sequence_save_button.clicked.connect(lambda: seq.saveSequence(self, self.sync_confocal_image_sequence_table))
    self.sync_confocal_image_sequence_load_button.clicked.connect(lambda: seq.loadSequence(self, self.sync_confocal_image_sequence_table))
    self.sync_confocal_flyback_sequence_save_button.clicked.connect(lambda: seq.saveSequence(self, self.sync_confocal_flyback_sequence_table))
    self.sync_confocal_flyback_sequence_load_button.clicked.connect(lambda: seq.loadSequence(self, self.sync_confocal_flyback_sequence_table))