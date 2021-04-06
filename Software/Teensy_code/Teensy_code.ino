#include "pinSetup.h"
#include "PacketSerial.h"
#include "SDcard.h"
#include <EEPROM.h>
#include <TimeLib.h> //Set RTC time and get time strings

//////////////STRUCT//////////////STRUCT//////////////STRUCT//////////////STRUCT//////////////STRUCT//////////////STRUCT//////////////STRUCT//////////////STRUCT//////////////STRUCT//////////////STRUCT//////////////STRUCT//////////////STRUCT

#pragma pack(1) //Remove alignment padding bytes in structs - https://forum.pjrc.com/threads/50536-problem-with-union-in-Teensy-3-5
struct configurationStruct{
  uint8_t prefix;
  char driver_name[16]; //Name of LED driver: "default name"
  char led_names[4][16]; //Name of each LED channel
  boolean led_active[4]; //Whether LED channel is in use: {false, false, false, false}
  uint16_t current_limit[4]; //Current limit for each channel on DAC values: {0,0,0,0}
  uint8_t led_channel[4]; //SSR channels used for each LED: {1,2,3,4}
  float resistor_values[4]; //Values of current sense resistors
  boolean resistor_active[4]; //Whether a specific resistor is used
  uint16_t warn_temp[3]; //Warn temp for transistor, resistor, and external respectively in ADC units: {0,0,0}
  uint16_t fault_temp[3]; //Fault temp for transistor, resistor, and external respectively in ADC units: {0,0,0}
  uint16_t driver_fan[2]; //Driver fan min and max temperatures in ADC units: {65535, 65535}
  uint16_t ext_fan[2]; //External fan min and max temperatures in ADC units: {65535, 65535}
  uint8_t fan_channel; //Ext output channel used to send fan PWM signal
  int ext_therm_resistance; //External thermistor nominal resistance at 25°C
  int ext_therm_beta; //Beta value of external thermistor
  uint8_t audio_volume[2]; //Status and alarm volumes for transducer: {10, 100}
  bool pushbutton_intensity; //LED intensity - on/off
  uint8_t pushbutton_mode; //LED illumination mode when alarm is active
  uint8_t checksum; //Checksum to confirm that configuration is valid
};

const struct defaultConfigurationStruct{
  uint8_t prefix = 2;
  char driver_name[16] = "Unnamed driver ";
  char led_names[4][16] = {"LED #1         ", "LED #2         ", "LED #3         ", "LED #4         "};
  boolean led_active[4] = {false, false, false, false}; //Whether LED channel is in use: {false, false, false, false}
  uint16_t current_limit[4] = {65535,65535,65535,65535}; //Current limit for each channel on DAC values: {0,0,0,0}
  uint8_t led_channel[4] = {0,1,2,3}; //SSR channels used for each LED: {1,2,3,4}
  float resistor_values[4] = {5, 10, 1000, 1000}; //Values of current sense resistors
  boolean resistor_active[4] = {true, true, false, false}; //Whether a specific resistor is used
  uint16_t warn_temp[3] = {14604, 14604, 14604}; //Warn at 60°C
  uint16_t fault_temp[3] = {8891, 8891, 8891}; //Fault at 80°C
  uint16_t driver_fan[2] = {29565, 14604}; //Fan on at 30°C, fan max at 60°C
  uint16_t ext_fan[2] = {29565, 14604}; //Fan on at 30°C, fan max at 60°C
  uint8_t fan_channel = 0; //Ext output channel used to send fan PWM signal
  int ext_therm_resistance = 4700; //External thermistor nominal resistance at 25°C
  int ext_therm_beta = 3545; //Beta value of external thermistor
  uint8_t audio_volume[2] = {10, 100}; //Status and alarm volumes for transducer: {10, 100}
  bool pushbutton_intensity = true; //LED intensity - on/off
  uint8_t pushbutton_mode = 0; //LED illumination mode when alarm is active
  uint8_t checksum = 112;
} defaultConfig;

struct syncStruct{ //158 bytes
  uint8_t prefix;
  uint8_t mode; //Type of sync - digital, analog, confocal, etc.
  uint8_t sync_output_channel; //Channel to output sync signal
  
  uint8_t digital_channel; //The input channel for the sync signal
  uint8_t digital_mode[2]; //The digital sync mode  in the LOW and HIGH trigger states respectively
  uint8_t digital_led[2]; //The active LED channel in the LOW and HIGH trigger states respectively
  uint16_t digital_pwm[2]; //The PWM value in the LOW and HIGH trigger states respectively
  uint16_t digital_current[2]; //The DAC value in the LOW and HIGH trigger states respectively
  uint32_t digital_duration[2]; //The maximum number of milliseconds to hold LED state
  
  uint8_t analog_channel; //The input channel for the sync signal
  uint8_t analog_mode; //The analog sync mode
  uint8_t analog_led; //The active LED channel
  uint8_t analog_pwm; //ADC averages per PWM update
  uint16_t analog_current; //ADC averages per DAC update
  
  boolean shutter_polarity; //Shutter polarity when scan is active
  uint8_t confocal_channel; //The input channel for the line sync signal
  boolean confocal_sync_mode; //Whether the line sync is digital (true) or analog (false)
  boolean confocal_sync_polarity[2]; //Sync polarity for digital and analog sync inputs
  uint16_t confocal_threshold; //Threshold for analog sync trigger
  boolean confocal_scan_mode; //Whether scan is unidirectional (true) or bidrectional (false)
  uint32_t confocal_mirror_period; //Time in clock cycles for the scanning mirror to complete one cycle
  uint32_t confocal_delay[3]; //Delay in clock cycles for each sync delay
 
