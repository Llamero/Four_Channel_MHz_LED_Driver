
#include <ADC.h>
#include <ADC_util.h>
#include <Wire.h>

//Serial constants
const char DEVICE_NAME[] = "MOM Test Box";
//const char DEVICE_NAME[] = "Just an Arduino";
const long BAUDRATE = 12000000;  //Teensy USB is always 12 Mbit/s - https://www.pjrc.com/teensy/td_serial.html
const uint8_t NINITIALIZE = 0; //Number of times to try connecting to GUI until instead booting using default settings
const boolean NOSERIAL = false; //If the device boots into default configuration due to no serial, turn off serial

//Pin ID constants
const int RELAY_PIN[] = {0, 1, 2, 3}; //SSR relays for changing LED channel
const int INTERLINE_PIN = 4; //Switch between analog input and negative refence voltage to turn off LED
const int NC_PIN[] = {5, 6, 7, 8, 9, 38, 39}; //Not connected pins
const int ANALOG_SELECT_PIN = 10; //Switches between internal and external analog input
const int ALARM_PIN[] = {11, 32}; //Audible alarm
const int TOGGLE_PIN = 12; //Toggle switch input

const int RESISTOR_TEMP_PIN = 14; //NTC thermistor monitoring current sense resistor temp
const int MOSFET_TEMP_PIN = 15; //NTC thermistor monitoring current regulator MOSFET temp
const int EXTERNAL_TEMP_PIN = 16; //NTC thermistor monitoring external temp (such as on-board LED thermistor)
const int ISENSE_PIN = 17; //Analog input to measure current sense voltage
const int SDA0_PIN = 18; //I2C SDA pin for optional peripheral comunication
const int SCL0_PIN = 19; //I2C SCL pin for optional peripheral comunication
const int OUTPUT_PIN[] = {22, 21, 20}; //5V output pins for external triggering/PWM
const int FAN_PWM_PIN = 23; //5V PWM to control internal fan speed

const int PUSHBUTTON_PIN[] = {27, 25, 26, 30}; //Four pushbutton inputs 
const int LED_PIN[] = {29, 24, 28, 31}; //Indicator LEDs on pushbuttons

const int POT_PIN = 33; //Input voltage from potentiometer
const int INPUT_PIN[] = {37, 36, 35, 34}; //4-channel analog/digital inputs
const int DAC0_PIN = A21; //Internal dac to generate internal analog input voltage
const int DAC1_PIN = A22; //Internal dac - not connected

//Packet structure is: byte(0) STARTBYTE -> byte(1) packet identifier -> byte(2) packet total length -> byte(3) checksum (data only, excluding header) -> byte(4-n) data packet;
const float STARTPACKET = -1/0; //Set start delimiter to -infinity
const float ENDPACKET = 1/0; //Set end delimiter to +infinity
const int IDPACKET = 1; //Identifies packet as device identification packet
const int STATUSPACKET = 2; //Identifies packet as temperature recordings and panel status
const int FAULTPACKET = 10; //Identifies packet as driver entering or exiting fault state - or if received, then commanding driver to enter fault state (i.e. fault test)
const int RESETPACKET = 11; //Identifies packet commanding driver to reset
const int DISCONNECTPACKET = 12; //Identifies packet commanding driver to reset
const int AWGPACKET = 13; //Identifies packet commanding change in AWG
const int SETUPPACKET = 20; //Identifies packet as receiving setup configuration information
const int HEADER = 4; //Indentifies length of header
const int WAVEPACKET = 250+HEADER; //Identifies packet as recorded analog waveform - also is number of bytes in packet
const int DEVICE_NAME_SIZE = sizeof(DEVICE_NAME) + HEADER; //Size of ID packet
const int SETUPSIZE = SETUPPACKET+HEADER; //Expected size of recieved setup packet, see byte order below:
const int COMMANDSIZE = 1+HEADER; //Commands are just one byte in length after the header
const int INITIALTIMEOUT = int(((1000/(float) BAUDRATE)*(64*8)) + 100); //Wait the expected time needed to fill the serial buffer (64 bytes in size) plus a fixed delay of 0.1s to allow the GUI to respond

