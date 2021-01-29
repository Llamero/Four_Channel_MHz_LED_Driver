#include "Arduino.h"
#include "syncMode.h"
#include "pinSetup.h"
//
////Sync and input variables
//uint32_t DELAYS[] = {480, 505, 815}; //Delay (in µs) from trigger to LED trigger states
//boolean LED_START_STATE = false; //Whether the LED should be on (true) or off (false) at the start of delay 1
//float A_THRESHOLDS_VOLTS[] = {0, 0, 0, 0}; //Threshold (in volts) for analog triggers
//int A_THRESHOLDS_ADC[] = {0, 0, 0, 0}; //Threshold (in volts) for analog triggers
//boolean ANALOG_INPUTS[] = {false, false, false, false}; //Whether the input signal is analog or digital for each channel
//int SYNC_CHANNEL = 1; //Which input channel is the sync signal
//int SHUTTER_CHANNEL = 0; //Which channel is the shutter input 
//int FAULT_VOLUME = 127; //Volume of alarm to alert to fault temperature (0 = min, 127 = max);
//int START_VOLUME = 10; //Volume of short tone upon initializing (0 = min, 127 = max);
//boolean SYNC_TYPE = 1; //preset sync type
//boolean SYNC_TRIGGER_POL = 1; //digital trigger polarity (0 = Low, 1 = High) or analog trigger polarity (0 = Falling, 1 = Rising)
//boolean SHUTTER_TRIGGER_POL = 0; //Shutter trigger polarity (0 = Low, 1 = High) - only used for confocal syncs
//boolean LED_SOURCE = 1; //LED intensity signal source (0 = Ext source, 1 = AWG source)
//boolean TRIG_HOLD = 0; //trigger hold (0 = single shot, 1 = repeat until trigger resets), 
//int AWG_SOURCE = 0; //AWG source (0=rxPacket, 1=mirror knob - live update during sync),             
//boolean SYNC_OUT = 0; //Digital I/O 2 as sync out
////boolean MANUAL_MATCH_SYNC 
//
////LED control arrays
//float standby_int = 0; //LED intensity during standy
//float standby_pulse = 0; //LED pulse duration during standby
//
//uint32_t time_array[]; //Duration for each LED intensity in microseconds - one hour max
//uint16_t intensity_array[]; //Analog current through the LED (normally 0 - 4095)
//uint16_t pulse_duration_array[]; //Pulse duration of the LED relative to the total flyback time in microseconds
//uint8_t LED_channel_array[]; //Which LED channel is active - 4 bit mask
//
//uint32_t cur_LED_duration = 0; //the duration of the current LED intensity in microseconds - 1 hour max
//uint32_t LED_intensity_index = 0; //Current index in the LED intensity list
//
////Board configuration variables
//float CURRENT_SENSE_RESISTANCE = 2; //The effective net resistance of the current sense resistors
//float CURRENT_LIMITS_AMPS[] = {1, 1, 1, 1}; //Current limits for each LED in amps
//int CURRENT_LIMITS_ADC[]; //Current limits for each LED in DAC units (i.e. DAC maximum value for each LED)
//boolean ACTIVE_LED[] = {0, 0, 0, 0}; //The LED state of each of the four LED channels
//
////Output variables
//int EXT_FAN_CHANNEL = 0; //Which channel is used for PWM to the external fan (negative value = inactive)
//int EXT_SYNC_CHANNEL = 1; //Which channel is used for sending a 5V HIGH when the LED is on and 0V LOW when LED is off (negative value = inactive) 
//
//pinSetup pin;
//elapsedMicros timer1
//
syncMode::syncMode()
{

}