  uint8_t confocal_mode[2]; //The digital sync mode  in the image and flyback states respectively
  uint8_t confocal_led[2]; //The active LED channel in the image and flyback states respectively
  uint32_t confocal_pwm[2]; //The PWM value in the image and flyback states respectively
  uint16_t confocal_current[2]; //The DAC value in the image and flyback states respectively
  uint32_t confocal_duration[2]; //The maximum number of milliseconds to hold LED state
  
  uint8_t checksum; //Checksum to confirm that configuration is valid
};

const struct defaultSyncStruct{ //158 bytes
  uint8_t prefix = 4;
  uint8_t mode = 0; //Type of sync - digital, analog, confocal, etc.
  uint8_t sync_output_channel = 0; //Channel to output sync signal
  
  uint8_t digital_channel = 0; //The input channel for the sync signal
  uint8_t digital_mode[2] = {0,0}; //The digital sync mode  in the LOW and HIGH trigger states respectively
  uint8_t digital_led[2] = {0,0}; //The active LED channel in the LOW and HIGH trigger states respectively
  uint16_t digital_pwm[2] = {0,0}; //The PWM value in the LOW and HIGH trigger states respectively
  uint16_t digital_current[2] = {0,0}; //The DAC value in the LOW and HIGH trigger states respectively
  uint32_t digital_duration[2] = {0,0}; //The maximum number of milliseconds to hold LED state
  
  uint8_t analog_channel = 0; //The input channel for the sync signal
  uint8_t analog_mode = 0; //The analog sync mode
  uint8_t analog_led = 0; //The active LED channel
  uint8_t analog_pwm = 1; //ADC averages per PWM update
  uint16_t analog_current = 1; //ADC averages per DAC update

  boolean shutter_polarity = true; //Shutter polarity when scan is active
  uint8_t confocal_channel = 0; //The input channel for the line sync signal
  boolean confocal_sync_mode = false; //Whether the line sync is digital (false) or analog (true)
  boolean confocal_sync_polarity[2] = {true, true}; //Sync polarity for digital and analog sync inputs
  uint16_t confocal_threshold = 2000; //Threshold for analog sync trigger
  boolean confocal_scan_mode = true; //Whether scan is unidirectional (false) or bidrectional (true)
  uint32_t confocal_mirror_period = 180000; //Time in µs for the scanning mirror to complete one cycle
  uint32_t confocal_delay[3] = {0,36000,0}; //Delay in clock cycles for each sync delay
  
  uint8_t confocal_mode[2] = {0,0}; //The digital sync mode  in the image and flyback states respectively
  uint8_t confocal_led[2] = {0,0}; //The active LED channel in the image and flyback states respectively
  uint32_t confocal_pwm[2] = {0,0}; //The PWM value (in clock cycles) in the image and flyback states respectively
  uint16_t confocal_current[2] = {0,0}; //The DAC value in the image and flyback states respectively
  uint32_t confocal_duration[2] = {0,0}; //The maximum number of milliseconds to hold LED state

  uint8_t checksum = 18; //Checksum to confirm that configuration is valid
} defaultSync;

struct sequenceHeaderStruct{
  uint8_t prefix;
  uint8_t file_index;
  uint32_t buffer_size;
};

struct sequenceStruct{
  uint8_t led_id; //LED channel
  uint16_t led_pwm; //LED PWM (analog out units)
  uint16_t led_current; //LED current (DAC units)
  uint32_t led_duration; //LED duration (microseconds)
};

struct statusStruct{
  uint8_t led_channel; //Active LED channel
  uint16_t led_pwm; //PWM value for internal and external fan respectively
  uint16_t led_current; //DAC value for active LED
  uint8_t mode; //0=Sync, 1=PWM, 2=Current, 3=Off
  boolean state; //0=Standby (confocal), LOW (digital), etc. 1 = Scanning (confocal), HIGH (digital), etc.
  boolean driver_control; //True = driver controls itself, False = GUI controls driver
  uint16_t temp[3]; //ADC temp reading of mosfet, resistor, and external respectively
  uint16_t fan_speed[2]; //PWM value for internal and external fan respectively
};

struct defaultStatusStruct{
  uint8_t led_channel=0; //Active LED channel
  uint16_t led_pwm=0; //PWM value for internal and external fan respectively
  uint16_t led_current=0; //DAC value for active LED
  uint8_t mode=0; //0=Sync, 1=PWM, 2=Current, 3=Off
  boolean state=0; //0=Standby (confocal), LOW (digital), etc. 1 = Scanning (confocal), HIGH (digital), etc.
  boolean driver_control=0; //True = driver controls itself, False = GUI controls driver
  uint16_t temp[3] = {0,0,0}; //ADC temp reading of mosfet, resistor, and external respectively
  uint16_t fan_speed[2] = {0,0}; //PWM value for internal and external fan respectively
} defaultStatus;

const struct prefixStruct{
  uint8_t message = 0; //Send error, warning, and notification messages to be diplayed as pop-up in GUI
  uint8_t connection = 1; //Recv magic number at connection start and confirm with magic reply
  uint8_t send_config = 2; //Send active configuration byte file
  uint8_t recv_config = 3; //Recv and apply new configuration byte file
  uint8_t send_sync = 4; //Send active configuration byte file
  uint8_t recv_sync = 5; //Recv and apply new configuration byte file
  uint8_t send_seq = 6; //Send specified seq byte file from SD card if available
  uint8_t recv_seq = 7; //Recv specified seq byte file and save on SD card if available
  uint8_t send_id = 8; //Send the driver ID only
  uint8_t recv_time = 9; //Receive the unix time of the GUI to sync driver RTC
  uint8_t recv_stream = 10; //Signal the driver is ready to receive stream that is queued
  uint8_t send_stream = 11; //If recv - signals that ready for next packet
  uint8_t status_update = 12; //Status update packet for driver or GUI
  uint8_t calibration = 13; //Send a plot of LED square wave test output for calibrating op-amp compensation trimpots
  uint8_t gui_disconnect = 14; //GUI is disconnecting form LED driver
  uint8_t measure_period = 15; //Measure the mirror period 
  uint8_t long_off = 148; //Prefix sent when computer has been off for a while
} prefix;