//Setup variables
uint8_t WARNTEMP[] = {98, 98, 98}; //warn temps, warn of overheating at 60oC (60oC = 98 on 8-bit ADC)
uint8_t FAULTTEMP[] = {50, 50, 50}; //fault temps. enter fault at 80oC (80oC = 66 on 8-bit ADC)
uint16_t DELAY1 = 480; //Delay from trigger to LED trigger state
uint16_t DELAY2 = 505; //Delay from delay 1 to LED standby state
uint16_t DELAY3 = 815;
uint16_t ATHRESHOLD = 5; //Threshold for analog trigger - 5=0.1 offset on MOM
boolean DELAYORDER = 0; //Order of delays before trigger (0 = LED starts off, 1 = LED starts on);
boolean DELAYUNITS = 0; //us or ms delay - confocal sync will always use us - us is also capped at 16383 (0 = us; 1 = ms)
uint8_t FANMINTEMP = 173; //LED temp at which the PWM fan runs at minimum speed, - default to room temp (25oC = 173 on 8-bit ADC)
uint8_t FANMAXTEMP = WARNTEMP[0]; //LED temp above which the PWM fan runs at maximum speed, - default to warn temp  
uint8_t TRIGGER = 1; //trigger (0=toggle, 1=analog, 2=digital - confocal uses separate digital to trigger syncing)
uint8_t ANALOGSEL = 3; //(analog select (3 = diode, 4 = raw) 
uint8_t FAULTLED = B00000100; //Alarm to alert to warning temperature (0=false, 4=true)
uint8_t FAULTVOLUME = 127; //Volume of alarm to alert to fault temperature (0 = min, 127 = max);
uint8_t STARTVOLUME = 10; //Volume of short tone upon initializing (0 = min, 127 = max);
boolean PWMFAN = 0; //Digital I/O as PWM fan controller (0=N/A, 1=on)
uint8_t FANPIN = 0; //Which digital ouput to use to drive the fan (0=N/A, 32=I/O 1, 64=I/O 2)
boolean SYNCTYPE = 1; //sync type (0=regular, 1=confocal sync (pipeline syncs through fast routines)
boolean DTRIGGERPOL = 1; //digital trigger polarity (0 = Low, 1 = High)
boolean ATRIGGERPOL = 1; //analog trigger polarity (0 = Falling, 1 = Rising)
boolean SHUTTERTRIGGERPOL = 0; //Shutter trigger polarity (0 = Low, 1 = High) - only used for confocal syncs
boolean LEDSOURCE = 1; //LED intensity signal source (0 = Ext source, 1 = AWG source)
boolean TRIGHOLD = 0; //trigger hold (0 = single shot, 1 = repeat until trigger resets), 
uint8_t AWGSOURCE = 0; //AWG source (0=rxPacket, 1=mirror the intensity knob - hold fixed during sync, 2 - live update during sync),             
uint8_t SYNCOUT = 0; //Digital I/O 2 as sync out (0=false, 64=true)

//Packet structure is: byte(0) STARTBYTE -> byte(1) packet identifier -> byte(2) packet total length -> byte(3) checksum (data only, excluding header) -> byte(4-n) data packet;
//Maximum data packet size is 252 bytes (256 bytes - 4 bytes for header)
uint8_t checkSum = 0; //byte for verifying data integrity
uint8_t txPacket[64]; //Array for storing data packets to be sent to GUI - start of packet is {0, 0}
uint8_t rxBuffer[256]; //Array for storing data stream from GUI or saving as wave measurement
uint8_t rxIndex = 0; //Index for placing next received byte in the rx circular buffer
uint8_t rxStart = 0; //Index for start of packet in rx buffer
boolean initialized = false; //Whether device has received initialization intructions from GUI
uint8_t taskIndex = 0; //Index for recording current position in background tasks 0-2 - record temperatures, 3 - record knob, 4 - sync status (on/off), 5-toggle switch, 6-build header, 7-17 - send byte[n-7]
uint8_t event = 0; //Flag for whether an event happened within the interrupt that needs to be taken care of - 1 - serial event, 2 - toggle event, 3 - failsafe event

//Other  variables
int a = 0; //Dummy int counter
uint8_t counter = 0; //Dummy 8-bit counter
boolean syncStatus = false; //Flag for tracking if actively triggering LED or in standby
uint8_t toggleSwitch = 0; //FLag for tracking position of toggle switch - B00000000 = off, B00000100 = on
volatile boolean updateStatus = false; //Flag set by interrupt to check status - volatile variable as it resides in an interrupt
uint8_t nTry = 0; //Number of sttempts made at connecting to GUI
uint8_t LEDstate0 = 0; //Variable for the state the LED is in before trigger (PORTB bitmask)
uint8_t LEDstate1 = 0; //Variable for the state the LED is in after trigger (PORTB bitmask)
uint8_t ledInt = 255; // 8 bit, need to have switch in 'Auto' position for this to work 
boolean fault = false; //Track whether in fault to prevent recursive call of fault state
uint8_t initialCount = 3; //Don't respond to initial status until ADCs have settled
/*
//PORT D: USB, Switches, Digital I/O
//0 - USB RX
//1 - USB TX
//2 - Toggle Switch
//3 - Analog Switch 1 (PWM)
//4 - Analog Switch 2
//5 - Digital I/O 1
//6 - Digital I/O 2
//7 - +5V Supply

//PORTB: Digital Pot, Alarm
//8 - CS
//9 - Digital Pot Input (PWM)
//10 - Warning LED
//11 - MOSI
//12 - Warning Buzzer
//13 - CLK

void(* resetPacket) (void) = 0;  //declare reset fuction at address 0 - calling this allows setup code to re-run

union //For converting between uint16_t and pair of uint8_t (to allow sending and receiving uint16_t data over serial)
{
   uint16_t value;
   uint8_t bValue[2];
} bytesToUint16;

// Interrupt is called once a millisecond, when no in scan sync
SIGNAL(TIMER0_COMPA_vect) 
{
  updateStatus = true; //Set status flag to true to indicate status should be checked (1 ms has passed)
}
*/
ADC *adc = new ADC(); // adc object;
const int DEBOUNCE = 100; //ms to wait for switch to stop bouncing
const int SERIESRESISTOR = 4700;
const int THERMISTORNOMINAL = 4700;
const int BCOEFFICIENT = 3560;
const float TEMPERATURENOMINAL = 25;

void setup() {
  Wire.begin();
  configurePins();
  digitalWriteFast(RELAY_PIN[3], HIGH);
  digitalWriteFast(INTERLINE_PIN, LOW);
  digitalWriteFast(ANALOG_SELECT_PIN, HIGH);
  digitalWriteFast(FAN_PWM_PIN, LOW);
  analogWrite(A21, 4095);
  Wire.setClock(3400000);
  Serial.begin(BAUDRATE);
  Serial.setTimeout(INITIALTIMEOUT);
}

