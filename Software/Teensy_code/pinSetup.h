/*
  Default configuration of teensy pins
*/
#ifndef pinSetup_h
#define pinSetup_h

#include "Arduino.h"

//NOTE: It seems that in this compiler lists longer than 4 need to be built in CPP while shorter lists need to be built in header with constexpr

class pinSetup
{
  public:
    pinSetup();
    static void configurePins();
    static void setValues(float WARN_TEMP[3], float FAULT_TEMP[3], float FAN_LIMITS_TEMP[2], int EXT_THERMISTORNOMINAL, int EXT_BCOEFFICIENT, float EXT_TEMPERATURENOMINAL);
    static int adcMax(); //Returns the maximum value for the ADC
    static float mosfetTemp(); //Returns the current temperature of the MOSFET thermistor in °C
    static float resistorTemp(); //Returns the current temperature of the current sense resistor thermistor in °C
    static float extTemp(); //Returns the current temperature of the external thermistor in °C
    static float adcToTemp(int adc, int therm_nominal, float temp_nominal, int b_coefficient); //Convert raw ADC value to temperature in °C
    static int tempToAdc(float temperature, int therm_nominal, float temp_nominal, int b_coefficient); //Convert temperature in °C to equivalent ADC value
    
    constexpr static int RELAY[4] = {0, 1, 2, 3}; //SSR relays for changing LED channel
    const static int INTERLINE = 4; //Switch between analog input and negative refence voltage to turn off LED
    const static int NC[]; //Not connected pins
    const static int ANALOG_SELECT = 10; //Switches between internal and external analog input
    constexpr static int ALARM[2] = {11, 32}; //Audible alarm
    const static int TOGGLE = 12; //Toggle switch input
    const static uint16_t DEBOUNCE = 100; //ms to wait for switch to stop bouncing
    
    const static int RESISTOR_TEMP = 14; //NTC thermistor monitoring current sense resistor temp
    const static int MOSFET_TEMP = 15; //NTC thermistor monitoring current regulator MOSFET temp
    const static int EXTERNAL_TEMP = 16; //NTC thermistor monitoring external temp (such as on-board LED thermistor)
    const static int ISENSE = 17; //Analog input to measure current sense voltage
    const static int SDA0 = 18; //I2C SDA pin for optional peripheral comunication
    const static int SCL0 = 19; //I2C SCL pin for optional peripheral comunication
    constexpr static int OUTPUTS[3] = {22, 21, 20}; //5V output pins for external triggering/PWM
    const static int FAN_PWM = 23; //5V PWM to control internal fan speed
    
    constexpr static int PUSHBUTTON[4] = {27, 25, 26, 30}; //Four pushbutton inputs 
    constexpr static int LED[4] = {29, 24, 28, 31}; //Indicator LEDs on pushbuttons
    
    const static int POT = 33; //Input voltage from potentiometer
    constexpr static int INPUTS[4] = {37, 36, 35, 34}; //4-channel analog/digital inputs
    const static int DAC0 = A21; //Internal dac to generate internal analog input voltage
    const static int DAC1 = A22; //Internal dac - not connected

  private:
    static void init(); //Initialize reference variables
    static void convertToAdc(); //Convert reference temperatures to ADC values
   
    //ADC setup
    const static int adcAveraging = 1; //Number of times to average adc recording before returning value
    const static int adcResolution = 16; //Number of significant bits to return per adc recording

    //Thermistor setup
    static float _WARN_TEMP[3]; //Warning temperatures (°C) for the MOSFET, resisitor, and external thermistor correspondingly.  This is also the temp the board need to cool down to before reactivating after a fault
    static float _FAULT_TEMP[3]; //Fault temperature(°C) for the MOSFET, resisitor, and external thermistor correspondingly.  If the board rises above this temp it will deactivate the LED and driver until the temperature falls below the warn temperature
    static int WARN_ADC_TEMP[3]; //Warning temperatures (in ADC units)  for the MOSFET, resisitor, and external thermistor correspondingly.  This is also the temp the board need to cool down to before reactivating after a fault
    static int FAULT_ADC_TEMP[3]; //Fault temperature(in ADC units) for the MOSFET, resisitor, and external thermistor correspondingly.  If the board rises above this temp it will deactivate the LED and driver until the temperature falls below the warn temperature
    static float _FAN_LIMITS_TEMP[2]; //LED temp at which the PWM fan runs at minimum speed - default to just above room temp so that fan turns off when driver is inactive
    static int FAN_LIMITS_ADC[2]; //LED temp above which the PWM fan runs at maximum speed, - default to warn temp
    const static int SERIES_RESISTOR = 4700; //Value of series resistor to the thermistor on the PCB
    const static int PCB_THERMISTOR_NOMINAL = 4700; //Value of thermistor resistor on PCB at nominal temp (normally 25°C)
    const static int PCB_B_COEFFICIENT = 3545; //Beta value for the PCB thermistor
    constexpr static float PCB_TEMPERATURE_NOMINAL = 25; //Reference temperature for the nominal resistance on the thermistor on the PCB
    static int _EXT_THERMISTOR_NOMINAL; //Value of thermistor resistor on PCB at nominal temp (normally 25°C)
    static int _EXT_B_COEFFICIENT; //Beta value for the PCB thermistor
    static float _EXT_TEMPERATURE_NOMINAL; //Reference temperature for the nominal resistance on the thermistor on the PCB
};
   
#endif