void syncMode::init(){
  
}
//
//void syncMode::confocalStandby(){
//  updateAWG(ledInt);//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//  PORTD = LEDstate0; //Set LED to standby state
//  while((boolean) (PIND & B00100000) != SHUTTERTRIGGERPOL){
//    interrupts(); //Turn on interrupts to automatically manage checking status
//    if(updateStatus) checkStatus();
//    if(event) return; //If event is a toogle event break loop and exit function 
//  }
//  noInterrupts(); //Turn off interrupts to keep precise timing during trigger syncs
//  if(TRIGGER == 2) confocalDigitalSync();
//  else confocalAnalogSync();
//}
//
//void syncMode::confocalDigitalSync(){
//  PORTD = LEDstate0; //Set LED to standby state
//  while ((boolean) (PIND & B00100000) == SHUTTERTRIGGERPOL){ //While shutter is open - continue using mirror sync  
//    if(DTRIGGERPOL) while(~PIND & B01000000); //Wait for sync trigger
//    else while(PIND & B01000000); //Wait for sync trigger
//    delayMicroseconds(DELAY1);
//    PORTD = LEDstate1; //Set LED to post trigger state
//    delayMicroseconds(DELAY2);
//    PORTD = LEDstate0; //Set LED to standby state
//    checkStatus();
//    if(event) return; //If event is a toogle event break loop and exit function
//  }
//  confocalStandby();
//}
//
//void syncMode::confocalAnalogSync(){
//  PORTD = LEDstate0; //Set LED to standby state
//  analogRead(ANALOGSEL);
//  while ((boolean) (PIND & B00100000) == SHUTTERTRIGGERPOL){ //While shutter is open - continue using mirror sync  
//    if(ATRIGGERPOL) while(analogRead(ANALOGSEL) < ATHRESHOLD); //Wait for sync trigger - 8us jitter
//    else while(analogRead(ANALOGSEL) > ATHRESHOLD); //Wait for sync trigger
//    delayMicroseconds(DELAY1);
//    PORTD = LEDstate1; //Set LED to post trigger state
//    delayMicroseconds(DELAY2);
//    PORTD = LEDstate0; //Set LED to standby state
//    delayMicroseconds(DELAY3);
//    PORTD = LEDstate1; //Set LED to post trigger state
//    delayMicroseconds(DELAY2);
//    PORTD = LEDstate0; //Set LED to standby state
//    checkStatus();
//    if(event) return; //If event is a toogle event break loop and exit function
//    analogRead(ANALOGSEL); //Refresh analog sync pin
//  }
//  confocalStandby(); 
//}
//
//void syncMode::checkStatus(){
//  if(!taskIndex && initialCount) initialCount--;
//  taskIndex++; //Increment task index
//  updateStatus = false; //Reset status flag
//  if(SYNCTYPE) interrupts(); //Turn interrupts back on if in confocal mode - needed for serial communication
//  if(taskIndex >= 0 && taskIndex <= 2){ //Record temperature - 12us
//    analogRead(taskIndex)>>2;
//    txPacket[HEADER + taskIndex] = analogRead(taskIndex)>>2; //Get temperature reading and convert to 8-bit
//  }
//  else if(taskIndex == 3){ //Get intensity knob position - 12us
//    analogRead(POT);
//    txPacket[HEADER + taskIndex] = analogRead(POT)>>2;
//  }
//  else if(taskIndex >= STATUSPACKET && taskIndex < (2*STATUSPACKET+HEADER) && !initialCount){ //6us
//    Serial.write(txPacket[taskIndex - STATUSPACKET]);
//  }
//  else if(taskIndex == 4){ //Perform all fast tasks as one set
//    txPacket[HEADER + taskIndex++] = syncStatus;
//    txPacket[HEADER + taskIndex] = PIND & B00000100; //Check toggle switch
//    if((txPacket[HEADER] < FAULTTEMP[0] || txPacket[HEADER+1] < FAULTTEMP[1] || txPacket[HEADER+2] < FAULTTEMP[2]) && !initialCount) event = 3; //Check whether device is overheating and enter failsafe if it is
//    buildPacket(STATUSPACKET, STATUSPACKET+HEADER);
//  }
//  //For remainder of checks monitor toggle switch and serial alternately to prevent over-riding event flags if both happen synchronously
//  else if(taskIndex%2){ //Check for received serial packet
//    if (Serial.available()){
//      event = 1; //Set event flag to check rx serial buffer if data is available
//    }
//  }
//  else{ //Monitor for change in toggle switch
//    if(toggleSwitch ^ (PIND & B00000100)){
//      toggleSwitch = (PIND & B00000100); 
//      event = 2;
//    } 
//  }
//  if(SYNCTYPE) noInterrupts(); //Turn interrupts back off if in confocal mode - removes 5us jitter in sync timing
//  if(event) eventHandler(); //If an event was found - run the event handler
//}
//
//void syncMode::eventHandler(){ //Take no action on event 2 as the calling function needs to clear first to avoid infinite recursion
//  if(event != 2){
//    if(event==1) processReceivedPackets();
//    else if(event==3 && !fault) failSafe();
//    event = 0; //Reset event handler
//  }
//}
//
//void rampIntensities(){
//  nLine = (uint32_t) timeArray[rampIndex];
//  if(arraySize-rampIndex){
//    updateAWG(intensityArray[rampIndex]); 
//    delay2 = (uint16_t) round((float) DELAY2 * pulseDurationArray[rampIndex]);
//    delay3 = DELAY3 + (DELAY2-delay2);   
//    rampIndex++;
//  }
//  else{ //If at the end of the ramp array, turn off led
//    nLine = 65535;
//    updateAWG(0);
//  }
//}
//
//void updateAWG(int awg){
//  if(awg <= 0){ //If value is 0, turn LED off
//    digitalWriteFast(pin.INTERLINE, LOW);
//  }
//  else{
//    digitalWriteFast(pin.INTERLINE, HIGH); //Turn LED on if it is off
//    analogWrite(pin.DAC0, awg);
//  }
//}