//--------------------------------------------------------------SYNCS----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Loop will act as sync router based on toggle switch position
void loop() {
  boolean state[] = {false, false, false, false, false};
  int a = 0;
  float mos_temp;
  float res_temp;
  float ext_temp;
  noInterrupts();
  pinMode(SDA0_PIN, OUTPUT);
  pinMode(SCL0_PIN, OUTPUT);
  pinMode(INPUT_PIN[0], INPUT);
  /*
  while(true){
    a = adc->adc1->analogRead(INPUT_PIN[0]);
    if(state[0] && a>500){
      digitalWriteFast(OUTPUT_PIN[2], state[0]);
      state[0] = !state[0];
    }
    else if(!state[0] && a<500){
      digitalWriteFast(OUTPUT_PIN[2], state[0]);
      state[0] = !state[0];
    }
  }
  */
  /*
  while(true){
    a = digitalReadFast(INPUT_PIN[0]);
    digitalWriteFast(OUTPUT_PIN[2], a);

    a = digitalRead(INPUT_PIN[0]);
    if(state[0] && a){
      digitalWriteFast(OUTPUT_PIN[2], HIGH);
      state[0] = false;
    }
    else if(!state[0] && !a){
      digitalWriteFast(OUTPUT_PIN[2], LOW);
      state[0] = true;
    }
  }
  */
  /*
  while(true){
    ext_temp = (float) adc->adc1->analogRead(INPUT_PIN[0]);
    ext_temp = ext_temp/adc->adc0->getMaxValue();
    ext_temp = round(ext_temp*100);
    for(a=0; a<ext_temp; a++){
      Serial.print(" ");
    }
    Serial.println("X");
    delay(5);
    
    digitalWriteFast(OUTPUT_PIN[0], HIGH);
    digitalWriteFast(OUTPUT_PIN[2], HIGH);
    delayMicroseconds(1);
    digitalWriteFast(OUTPUT_PIN[0], LOW);
    digitalWriteFast(OUTPUT_PIN[2], LOW);
    delayMicroseconds(1);
    
  }
*/
  

/*
  analogWriteFrequency(INTERLINE_PIN, 117187); // Teensy 3.0 pin 3 also changes to 375 kHz
  analogWriteResolution(9);
  while(true){
    if(digitalRead(PUSHBUTTON_PIN[a])){
        delay(DEBOUNCE);
        state[a] = !state[a];
        digitalWriteFast(LED_PIN[a], state[a]);
        while(digitalRead(PUSHBUTTON_PIN[a])) delay(DEBOUNCE);
        delay(DEBOUNCE);
    }
    if(state[a]){
      digitalWriteFast(INTERLINE_PIN, HIGH);
    }
    else{
      digitalWriteFast(INTERLINE_PIN, LOW);
    }
  }    
  */
  
  /*
  float val = sin(phase) * 2000.0 + 2050.0;
  analogWrite(A21, (int)val);
  phase = phase + 0.02;
  if (phase >= twopi) phase = 0;
  while (usec < 5) ; // wait
  usec = usec - 5;
 */
/*  
  digitalWriteFast(RELAY_PIN[3], HIGH);
  digitalWriteFast(LED_BUILTIN, HIGH);
  delay(4000);
  digitalWriteFast(RELAY_PIN[3], LOW);
  digitalWriteFast(LED_BUILTIN, LOW);
  delay(4000);
*/  
  

  while(true){
    for(a=0; a<sizeof(PUSHBUTTON_PIN)/sizeof(PUSHBUTTON_PIN[0]); a++){
      if(digitalRead(PUSHBUTTON_PIN[a])){
        delay(DEBOUNCE);
        state[a] = !state[a];
        digitalWriteFast(LED_PIN[a], state[a]);
        while(digitalRead(PUSHBUTTON_PIN[a])) delay(DEBOUNCE);
        delay(DEBOUNCE);
        if(state[a]){
          analogWrite(FAN_PWM_PIN, a*1000+1000);
        }
        else{
          analogWrite(FAN_PWM_PIN, 0);
        }
      }
    }
    if(digitalRead(TOGGLE_PIN) != state[4]){
      delay(DEBOUNCE);
      state[4] = !state[4];
      digitalWriteFast(LED_BUILTIN, state[4]);
    }
  }
  
}