//////////////UNION//////////////UNION//////////////UNION//////////////UNION//////////////UNION//////////////UNION//////////////UNION//////////////UNION//////////////UNION//////////////UNION//////////////UNION//////////////UNION//////////////UNION

//Convert between byte list and float
union FLOATUNION
{
 float float_var;
 uint8_t bytes[4];
}floatUnion;

//Convert between byte list and int
union INTUNION
{
 int int_var;
 uint8_t bytes[4];
}intUnion;

//Convert between byte list and int
union BYTE16UNION
{
 uint16_t bytes_var;
 uint8_t bytes[2];
}uint16Union;

union BYTE32UNION
{
 uint32_t bytes_var;
 uint8_t bytes[4];
}uint32Union;

//From: https://forum.arduino.cc/index.php?topic=263107.0
union CONFIGUNION //Convert binary buffer <-> config setup
{
   configurationStruct c;
   byte byte_buffer[sizeof(defaultConfigurationStruct)];
} conf;

union SYNCUNION //Convert binary buffer <-> sync setup
{
   syncStruct s;
   byte byte_buffer[sizeof(defaultSyncStruct)];
} sync;

union SEQUNION //Convert binary buffer <-> sync setup
{
   sequenceHeaderStruct s;
   byte byte_buffer[sizeof(sequenceHeaderStruct)];
} seq_header;

union STATUSUNION //Convert binary buffer <-> sync setup
{
   statusStruct s;
   byte byte_buffer[sizeof(defaultStatusStruct)];
} current_status;

//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF//////////////TYPEDEF

//https://forum.arduino.cc/index.php?topic=171069.0
typedef void (* GenericFP)(const uint8_t*, size_t); //function pointer prototype to a function which takes an 'int' an returns 'void'
GenericFP function_router[256]; //create an array of 'GenericFP' function pointers. Notice the '&' operator

//////////////VARIABLE//////////////VARIABLE//////////////VARIABLE//////////////VARIABLE//////////////VARIABLE//////////////VARIABLE//////////////VARIABLE//////////////VARIABLE//////////////VARIABLE//////////////VARIABLE//////////////VARIABLE

const static uint32_t COBS_BUFFER_SIZE = 4096; //Size of the COBS buffer
char MAGIC_SEND[] = "-kvlWfsBplgasrsh3un5K"; //Magic number reply from Teensy verifying it is an LED driver "-" is for providing byte prefix in serial message
const static char MAGIC_RECEIVE[] = "kc1oISEIZ60AYJqH4J1P"; //Magic number received from GUI to verify this is an LED driver
char temp_buffer[COBS_BUFFER_SIZE]; //Temporary buffer for preparing packets immediately before transmission
int temp_size; //Size of temporary packet to transmit
byte sequence_buffer[2][10000*sizeof(sequenceStruct)+10]; //Add buffer padding for prefix info on transmission
uint32_t send_stream_index = 0; //Current index position of stream that is being sent
uint32_t send_stream_size = 0; //Total size of file to be streamed
const static uint16_t DEFUALT_TIMEOUT = 500; //Default timeout for serial communication in ms
uint8_t status_index = 0; //Index counter for incrementally updating and transmitting status
uint32_t status_duration = 180000; //Time (in number of clock cycles) available to check status per interrupt
elapsedMillis heartbeat; //Heartbeat timer to confirm that GUI is still connected
const static uint32_t HEARTBEAT_TIMEOUT = 10000; //Driver will assume connection has closed if heartbeat not received within this time
uint32_t cpu_cycles = 0; //Track the number of CPU cycles for sub-microseconds timing precision
const static uint32_t cycle_offset = 7; //Number of cycles needed to check cycles ellapsed
volatile uint8_t external_fan_pin = 0;
//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS//////////////CLASS
pinSetup pin;
SDcard sd;
PacketSerial_<COBS, 0, COBS_BUFFER_SIZE> usb; //Sets Encoder, framing character, buffer size

void setup() {
//  EEPROM.update(0,0);
  for(size_t a=0; a<sizeof(current_status.byte_buffer); a++) *(current_status.byte_buffer+a)=0; //Initialize status buffer to a known state of all 0
  
  //Count cpu cycles for submircrosecond delay precision - https://forum.pjrc.com/threads/28407-Teensyduino-access-to-counting-cpu-cycles?p=71036&viewfull=1#post71036
  ARM_DEMCR |= ARM_DEMCR_TRCENA;
  ARM_DWT_CTRL |= ARM_DWT_CTRL_CYCCNTENA;
  cpu_cycles = ARM_DWT_CYCCNT;
  sequence_buffer[0][0]= 0;
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600); //Needed for non-COBS streaming, such as large sequence files
  usb.begin(115200);
  usb.setPacketHandler(&onPacketReceived);
  initializeConfigurations();
  if(!sd.initializeSD()){
    digitalWriteFast(LED_BUILTIN, HIGH);
    sd.message_buffer[0] = prefix.message;
    usb.send((const unsigned char*) sd.message_buffer, sd.message_size);
  }
  digitalWriteFast(pin.RELAY[3], HIGH);
  digitalWriteFast(pin.INTERLINE, LOW);
  digitalWriteFast(pin.ANALOG_SELECT, LOW);
  digitalWriteFast(pin.FAN_PWM, LOW);
  analogWrite(A21, 0);
}
elapsedMillis t = 0;
uint32_t d = 10;

