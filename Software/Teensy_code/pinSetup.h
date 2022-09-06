/*
  Default configuration of teensy pins
*/
#ifndef pinSetup_h
#define pinSetup_h

#include "Arduino.h"
#include "AnalogBufferDMA.h"

//NOTE: It seems that in this compiler lists longer than 4 need to be built in CPP while shorter lists need to be built in header with constexpr

class pinSetup
{
  public:
    pinSetup();
    static void configurePins();
    static int adcMax(); //Returns the maximum value for the ADC
    static uint16_t mosfetTemp(); //Returns the current temperature of the MOSFET thermistor in °C
    static uint16_t resistorTemp(); //Returns the current temperature of the current sense resistor thermistor in °C
    static uint16_t extTemp(); //Returns the current temperature of the external thermistor in °C
    static float adcToTemp(int adc, int therm_nominal, int b_coefficient); //Convert raw ADC value to temperature in °C
    static int tempToAdc(float temperature, int therm_nominal, int b_coefficient); //Convert temperature in °C to equivalent ADC value
    static uint16_t captureWave(uint16_t test_dac_value, uint8_t *cobs_buffer);
    
    const static int RELAY[4]; //SSR relays for changing LED channel
    const static int INTERLINE = 4; //Switch between analog input and negative refence voltage to turn off LED
    const static int NC[]; //Not connected pins
    const static int ANALOG_SELECT = 10; //Switches between internal and external analog input
    const static int ALARM[2]; //Audible alarm
    const static int TOGGLE = 12; //Toggle switch input
    const static uint16_t DEBOUNCE = 200; //ms to wait for switch to stop bouncing
    
    const static int RESISTOR_TEMP = 14; //NTC thermistor monitoring current sense resistor temp
    const static int MOSFET_TEMP = 15; //NTC thermistor monitoring current regulator MOSFET temp
    const static int EXTERNAL_TEMP = 16; //NTC thermistor monitoring external temp (such as on-board LED thermistor)
    const static int ISENSE = 17; //Analog input to measure current sense voltage
    const static int SDA0 = 18; //I2C SDA pin for optional peripheral comunication
    const static int SCL0 = 19; //I2C SCL pin for optional peripheral comunication
    const static int OUTPUTS[]; //5V output pins for external triggering/PWM
    const static int FAN_PWM = 23; //5V PWM to control internal fan speed
    
    const static int PUSHBUTTON[4]; //Four pushbutton inputs 
    const static int LED[4]; //Indicator LEDs on pushbuttons
    
    const static int POT = 33; //Input voltage from potentiometer
    const static int INPUTS[4]; //4-channel analog/digital inputs
    const static int DAC0 = A21; //Internal dac to generate internal analog input voltage
    const static int DAC1 = A22; //Internal dac - not connected

    const static int LED_FREQ = 15850; //LED driver PWM freq - default to 2^n multiple to have optimal dynamic range while staying outside the auditory range - https://www.pjrc.com/teensy/td_pulse.html
    const static int FAN_FREQ = 25000; //5V output PWM frequency (in Hz) - 25kHz is optimal for driving CPU fans
    const static bool RELAY_CLOSE = true; //Polarity of relay inputs to close relay - False - 0=closed, 1=open, True - 0=open, 1=closed

  private:
    static void init(); //Initialize reference variables
    static void convertToAdc(); //Convert reference temperatures to ADC values
   
    //ADC setup
    const static int adc_averaging = 1; //Number of times to average adc recording before returning value
    const static int adc_resolution = 16; //Number of significant bits to return per adc recording
    
    const static int SERIES_RESISTOR = 4700; //Value of series resistor to the thermistor on the PCB
    const static int PCB_THERMISTOR_NOMINAL = 4700; //Value of thermistor resistor on PCB at nominal temp (25°C)
    const static int PCB_B_COEFFICIENT = 3545; //Beta value for the PCB thermistor

    static uint16_t buffer_size; //Variable for storing the size of the calibration stream packet to be sent back to GUI
};
   
#endif