void configurePins(){
    int a; //Loop counter
    analogWriteResolution(12);
    ///// ADC0 ////
    // reference can be ADC_REFERENCE::REF_3V3, ADC_REFERENCE::REF_1V2 (not for Teensy LC) or ADC_REFERENCE::REF_EXT.
    adc->adc0->setReference(ADC_REFERENCE::REF_3V3); // change all 3.3 to 1.2 if you change the reference to 1V2

    adc->adc0->setAveraging(1); // set number of averages
    adc->adc0->setResolution(16); // set bits of resolution

    // it can be any of the ADC_CONVERSION_SPEED enum: VERY_LOW_SPEED, LOW_SPEED, MED_SPEED, HIGH_SPEED_16BITS, HIGH_SPEED or VERY_HIGH_SPEED
    // see the documentation for more information
    // additionally the conversion speed can also be ADACK_2_4, ADACK_4_0, ADACK_5_2 and ADACK_6_2,
    // where the numbers are the frequency of the ADC clock in MHz and are independent on the bus speed.
    adc->adc0->setConversionSpeed(ADC_CONVERSION_SPEED::VERY_HIGH_SPEED); // change the conversion speed
    // it can be any of the ADC_MED_SPEED enum: VERY_LOW_SPEED, LOW_SPEED, MED_SPEED, HIGH_SPEED or VERY_HIGH_SPEED
    adc->adc0->setSamplingSpeed(ADC_SAMPLING_SPEED::VERY_HIGH_SPEED); // change the sampling speed

    ////// ADC1 /////
    adc->adc1->setReference(ADC_REFERENCE::REF_3V3);
    adc->adc1->setAveraging(1); // set number of averages
    adc->adc1->setResolution(16); // set bits of resolution
    adc->adc1->setConversionSpeed(ADC_CONVERSION_SPEED::VERY_HIGH_SPEED); // change the conversion speed
    adc->adc1->setSamplingSpeed(ADC_SAMPLING_SPEED::VERY_HIGH_SPEED); // change the sampling speed

    ////// INPUT /////
    pinMode(TOGGLE_PIN, INPUT_PULLUP);
    for(a=0; a<sizeof(PUSHBUTTON_PIN)/sizeof(PUSHBUTTON_PIN[0]); a++) pinMode(PUSHBUTTON_PIN[a], INPUT_PULLUP);

    ////// OUTPUT /////
    for(a=0; a<sizeof(RELAY_PIN)/sizeof(RELAY_PIN[0]); a++) pinMode(RELAY_PIN[a], OUTPUT);
    pinMode(INTERLINE_PIN, OUTPUT);
    pinMode(ANALOG_SELECT_PIN, OUTPUT);
    pinMode(LED_BUILTIN, OUTPUT);
    for(a=0; a<sizeof(ALARM_PIN)/sizeof(ALARM_PIN[0]); a++) pinMode(ALARM_PIN[a], OUTPUT);
    for(a=0; a<sizeof(OUTPUT_PIN)/sizeof(OUTPUT_PIN[0]); a++) pinMode(OUTPUT_PIN[a], OUTPUT);
    pinMode(FAN_PWM_PIN, OUTPUT);
    for(a=0; a<sizeof(LED_PIN)/sizeof(LED_PIN[0]); a++) pinMode(LED_PIN[a], OUTPUT);
    
    ////// DISABLE /////
    for(a=0; a<sizeof(NC_PIN)/sizeof(NC_PIN[0]); a++) pinMode(NC_PIN[a], INPUT_DISABLE);
    for(a=0; a<sizeof(INPUT_PIN)/sizeof(INPUT_PIN[0]); a++) pinMode(INPUT_PIN[a], INPUT_DISABLE);
    pinMode(EXTERNAL_TEMP_PIN, INPUT_DISABLE);
    
    ////// I2C /////
    Wire.setSDA(SDA0_PIN);
    Wire.setSCL(SCL0_PIN);
}