void loop() {
  interrupts();
//  noInterrupts();
//  cpu_cycles = ARM_DWT_CYCCNT;
//  digitalWriteFast(pin.SDA0, HIGH);
//  while(ARM_DWT_CYCCNT-cpu_cycles < d-cycle_offset);
//  digitalWriteFast(pin.SDA0, LOW);
//  interrupts();
//  if (t > 100){
//    t=0;
//    d++;
//    if(d >= 30) d = 24;
//  }

//  digitalWriteFast(pin.SDA0, HIGH); 
//  usb.update();
//  digitalWriteFast(pin.SDA0, LOW);
//  if(heartbeat < HEARTBEAT_TIMEOUT){
//    if(current_status.s.driver_control){
//      current_status.s.led_channel = 0;
//      analogRead(pin.POT);
//      current_status.s.led_pwm = 65535-analogRead(pin.POT);
//      current_status.s.led_current = 65535-analogRead(pin.POT);
//      current_status.s.mode = digitalReadFast(pin.TOGGLE);
//    }
//    analogRead(pin.MOSFET_TEMP);
//    current_status.s.temp[0] = analogRead(pin.MOSFET_TEMP);
//    analogRead(pin.RESISTOR_TEMP);
//    current_status.s.temp[1] = analogRead(pin.RESISTOR_TEMP);
//    analogRead(pin.EXTERNAL_TEMP);
//    current_status.s.temp[2] = analogRead(pin.EXTERNAL_TEMP);
//    current_status.s.fan_speed[0] = 0;
//    current_status.s.fan_speed[1] = 0;
//    
//    temp_buffer[0] = prefix.status_update;
//    memcpy(temp_buffer+1, current_status.byte_buffer, sizeof(current_status.byte_buffer));
//    usb.send((const unsigned char*) temp_buffer, sizeof(current_status.byte_buffer)+1);
    checkStatus(); 
    digitalWriteFast(LED_BUILTIN, HIGH);
    delay(20);
    digitalWriteFast(LED_BUILTIN, LOW);
    delay(20);
//  }
}

void checkStatus(){
  cpu_cycles = ARM_DWT_CYCCNT; //Start timer - this is important for timing out status check during confocal syncs
  interrupts(); //Activate interrupts to allow serial to be monitored and sent
  switch(status_index){
    case 0: //Check driver temperatures
      status_index++;
      analogRead(pin.MOSFET_TEMP);
      current_status.s.temp[0] = analogRead(pin.MOSFET_TEMP);
      if(cpu_cycles - ARM_DWT_CYCCNT > status_duration) break; //Stop status check fall-through if there is insufficient time for another status check
    case 1:
      status_index++;
      analogRead(pin.RESISTOR_TEMP);
      current_status.s.temp[1] = analogRead(pin.RESISTOR_TEMP);
      if(cpu_cycles - ARM_DWT_CYCCNT > status_duration) break; //Stop status check fall-through if there is insufficient time for another status check
    case 2:
      status_index++;
      analogRead(pin.EXTERNAL_TEMP);
      analogRead(pin.POT);
      current_status.s.temp[2] = analogRead(pin.POT);
      if(cpu_cycles - ARM_DWT_CYCCNT > status_duration) break; //Stop status check fall-through if there is insufficient time for another status check
    case 3: //Check if any of the temperatures is past the fault temperature
      status_index++;
      thermalFault();
      if(cpu_cycles - ARM_DWT_CYCCNT > status_duration) break; //Stop status check fall-through if there is insufficient time for another status check
    case 4: //Update internal fan speed
      status_index++;
      if(current_status.s.temp[0] < current_status.s.temp[1]) setFan(current_status.s.temp[0], 0); //Update fan based on highest internal temperature (lowest ADC value)
      else setFan(current_status.s.temp[1], 0);
      if(cpu_cycles - ARM_DWT_CYCCNT > status_duration) break; //Stop status check fall-through if there is insufficient time for another status check
    case 5: //Update external fan speed
        status_index++;
        setFan(current_status.s.temp[2], 1); //Update fan based on highest internal temperature (lowest ADC value
        if(cpu_cycles - ARM_DWT_CYCCNT > status_duration) break; //Stop status check fall-through if there is insufficient time for another status check
    case 6: //Send current status to led driver
      status_index++;
      temp_buffer[0] = prefix.status_update;
      memcpy(temp_buffer+1, current_status.byte_buffer, sizeof(current_status.byte_buffer));
      usb.send((const unsigned char*) temp_buffer, sizeof(current_status.byte_buffer)+1);
      if(cpu_cycles - ARM_DWT_CYCCNT > status_duration) break; //Stop status check fall-through if there is insufficient time for another status check
    default:
      usb.update();
      status_index = 0; //Reset status index if no cases match
      break;
  }
  //if(sync.s.mode==2) noInterrupts(); //Disable interrupts if in confocal mode, as the scan mirror is used as the interrupt clock
}

