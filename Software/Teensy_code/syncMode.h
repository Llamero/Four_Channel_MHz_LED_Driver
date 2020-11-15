/*
  Different sync configurations for controlling the LED output
*/
#ifndef syncMode_h
#define syncMode_h

#include "Arduino.h"

class syncMode
{
  public:
    syncMode();
    friend class serialComm;

  private:
    void init();
  
    //Sync and input variables
    static uint32_t DELAYS[3]; //Delay (in µs) from trigger to LED trigger states
    static boolean LED_START_STATE; //Whether the LED should be on (true) or off (false) at the start of delay 1
    static float A_THRESHOLDS_VOLTS[4]; //Threshold (in volts) for analog triggers
    static int A_THRESHOLDS_ADC[4]; //Threshold (in volts) for analog triggers
    static boolean ANALOG_INPUTS[4]; //Whether the input signal is analog or digital for each channel
    static int SYNC_CHANNEL; //Which input channel is the sync signal
    static int SHUTTER_CHANNEL; //Which channel is the shutter input 
    static uint8_t FAULT_VOLUME; //Volume of alarm to alert to fault temperature (0 = min, 127 = max);
    static uint8_t START_VOLUME; //Volume of short tone upon initializing (0 = min, 127 = max);
    static boolean SYNC_TYPE; //preset sync type
    static boolean SYNC_TRIGGER_POL; //digital trigger polarity (0 = Low, 1 = High) or analog trigger polarity (0 = Falling, 1 = Rising)
    static boolean SHUTTER_TRIGGER_POL; //Shutter trigger polarity (0 = Low, 1 = High) - only used for confocal syncs
    static boolean LED_SOURCE; //LED intensity signal source (0 = Ext source, 1 = AWG source)
    static boolean TRIG_HOLD; //trigger hold (0 = single shot, 1 = repeat until trigger resets), 
    static uint8_t AWG_SOURCE; //AWG source (0=rxPacket, 1=mirror the intensity knob - hold fixed during sync, 2 - live update during sync),             
    static uint8_t SYNC_OUT; //Digital I/O 2 as sync out (0=false, 64=true)
    static float MIRROR_PERIOD; //Time in milliseconds per line scan

    //Board configuration variables
    static float CURRENT_SENSE_RESISTANCE; //The effective net resistance of the current sense resistors
    static float CURRENT_LIMITS_AMPS[4]; //Current limits for each LED in amps
    static int CURRENT_LIMITS_ADC[4]; //Current limits for each LED in DAC units (i.e. DAC maximum value for each LED)
    static boolean ACTIVE_LED[4]; //The LED state of each of the four LED channels
    
    //Output variables
    int EXT_FAN_CHANNEL = 0; //Which channel is used for PWM to the external fan (negative value = inactive)
    int EXT_SYNC_CHANNEL = 1; //Which channel is used for sending a 5V HIGH when the LED is on and 0V LOW when LED is off (negative value = inactive) 
};
#endif