float thermistorTemp(float raw){
  float steinhart;
  raw = adc->adc0->getMaxValue() / raw - 1;
  raw = SERIESRESISTOR / raw;
  steinhart = raw / THERMISTORNOMINAL;     // (R/Ro)
  steinhart = log(steinhart);                  // ln(R/Ro)
  steinhart /= BCOEFFICIENT;                   // 1/B * ln(R/Ro)
  steinhart += 1.0 / (TEMPERATURENOMINAL + 273.15); // + (1/To)
  steinhart = 1.0 / steinhart;                 // Invert
  steinhart -= 273.15;    
  return steinhart;
}
/*
//Wait for digital trigger event (usually shutter) to start mirror sync
void confocalStandby(){
  updateAWG(ledInt);//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
  PORTD = LEDstate0; //Set LED to standby state
  while((boolean) (PIND & B00100000) != SHUTTERTRIGGERPOL){
    interrupts(); //Turn on interrupts to automatically manage checking status
    if(updateStatus) checkStatus();
    if(event) return; //If event is a toogle event break loop and exit function 
  }
  noInterrupts(); //Turn off interrupts to keep precise timing during trigger syncs
  if(TRIGGER == 2) confocalDigitalSync();
  else confocalAnalogSync();
}

void confocalDigitalSync(){
  PORTD = LEDstate0; //Set LED to standby state
  while ((boolean) (PIND & B00100000) == SHUTTERTRIGGERPOL){ //While shutter is open - continue using mirror sync  
    if(DTRIGGERPOL) while(~PIND & B01000000); //Wait for sync trigger
    else while(PIND & B01000000); //Wait for sync trigger
    delayMicroseconds(DELAY1);
    PORTD = LEDstate1; //Set LED to post trigger state
    delayMicroseconds(DELAY2);
    PORTD = LEDstate0; //Set LED to standby state
    checkStatus();
    if(event) return; //If event is a toogle event break loop and exit function
  }
  confocalStandby();
}

void confocalAnalogSync(){
  PORTD = LEDstate0; //Set LED to standby state
  analogRead(ANALOGSEL);
  while ((boolean) (PIND & B00100000) == SHUTTERTRIGGERPOL){ //While shutter is open - continue using mirror sync  
    if(ATRIGGERPOL) while(analogRead(ANALOGSEL) < ATHRESHOLD); //Wait for sync trigger - 8us jitter
    else while(analogRead(ANALOGSEL) > ATHRESHOLD); //Wait for sync trigger
    delayMicroseconds(DELAY1);
    PORTD = LEDstate1; //Set LED to post trigger state
    delayMicroseconds(DELAY2);
    PORTD = LEDstate0; //Set LED to standby state
    delayMicroseconds(DELAY3);
    PORTD = LEDstate1; //Set LED to post trigger state
    delayMicroseconds(DELAY2);
    PORTD = LEDstate0; //Set LED to standby state
    checkStatus();
    if(event) return; //If event is a toogle event break loop and exit function
    analogRead(ANALOGSEL); //Refresh analog sync pin
  }
  confocalStandby(); 
}

void checkStatus(){
  if(!taskIndex && initialCount) initialCount--;
  taskIndex++; //Increment task index
  updateStatus = false; //Reset status flag
  if(SYNCTYPE) interrupts(); //Turn interrupts back on if in confocal mode - needed for serial communication
  if(taskIndex >= 0 && taskIndex <= 2){ //Record temperature - 12us
    analogRead(taskIndex)>>2;
    txPacket[HEADER + taskIndex] = analogRead(taskIndex)>>2; //Get temperature reading and convert to 8-bit
  }
  else if(taskIndex == 3){ //Get intensity knob position - 12us
    analogRead(POT);
    txPacket[HEADER + taskIndex] = analogRead(POT)>>2;
  }
  else if(taskIndex >= STATUSPACKET && taskIndex < (2*STATUSPACKET+HEADER) && !initialCount){ //6us
    Serial.write(txPacket[taskIndex - STATUSPACKET]);
  }
  else if(taskIndex == 4){ //Perform all fast tasks as one set
    txPacket[HEADER + taskIndex++] = syncStatus;
    txPacket[HEADER + taskIndex] = PIND & B00000100; //Check toggle switch
    if((txPacket[HEADER] < FAULTTEMP[0] || txPacket[HEADER+1] < FAULTTEMP[1] || txPacket[HEADER+2] < FAULTTEMP[2]) && !initialCount) event = 3; //Check whether device is overheating and enter failsafe if it is
    buildPacket(STATUSPACKET, STATUSPACKET+HEADER);
  }
  //For remainder of checks monitor toggle switch and serial alternately to prevent over-riding event flags if both happen synchronously
  else if(taskIndex%2){ //Check for received serial packet
    if (Serial.available()){
      event = 1; //Set event flag to check rx serial buffer if data is available
    }
  }
  else{ //Monitor for change in toggle switch
    if(toggleSwitch ^ (PIND & B00000100)){
      toggleSwitch = (PIND & B00000100); 
      event = 2;
    } 
  }
  if(SYNCTYPE) noInterrupts(); //Turn interrupts back off if in confocal mode - removes 5us jitter in sync timing
  if(event) eventHandler(); //If an event was found - run the event handler
}

void eventHandler(){ //Take no action on event 2 as the calling function needs to clear first to avoid infinite recursion
  if(event != 2){
    if(event==1) processReceivedPackets();
    else if(event==3 && !fault) failSafe();
    event = 0; //Reset event handler
  }
}

//--------------------------------------------------------------INITIALIZE-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void initializeDevice(){
  initialized = false;
  nTry = NINITIALIZE;
  while(Serial.available()) Serial.read(); //Flush all remaining bytes from input buffer
  while(!initialized){ //Repeat initialization until a successful initialization 
    while(Serial.read() && nTry){ //Keep sending header until 0 is received (no data = -1 which is "true") or counter reaches 0;
      for(a=HEADER; a<IDSIZE; a++) txPacket[a] = IDARRAY[a-HEADER]; //Load ID into txPacket
      buildPacket(IDPACKET, IDSIZE); //Add header
      Serial.write(txPacket, IDSIZE); //Send assembled data packet to GUI
      packetError();
      nTry--;
    }
    if(!initialized && !nTry){ //If a valid setup packet was not found after n tries, use default values
      checkSetup(); //make sure default values are valid, and boot from them
      if(initialized && NOSERIAL) Serial.end(); //If default is valid and no serial is requested in manual mode, turn off serial
      nTry = NINITIALIZE; //Reset the retry counter
    }
    else processReceivedPackets(); //If there was a successful connection, try and get the incoming setup packet or disconnect packet
  }

  //Once initialized, turn on interrupts to begin monitoring the device
  TIMSK0 |= _BV(OCIE0A);

  //Speed up serial as commands will take 160us to transmit
  Serial.setTimeout(RUNTIMEOUT);

  //Disable serial if in manual mode and NOSERIAL is true
  if(NOSERIAL) Serial.end();

  //Build LED state variables to toggle LED as specified
  if(DELAYORDER){ //If LED is to be turned off on trigger
    LEDstate1 = B11111100; //Turn off LED on trigger (NEG)
    if(LEDSOURCE) LEDstate0 = B11110100; //Set to AWG before trigger
    else LEDstate0 = B11101100; //Set to EXT before trigger
  }
  else{ //If LED is to be turned on on trigger
    LEDstate0 = B11111100; //Turn off LED before trigger (NEG)
    if(LEDSOURCE) LEDstate1 = B11110100; //Set to AWG after trigger
    else LEDstate1 = B11101100; //Set to EXT after trigger
  }

  //Set second resistor on AWG to 0 ohms
  PORTB &= B11111110;
  SPI.beginTransaction(SPISettings(20000000, MSBFIRST, SPI_MODE0));
  SPI.transfer16(256);
  SPI.endTransaction();
  PORTB |= B00000001;

  //Get state of toggle switch
  toggleSwitch = (PIND & B00000100);

}

//Parse the setup packet and then check if valid
void setupPacket(){
  //Confirm checksum
  checkSum = 0;
  for(a=rxStart+HEADER; a<rxStart + SETUPSIZE; a++){
    checkSum += rxBuffer[a];
  }
  for(a=rxIndex; a < rxIndex+SETUPSIZE; a++) Serial.write(rxBuffer[a]);
  Serial.write(checkSum);
  Serial.write(checkSum);
  Serial.write(rxBuffer[rxStart+3]);
  Serial.write(rxBuffer[rxStart+3]);
  if(rxBuffer[rxStart+3] != checkSum) return; //If checksum is not valid, exit parsing function and continue searching for valid setup packet
  
  rxStart += HEADER; //Move the index forward to start of data
  //Use a++ as index to parse packet so that the txPacket index is automatically moved to the end of the packet since otherwise the 0 bytes within the packet can be interpreted as start indeces
  WARNTEMP[0] = rxBuffer[rxStart++]; //warn temps, warn of overheating at 60oC (60oC = 98 on 8-bit ADC)
  WARNTEMP[1] = rxBuffer[rxStart++];
  WARNTEMP[2] = rxBuffer[rxStart++];
  FAULTTEMP[0] = rxBuffer[rxStart++]; //fault temps. enter fault at 80oC (80oC = 66 on 8-bit ADC)
  FAULTTEMP[1] = rxBuffer[rxStart++];
  FAULTTEMP[2] = rxBuffer[rxStart++];
  bytesToUint16.bValue[0] = rxBuffer[rxStart++]; //Assemble uint16_t value
  bytesToUint16.bValue[1] = rxBuffer[rxStart++]; //Assemble uint16_t value
  DELAY1 = bytesToUint16.value; //Delay from previous event before LED is turned on
  bytesToUint16.bValue[0] = rxBuffer[rxStart++]; //Assemble uint16_t value
  bytesToUint16.bValue[1] = rxBuffer[rxStart++]; //Assemble uint16_t value
  DELAY2 = bytesToUint16.value; //Delay from previous event before LED is turned off
  bytesToUint16.bValue[0] = rxBuffer[rxStart++]; //Assemble uint16_t value
  bytesToUint16.bValue[1] = rxBuffer[rxStart++]; //Assemble uint16_t value
  ATHRESHOLD = bytesToUint16.value; //Threshold for analog trigger
  DELAYORDER = rxBuffer[rxStart++]; //Order of delays before trigger (0 = LED starts off, 1 = LED starts on);
  DELAYUNITS = rxBuffer[rxStart++]; //us or ms delay - confocal sync will always use us - us is also capped at 16383 (0 = us; 1 = ms)
  FANMINTEMP = rxBuffer[rxStart++]; //LED temp at which the PWM fan runs at minimum speed, - default to room temp (25oC = 173 on 8-bit ADC)
  FANMAXTEMP = rxBuffer[rxStart++]; //LED temp above which the PWM fan runs at maximum speed, - default to warn temp 
  TRIGGER = rxBuffer[rxStart++]; //trigger (0=toggle, 1=analog, 2=digital, 3=digital activates analog - such as shutter open then trigger off of fast mirror)
  ANALOGSEL = rxBuffer[rxStart++]; //analog select (3 = diode, 4 = raw) 
  FAULTLED = rxBuffer[rxStart++] & B00000100; //Alarm to alert to warning temperature (0=false, 4=true) - use bitmask for safety (protects other pins from being accidentally overwritten in the event of a bad byte)
  FAULTVOLUME = rxBuffer[rxStart++]; //Alarm to alert to fault temperature
  STARTVOLUME = rxBuffer[rxStart++]; //Volume of short tone upon initializing
  PWMFAN = rxBuffer[rxStart++]; //Digital I/O as PWM fan controller (0=N/A, 1=on)   
  FANPIN = rxBuffer[rxStart++] & B01100000; //Which digital ouput to use to drive the fan (0=N/A, 32=I/O 1, 64=I/O 2)
  SYNCTYPE = rxBuffer[rxStart++]; //sync type (0=regular, 1=confocal sync (pipeline syncs through fast routines)
  DTRIGGERPOL = rxBuffer[rxStart++]; //digital trigger polarity (0 = Low, 1 = High)
  ATRIGGERPOL = rxBuffer[rxStart++]; //analog trigger polarity (0 = Falling, 1 = Rising)
  SHUTTERTRIGGERPOL = 0; //Shutter trigger polarity (0 = Low, 1 = High) - only used for confocal syncs
  LEDSOURCE = rxBuffer[rxStart++]; //LED intensity signal source (0 = Ext source, 1 = AWG source)
  TRIGHOLD = rxBuffer[rxStart++]; //trigger hold (0 = single shot, 1 = repeat until trigger resets), 
  AWGSOURCE = rxBuffer[rxStart++]; //AWG source (0=txPacket, 1=mirror the intensity knob),             
  SYNCOUT = rxBuffer[rxStart++] & B01000000; //Digital I/O 2 as sync out (0=false, 64=true) - use bitmask for safety (protects other pins from being accidentally overwritten in the event of a bad byte) *************CHECK: don't use a++ as next call to for-loop will also index a forward one?**********************************

  //Check that setup values are valid
  checkSetup();
}

//Check setup variables to make sure they are valid before configuring the device to them
void checkSetup(){
  for(a=0; a<3; a++){
    if(WARNTEMP[a] <= FAULTTEMP[a] || WARNTEMP[a] > 245 || FAULTTEMP[a] > 245 || WARNTEMP < 10 || FAULTTEMP < 10) return; //Setup is not valid if set temps are at the edge of the ADC range (roughly <-25oC or >180oC for standard thermistors)
  }

  //Check that packet values are valid
  if(FANMAXTEMP < FANMINTEMP && TRIGGER < 3 && (ANALOGSEL-3) < 2 && FAULTVOLUME < 128 && STARTVOLUME < 128 && ATHRESHOLD < 1024 && AWGSOURCE < 3){ //Check numerical values for validity
    if((!FAULTLED || FAULTLED == 4) && (!FANPIN || FANPIN == 32 || FANPIN == 64) && (!SYNCOUT || SYNCOUT == 64)){ //Check pin ID variables
      if(DELAYORDER < 2 && DELAYUNITS < 2 && PWMFAN < 2 && SYNCTYPE < 2 && DTRIGGERPOL < 2 && ATRIGGERPOL < 2 && SHUTTERTRIGGERPOL < 2 && LEDSOURCE < 2 && TRIGHOLD < 2 && SYNCOUT < 2){ //Check boolean variables - d
        if((!SYNCTYPE == DELAYUNITS) || !SYNCTYPE){ //Confirm that the delay units are in us if using a confocal sync
          if((!DELAYUNITS && (DELAY1 < 16384 && DELAY2 < 16384)) || DELAYUNITS){ //If us, make sure that value does not exceed 16383 cap - https://www.arduino.cc/reference/en/language/functions/time/delaymicroseconds/
            if(!SYNCTYPE || TRIGGER){ //Only analog or digital triggers for confocal
              for(a=rxIndex; a < rxIndex+SETUPSIZE; a++) txPacket[a-rxIndex] = rxBuffer[a];
              Serial.write(txPacket, SETUPSIZE); //Send received setup back back to computer for confirmation               
              //If setup is valid, then initialization is successful
              initialized = true;
              SPI.end(); //End SPI so that locks on warning LED and buzzer are released
              PORTB |= FAULTLED; //Turn on warning LED
              for(a=0; a<500; a++){ //Generate tone for 0.1 seconds
                PORTB |= B00010000;
                delayMicroseconds(STARTVOLUME);
                PORTB &= B11101111;
                delayMicroseconds(255-STARTVOLUME);
              }
              delay(1000); //Wait for reset from GUI in case setup packet does not match
              PORTB &= B11111011; //Turn off warning LED
              SPI.begin(); //Re-start SPI 
            } 
          }
        }                    
      }
    }
  }
}


//--------------------------------------------------------------SERIAL---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//Assemble header onto packet
//Packet structure is: byte(0) STARTBYTE -> byte(1) packet identifier -> byte(2) packet total length -> byte(3) checksum (data only, excluding header) -> byte(4-n) data packet;
void buildPacket(uint8_t identifier, uint8_t packetSize){
  checkSum = 0; //Initialize the checksum
  txPacket[0] = STARTBYTE;
  txPacket[1] = identifier; //Add identifier to data packet
  txPacket[2] = packetSize; //Add packet length to data packet
  for(a=HEADER; a<packetSize; a++) checkSum += txPacket[a]; //Calculate checksum
  txPacket[3] = checkSum; //Add checksum to data packet
}

//To minimize lag, retrieve only one byte per call, then scan for valid packet.
//byte(0) STARTBYTE -> byte(1) packet identifier -> byte(2) packet length -> byte(3) checksum -> byte(4-n) data packet;
//const uint8_t STARTBYTE = 0; //Identifies start of packet
//const uint8_t IDPACKET = 1; //Identifies packet as device identification packet
//const uint8_t STATUSPACKET = 6; //Identifies packet as temperature recordings - also is number of data bytes in packet
//const uint8_t FAULTPACKET = 10; //Identifies packet as driver entering or exiting fault state - or if received, then commanding driver to enter fault state (i.e. fault test)
//const uint8_t RESETPACKET = 11; //Identifies packet commanding driver to reset
//const uint8_t DISCONNECTPACKET = 12; //Identifies packet commanding driver to reset
//const uint8_t WAVEPACKET = 252; //Identifies packet as recorded analog waveform

void processReceivedPackets(){
  uint8_t packetLength = 0;
  if(!initialized){
    packetLength = Serial.readBytes(rxBuffer, 64); //If not initialized, retrieve the entire rx serial buffer
    if(packetLength >= HEADER+1){ //If minimum number of necessary bytes were recieved, check buffer for setup packet
      for(a=0; a<=(packetLength-HEADER-1); a++){ //Search for valid header in packet
        if(!rxBuffer[a]){ //If start byte is found, check for valid packet
          if(rxBuffer[a+1] == SETUPPACKET && rxBuffer[a+2] == SETUPSIZE && a <= (packetLength - SETUPSIZE + 1)){ //if packet has valid status packet header - parse packet
             rxStart = a; //Initialize rxStart to current index
             rxIndex = a; //Initialize rxIndex to current index (will slide rxIndex to end of packet during confrimation process)
             setupPacket();
             return; //Break loop if setup packet is found
          }
          //Otherwise, if a command of disconnect is received (i.e. GUI initialization) then wait in standby
          else if(rxBuffer[a+1] == DISCONNECTPACKET && rxBuffer[a+2] == COMMANDSIZE && rxBuffer[a+3] == DISCONNECTPACKET && rxBuffer[a+4] == DISCONNECTPACKET && a <= (packetLength - COMMANDSIZE)) driverStandby();
        }
      }
    }
  }
  else{
    packetLength = Serial.readBytes(rxBuffer, 64); //If not initialized, retrieve the entire rx serial buffer
    if(packetLength >= HEADER+1){ //If minimum number of necessary bytes were recieved, check buffer for setup packet
      for(a=0; a<=(packetLength-HEADER-1); a++){ //Search for valid header in packet
        if(!rxBuffer[a]){ //If start byte is found, check for valid packet
          //Packet structure is: byte(0) STARTBYTE -> byte(1) packet identifier -> byte(2) packet total length -> byte(3) checksum (data only, excluding header) -> byte(4-n) data packet;
          if(rxBuffer[a] == 0 && rxBuffer[a+2] == COMMANDSIZE && rxBuffer[a+3] == rxBuffer[a+HEADER]){ //If header is valid, parse the command
            if(rxBuffer[a+1] == rxBuffer[a+HEADER]){ //If command is fixed command with no value (i.e. databyte = ID) 
              if(rxBuffer[a+HEADER] == DISCONNECTPACKET) driverStandby(); //If disconnect is received, stop driver until reconnect resets driver.  This keeps driver from spamming serial buffer
              else if(rxBuffer[a+HEADER] == RESETPACKET) resetPacket(); //If reset command is received, set program line index to and reinitialize driver without hard reset
              else if(rxBuffer[a+HEADER] == FAULTPACKET) failSafe(); //If fault command is received, enter failsafe (i.e. failsafe test). 
            }
            else{
              if(rxBuffer[a+1] == AWGPACKET) updateAWG(rxBuffer[a+HEADER]); 
            }
          }          
        }
      }
    }
  }
}

void updateAWG(uint8_t awg){
  PORTB &= B11111110;
  SPI.beginTransaction(SPISettings(20000000, MSBFIRST, SPI_MODE0));
  SPI.transfer16(awg);
  SPI.endTransaction();
  PORTB |= B00000001;
}
//--------------------------------------------------------------STATES---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void driverStandby(){
  PORTD |= B00011000; //Set analog swich to negative voltage output - this will force the LED off (due to rail offset - grounding the LED would still leave LED with low current)
  PORTB |= B00100000; //Turn on LED 13 to indicate standby
  Serial.end(); //Stop serial communication so Arduino does not spam output buffer
  SPI.end(); //Stop SPI to restore access to PORTB
  TIMSK0 |= _BV(OCIE0A); //Turn interrupts on to continue monitoring driver temperature - and alarm if overtemp
  while(1){ //Hold until reset
    delay(1);
    checkStatus();
  }
}

//In the event of the driver or LED overheating, fail safe automatically turns off the LED circuit until the driver/LED both cool to a safe temperature
void failSafe(){
  uint8_t TIMSK0state = TIMSK0;
  fault = true;
  TIMSK0 &= ~_BV(OCIE0A); //Turn off interrupts - loop calls check status directly to monitor temp
  uint8_t PORTDstate = PORTD; //Record current state of ports so they can be restored after fault
  uint8_t PORTBstate = PORTB;
  
  
  //If fault temp is reached, enter failsafe mode until warn temp is reached
  PORTD |= B00011000; //Set analog swich to negative voltage output - this will force the LED off (due to rail offset - grounding the LED would still leave LED with low current)
  PORTB &= B11111101; //Turn off 5V input to digital pot
  SPI.end(); //End SPI so that locks on warning LED and buzzer are released
  
    
  while(fault){ //Stay in fault mode until all thermistors are recording below the warning temp
    PORTB |= FAULTLED; //Turn on warning LED
    //txPacket[4]=FAULTPACKET; //Send fault packet to GUI
    //buildPacket(FAULTPACKET, COMMANDSIZE);
    //Serial.write(txPacket, COMMANDSIZE); //Send assembled data packet to computer
       
    while(taskIndex){
      checkStatus(); 
      PORTB |= B00010000;
      delayMicroseconds(FAULTVOLUME);
      PORTB &= B11101111;
      delayMicroseconds(255-FAULTVOLUME);
    }
    checkStatus();
    PORTB &= B11111011; //Turn off warning LED
    while(taskIndex){
      checkStatus();
      delayMicroseconds(255);
    }
    checkStatus();
    if(txPacket[HEADER] > WARNTEMP[0] && txPacket[HEADER+1] > WARNTEMP[1] && txPacket[HEADER+2] > WARNTEMP[2]) fault = false; //If all thermistor temps are below the warn temperature, then exit the fault state
  }
  fault = false;
  SPI.begin(); //Restart SPI communication
  PORTB = PORTBstate; //Restore ports to prior configurations
  PORTD = PORTDstate;
  TIMSK0 = TIMSK0state; //Restore Timer0 interrupt settings
}

void manualMode(){
  TIMSK0 |= _BV(OCIE0A); //Turn on millis interrupt timer
  PORTB |= B00000010;
  while(!event){ //Loop until toggle switch changes
    interrupts(); //Maintain interrupts while in manual
    uint16_t anaRead = 0;
    for(a=0; a<64; a++){
      anaRead += analogRead(POT);
    }
    anaRead >>= 8; //Convert sum to byte
    if(anaRead) PORTD = B11110100;
    else PORTD = B11111100;
    updateAWG(anaRead);
    if(updateStatus) checkStatus();
    analogRead(POT); //Refresh pot
  }
}

uint8_t adjustVolume(){//--------------------------------------------------------------------------------------------------------------FINISH INSTALLING THIS SO VOLUME CAN BE ADJUSTED USING KNOB ON PANEL----------------------------------------------------
  uint8_t volume = 0;
  PORTB |= B00000100; //Turn on warning LED
  for(a=0; a<3100; a++){ //Generate tone for 0.1 seconds
    PORTB |= B00010000;
    delayMicroseconds(volume);
    PORTB &= B11101111;
    delayMicroseconds(255-volume);
  }
  volume = (analogRead(5) >> 3);
  PORTB &= B11111011; //Turn off warning LED
  delay(500); //Wait for reset from GUI in case setup packet does not match
  return volume;
}

void packetError(){
  counter = 3;
  while(counter--){
      PORTB |= B00100100; 
      delay(500);
      PORTB &= B11000000;
      delay(500);
  }
  delay(1000);
}
*/