void setFan(uint16_t temp, uint8_t fan_index){
  uint8_t out_pin;
  float temp_min;
  uint16_t temp_max;
  float delta_temp;
  if(fan_index){
    if(conf.c.fan_channel){
      out_pin = pin.OUTPUTS[conf.c.fan_channel-1];
      temp_min = conf.c.ext_fan[0];
      temp_max = conf.c.ext_fan[1];
      delta_temp =  conf.c.ext_fan[0] - conf.c.ext_fan[1];
    }
    else return;
  }
  else{
    out_pin = pin.FAN_PWM;
    temp_min = conf.c.driver_fan[0];
    temp_max = conf.c.driver_fan[1];
    delta_temp =  conf.c.driver_fan[0] - conf.c.driver_fan[1];
  }
  
  if(temp >= temp_min){
    pinMode(out_pin, OUTPUT);
    digitalWriteFast(out_pin, LOW); //If temp is below min fan temp, turn fan off
    current_status.s.fan_speed[fan_index] = 0;
  }
  else if(temp <= temp_max){
    pinMode(out_pin, OUTPUT);
    digitalWriteFast(out_pin, HIGH); //If temp is above max fan temp, run fan at full speed
    current_status.s.fan_speed[fan_index] = 65535;
  }
  else{
    current_status.s.fan_speed[fan_index] =  round(((temp_min - (float) temp)/delta_temp)*65535.0);
    analogWrite(out_pin, current_status.s.fan_speed[fan_index]);
  }
}

void thermalFault(){
  for(int a=0; a<3; a++){
    if(current_status.s.temp[a] <= conf.c.fault_temp[a]){
      //Turn off LED circuit completely
      digitalWriteFast(pin.INTERLINE, LOW); //Apply negative voltage input to op-amp
      digitalWriteFast(pin.ANALOG_SELECT, LOW); //Disconnect external analog input
      for(size_t b=0; b<sizeof(pin.RELAY)/sizeof(pin.RELAY[0]); b++) digitalWriteFast(pin.RELAY[b], LOW); //Open all relays
      
    }
     
  }
}

//////////////EEPROM//////////////EEPROM//////////////EEPROM//////////////EEPROM//////////////EEPROM//////////////EEPROM//////////////EEPROM//////////////EEPROM//////////////EEPROM//////////////EEPROM//////////////EEPROM//////////////EEPROM

//Check EEPROM to see if it has a saved configuration
void initializeConfigurations(){
  int a;
  uint8_t check_sum;
  uint16_t buffer_size = sizeof(MAGIC_RECEIVE);
  uint16_t EEPROM_address;

  //Set pin configurations
  pin.configurePins();
  
  //See if EEPROM has magic number
  for(a=0; a<buffer_size; a++){
    if(EEPROM.read(a) != MAGIC_RECEIVE[a]){
      break;
    }
  }
  //Verify EEPROM checksums
  if(a==buffer_size){
    auto verifyChecksum = [&] (){
      check_sum = 0;
      while(buffer_size--){
        check_sum += EEPROM.read(EEPROM_address--);
      }
    };   
    //Verify EEPROM check sums
    EEPROM_address = sizeof(MAGIC_RECEIVE) + sizeof(conf.byte_buffer) + sizeof(sync.byte_buffer) - 1;
    buffer_size = sizeof(sync.byte_buffer);
    verifyChecksum();
    if(!check_sum){
      buffer_size = sizeof(conf.byte_buffer);
      verifyChecksum();
      if(!check_sum){
        loadEEPROMtoStructs();
      }
      else loadDefaultsToEEPROM();
    }
    else loadDefaultsToEEPROM();
  }
  else loadDefaultsToEEPROM();
}

//https://forum.arduino.cc/index.php?topic=42850.0
void loadDefaultsToEEPROM(){
  uint8_t *buffer_ptr;
  uint16_t buffer_size;
  uint16_t EEPROM_address = 0;
  char message[] = "-A valid driver configuration was not found on EEPROM, so default settings will be loaded.";
  message[0] = prefix.message;
  usb.send((const unsigned char*) message, sizeof(message));
  
  //Lambda functions in C++11 rock! https://stackoverflow.com/questions/4324763/can-we-have-functions-inside-functions-in-c
  auto loadEEPROM = [&] (){
    while(buffer_size--){
      EEPROM.update(EEPROM_address++, *buffer_ptr++);
    }
  };
  buffer_ptr = (uint8_t *)&MAGIC_RECEIVE;
  buffer_size = sizeof(MAGIC_RECEIVE);
  loadEEPROM();
  buffer_ptr = (uint8_t *)&defaultConfig;
  buffer_size = sizeof(conf.byte_buffer);
  loadEEPROM();
  buffer_ptr = (uint8_t *)&defaultSync;
  buffer_size = sizeof(sync.byte_buffer);
  loadEEPROM();
  loadEEPROMtoStructs();
}

void loadEEPROMtoStructs(){
    uint16_t EEPROM_address = sizeof(MAGIC_RECEIVE) + sizeof(conf.byte_buffer) + sizeof(sync.byte_buffer) - 1;
    uint16_t buffer_size = sizeof(sync.byte_buffer);
    
    EEPROM_address = sizeof(MAGIC_RECEIVE) + sizeof(conf.byte_buffer) + sizeof(sync.byte_buffer);
    buffer_size = sizeof(sync.byte_buffer);
    while(buffer_size) sync.byte_buffer[--buffer_size] = EEPROM.read(--EEPROM_address);
    buffer_size = sizeof(conf.byte_buffer);
    while(buffer_size) conf.byte_buffer[--buffer_size] = EEPROM.read(--EEPROM_address);
}

//////////////SERIAL//////////////SERIAL//////////////SERIAL//////////////SERIAL//////////////SERIAL//////////////SERIAL//////////////SERIAL//////////////SERIAL//////////////SERIAL//////////////SERIAL//////////////SERIAL//////////////SERIAL

static void onPacketReceived(const uint8_t* buffer, size_t size){
  // Route decoded packet based on prefix byte
  heartbeat = 0; //Reset heartbeat timer as a serial packet has been received
  uint8_t buffer_prefix = buffer[0];
  if(buffer_prefix == prefix.message); 
  else if(buffer_prefix == prefix.connection) magicExchange(buffer, size);
  else if(buffer_prefix == prefix.send_config) usb.send((const unsigned char*) conf.byte_buffer, sizeof(conf.byte_buffer));
  else if(buffer_prefix == prefix.recv_config) recvConfig(buffer, size);
  else if(buffer_prefix == prefix.send_sync) usb.send((const unsigned char*) sync.byte_buffer, sizeof(sync.byte_buffer));
  else if(buffer_prefix == prefix.recv_sync) recvSync(buffer, size);
  else if(buffer_prefix == prefix.send_seq) sendSeq(buffer, size);
  else if(buffer_prefix == prefix.recv_seq) recvSeq(buffer, size, true); //If serial notification of upload, it will be a single file
  else if(buffer_prefix == prefix.send_id) sendDriverId();
  else if(buffer_prefix == prefix.recv_time) syncRtcTime(buffer, size);
  else if(buffer_prefix == prefix.recv_stream);
  else if(buffer_prefix == prefix.send_stream);
  else if(buffer_prefix == prefix.status_update) updateStatus(buffer, size);
  else if(buffer_prefix == prefix.calibration) driverCalibration(buffer, size);
  else if(buffer_prefix == prefix.gui_disconnect) heartbeat = HEARTBEAT_TIMEOUT+1; //Force driver timeout on disconnect
  else if(buffer_prefix == prefix.long_off);
  else{
    temp_size = sprintf(temp_buffer, "-Error: USB packet had invalid prefix: %d", buffer_prefix);  
    temp_buffer[0] = prefix.message;
    usb.send((const unsigned char*) temp_buffer, temp_size);
  }
}

static void magicExchange(const uint8_t* buffer, size_t size){
  uint32_t a;
  if(size == sizeof(MAGIC_RECEIVE)){
    for(a=0; a<size; a++){
      if(buffer[a+1] != MAGIC_RECEIVE[a]){
        break;
      }
    }
    if(a==size-1){
      MAGIC_SEND[0] = prefix.connection;
      usb.send((const unsigned char*) MAGIC_SEND, size);
    }
  }
}

static void sendDriverId(){
  char driver_id[sizeof(conf.c.driver_name)+1];
  for(uint32_t a=0; a<sizeof(conf.c.driver_name); a++){
    driver_id[a+1] = conf.c.driver_name[a];
  }
  driver_id[0] = prefix.send_id;
  usb.send((const unsigned char*) driver_id, sizeof(driver_id));
}

static void recvConfig(const uint8_t* buffer, size_t size){
  uint8_t checksum = 0;
  temp_size = 0;
  if(size == sizeof(conf.byte_buffer)){
    for(int a = 0; a<(int) size; a++) checksum += buffer[a];
    if(!checksum){
      memcpy(conf.byte_buffer, buffer, size);
      conf.byte_buffer[0] = prefix.send_config; //Switch prefix to sending prefix
      conf.byte_buffer[size-1] += (prefix.recv_config - prefix.send_config); //Fix corresponding checksum
      for(int a = 0; a<(int) size; a++) EEPROM.update(a + sizeof(MAGIC_RECEIVE), conf.byte_buffer[a]); //Copy configuration to EEPROM
      temp_size = sprintf(temp_buffer, "-Configuration file was successfully uploaded.");
      initializeConfigurations(); //Re-run the setup routine to update driver state 
    }
    else temp_size = sprintf(temp_buffer, "-Error: Check sum is non-zero: %d", checksum); 
  }
  else temp_size = sprintf(temp_buffer, "-Error: Config packet is wrong size. Expected %d, got %d.", sizeof(conf.byte_buffer), size);
    
  if(temp_size){
    temp_buffer[0] = prefix.message;
    usb.send((const unsigned char*) temp_buffer, temp_size);
  }
}

static void recvSync(const uint8_t* buffer, size_t size){
  uint8_t checksum = 0;
  temp_size = 0;
  uint16_t expected_size = sizeof(sync.byte_buffer);// - sizeof(sync.s.digital_sequence) - sizeof(sync.s.confocal_sequence);
  if(size == expected_size){
    for(int a = 0; a<(int) size; a++) checksum += buffer[a];
    if(!checksum){
      memcpy(sync.byte_buffer, buffer, size);
      sync.byte_buffer[0] = prefix.send_sync; //Switch prefix to sending prefix
      sync.byte_buffer[size-1] += (prefix.recv_sync - prefix.send_sync); //Fix corresponding checksum
      for(int a = 0; a<(int) size; a++) EEPROM.update(a + sizeof(MAGIC_RECEIVE) + sizeof(conf.byte_buffer), sync.byte_buffer[a]); //Copy sync to EEPROM
      if(recvSeq(buffer, size, false)){
        temp_size = sprintf(temp_buffer, "-Sync and sequence files were successfully uploaded.");
        initializeConfigurations(); //Re-run the setup routine to update driver state
      }
      else{
        temp_size = sprintf(temp_buffer, "-Only sync file was successfully uploaded.");
        initializeConfigurations(); //Re-run the setup routine to update driver state
      }
    }
    else temp_size = sprintf(temp_buffer, "-Error: Check sum is non-zero: %d", checksum); 
  }
  else temp_size = sprintf(temp_buffer, "-Error: Sync packet is wrong size. Expected %d, got %d.", sizeof(sync.byte_buffer), size);  
  if(temp_size){
    temp_buffer[0] = prefix.message;
    usb.send((const unsigned char*) temp_buffer, temp_size);
  }
}

static void syncRtcTime(const uint8_t* buffer, size_t size) {
  const unsigned long DEFAULT_TIME = 1609459200; // Jan 1 2021
  memcpy(uint32Union.bytes, buffer+1, size);
  if(uint32Union.bytes_var >= DEFAULT_TIME) { // check the integer is a valid time (greater than Jan 1 2013)
    setTime(uint32Union.bytes_var); // Sync Arduino clock to the time received on the serial port
  }
  else{
    temp_size = sprintf(temp_buffer, "-Warning: Epoch time %lu sync is invalid. Defaulting to January, 1 2021.", uint32Union.bytes_var);  
    temp_buffer[0] = prefix.message;
    usb.send((const unsigned char*) temp_buffer, temp_size);
  }
}

static void sendSeq(const uint8_t* buffer, size_t size){
  uint8_t file_id; //Index of sequence file requested

  if(size == 2){ //Load file to stream buffer if command requesting file is sent from GUI
    if(buffer[1] <= 0 && buffer[1] >= sd.N_SEQ_FILES){
      temp_size = sprintf(temp_buffer, "-Error: Stream #%d is not a valid file identifier byte.", buffer[1]);  
      goto sendMessage;
    }
    else{
      file_id = buffer[1];
      if(!sd.readFromSD((char*) sequence_buffer[0]+2, 0, 0, sd.seq_files[buffer[1]])){ //Offset 
        temp_size = sprintf(temp_buffer, "%s", sd.message_buffer);  
        goto sendMessage;
      }
      else{   
        //Initialize sequence file stream to GUI with callback prefix byte - tells GUI where to route the packet to once stream is complete
        temp_buffer[0] = prefix.send_seq;
        uint32Union.bytes_var = sd.file_size+2; //+2 byte for the callback routing byte and file ID prefix byte at the start of the packet
        memcpy(temp_buffer+1, uint32Union.bytes, sizeof(uint32Union.bytes));
        usb.send((const unsigned char*) temp_buffer, sizeof(prefix.send_seq) + sizeof(uint32Union.bytes));
      }
    }
    Serial.setTimeout(DEFUALT_TIMEOUT); //Set timeout for waiting for packet blocks
    temp_size = Serial.readBytes(temp_buffer, 3); //Wait for reply from GUI indicating ready for stream to be sent
    if(temp_size < 3){
      temp_size = sprintf(temp_buffer, "-Error: Driver timed out waiting for GUI to reply ready for stream, %d bytes received of 3.", temp_size);  
      goto sendMessage;
    }
    else if(temp_buffer[0] == 2 && temp_buffer[1] == prefix.send_seq && temp_buffer[2] == 0){ //If valid "ready for stream" requenst is received then send data stream
      sequence_buffer[0][0] = prefix.send_seq; //Send sequence prefix for callback routing of streamed packet
      sequence_buffer[0][1] = file_id; //Send ID of sequence file being streamed
      Serial.write(sequence_buffer[0], uint32Union.bytes_var); //Stream sequence file 
    }
    else{
      temp_size = sprintf(temp_buffer, "-Error: Invalid \"ready for stream\" packet received from GUI. Expected [2, %d, 0] and got [%d, %d, %d].", prefix.send_stream, temp_buffer[0], temp_buffer[1], temp_buffer[2]);  
      goto sendMessage;
    }
  }
  else{
    temp_size = sprintf(temp_buffer, "-Error: Expected sendSeq request of 2 bytes and got %d bytes", size);  
    goto sendMessage;
  }
  return;
  sendMessage:
    temp_buffer[0] = prefix.message;
    usb.send((const unsigned char*) temp_buffer, temp_size);
    return;
}

static bool recvSeq(const uint8_t* buffer, size_t size, bool single_file){
  uint32_t recv_packet_size = 0;
  Serial.setTimeout(DEFUALT_TIMEOUT); //Set timeout for waiting for packet blocks
  if(single_file){
    if(size == 2){ //Overrwite index counter "a" with requested file index if there is one
      if(buffer[1] <= 0 && buffer[1] >= sd.N_SEQ_FILES){
        temp_size = sprintf(temp_buffer, "-Error: Stream #%d is not a valid file identifier byte.", buffer[1]);  
        goto sendMessage;
      }
    }
    else{
      temp_size = sprintf(temp_buffer, "-Error: Invalid request size for single stream packet: %d bytes, instead of %d.", size, sizeof(seq_header.byte_buffer));  
      goto sendMessage;
    }
  }
  while(Serial.available()) Serial.read(); //Clear serial buffer
  for(int a = 0; a<sd.N_SEQ_FILES; a++){
    if(single_file) a=buffer[1]; //If a file was specified only recv that file
    temp_buffer[0] = prefix.recv_seq;
    temp_buffer[1] = a;
    usb.send((const unsigned char*) temp_buffer, 2); //send request for sequence file
    Serial.setTimeout(DEFUALT_TIMEOUT);
    recv_packet_size = Serial.readBytes((char*) seq_header.byte_buffer, sizeof(seq_header.byte_buffer));
    if(recv_packet_size < sizeof(seq_header.byte_buffer)){ //Timed out while waiting for header packet
      temp_size = sprintf(temp_buffer, "-Error: Timed out while waiting for sequence file stream #%d header packet. Only %lu bytes received of %d", a+1, recv_packet_size, sizeof(seq_header.byte_buffer));  
      goto sendMessage;
    }
    if(seq_header.s.prefix == prefix.recv_seq){ //Verify routing prefix
      if(seq_header.s.file_index == a){ //Correct sequence file is streaming   
        if(seq_header.s.buffer_size % sizeof(sequenceStruct)){ //Invalid stream length (not an integer multiple of 9 bytes)
          temp_size = sprintf(temp_buffer, "-Error: Invalid stream length, %lu is not an integer multiple of %d.", seq_header.s.buffer_size, sizeof(sequenceStruct));  
          goto sendMessage;
        }
        else if(seq_header.s.buffer_size > sizeof(sequence_buffer[0])){ //Invalid stream length - stream is longer than buffer
          temp_size = sprintf(temp_buffer, "-Error: Invalid stream length, %lu is larger than than the buffer size: %d.", seq_header.s.buffer_size, sizeof(sequence_buffer[0]));  
          goto sendMessage;
        }
        recv_packet_size = 0;
        if(seq_header.s.buffer_size > 0){ //Only request stream if there is a stream to recv
          Serial.setTimeout(int(seq_header.s.buffer_size >> 3)+DEFUALT_TIMEOUT);
          temp_buffer[0] = prefix.recv_stream;
          temp_buffer[1] = a;
          usb.send((const unsigned char*) temp_buffer, 2); //send request for sequence file 
          recv_packet_size = Serial.readBytes((char*) sequence_buffer[0], seq_header.s.buffer_size);
        }
        
        if(recv_packet_size == seq_header.s.buffer_size){ //If full packet was received, send it to the SD card
          if(!sd.saveToSD((char*) sequence_buffer[0], 0, seq_header.s.buffer_size, sd.seq_files[a])){
            temp_size = sprintf(temp_buffer, "%s", sd.message_buffer);  
            goto sendMessage;
          }
          if(single_file) return true; //If a specific file was requested then exit the loop on completion
        }
        else{ //Packet stream timed out
          temp_size = sprintf(temp_buffer, "-Error: Invalid for sequence file size for stream #%d.  Expected %lu bytes, received %lu", a+1, seq_header.s.buffer_size, recv_packet_size);  
          goto sendMessage;
        }
      }
      else{ //Wrong sequence file is being streamed
        temp_size = sprintf(temp_buffer, "-Error: Received sequence file #%d, while waiting for file #%d.", seq_header.s.file_index+1, a+1);  
        goto sendMessage;
      }
    }
    else{ //Invalid prefix
      temp_size = sprintf(temp_buffer, "-Error: \"%d\" is not a valid sequence packet prefix, looking for \"%d\".", seq_header.s.prefix, prefix.recv_seq);
      goto sendMessage;  
    }
  }
  return true;
  sendMessage:
    temp_buffer[0] = prefix.message;
    usb.send((const unsigned char*) temp_buffer, temp_size);
    return false;
}

static void updateStatus(const uint8_t* buffer, size_t size){
  STATUSUNION recv_status;
  if(size == sizeof(recv_status.byte_buffer)+1){
    memcpy(recv_status.byte_buffer, buffer+1, size-1);
//    temp_size = sprintf(temp_buffer, "-%d %d %d %d %d %d %d %d %d %d %d", recv_status.s.led_channel, recv_status.s.led_pwm, recv_status.s.led_current, recv_status.s.mode, 
//    recv_status.s.state, recv_status.s.driver_control, recv_status.s.temp[0], recv_status.s.temp[1], recv_status.s.temp[2], recv_status.s.fan_speed[0], recv_status.s.fan_speed[1]);
//    goto sendMessage;
    current_status.s.led_channel = recv_status.s.led_channel;
    current_status.s.driver_control = recv_status.s.driver_control;
    if(!current_status.s.driver_control){
      current_status.s.mode = recv_status.s.mode;
      current_status.s.led_pwm = recv_status.s.led_pwm;
      current_status.s.led_current = recv_status.s.led_current;
    }
  }
  return;
//  sendMessage:
//    temp_buffer[0] = prefix.message;
//    usb.send((const unsigned char*) temp_buffer, temp_size);
//    return;
}

static void driverCalibration(const uint8_t* buffer, size_t size){
  BYTE16UNION calibration_current;
  memcpy(calibration_current.bytes, buffer + 1, 2);
  temp_size = pin.captureWave(calibration_current.bytes_var, (uint8_t*) (temp_buffer+1));
  temp_buffer[0] = prefix.calibration;
  usb.send((const unsigned char*) temp_buffer, (size_t) (temp_size+1));
  //usb.send((const unsigned char*) cobs_buffer, cobs_size);
}

//  boolean state[] = {false, false, false, false, false};
//  int a = 0;
//  float mos_temp;
//  float res_temp;
//  float ext_temp;
//  noInterrupts();
//  pinMode(pin.SDA0, OUTPUT);
//  pinMode(pin.SCL0, OUTPUT);
//  pinMode(pin.INPUTS[0], INPUT);
//  
//  while(true){
//    a = analogRead(pin.MOSFET_TEMP);
//    digitalWriteFast(pin.OUTPUTS[2], HIGH);
//    ext_temp = pin.mosfetTemp();
//    digitalWriteFast(pin.OUTPUTS[2], LOW);
//    
//    Serial.print(a);
//    Serial.print(" = ");
//    Serial.print(ext_temp);
//    Serial.println("°C");
//    delay(100);
//    
//    /*
//    a = convertTemp(ext_temp);
//    Serial.println(a);
//    Serial.println();
//    /*
//    if(state[0] && a>500){
//      digitalWriteFast(pin.OUTPUTS[2], state[0]);
//      state[0] = !state[0];
//    }
//    else if(!state[0] && a<500){
//      digitalWriteFast(pin.OUTPUTS[2], state[0]);
//      state[0] = !state[0];
//    }
//    */
//  }
  
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
  
/*
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
 */
/*

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
