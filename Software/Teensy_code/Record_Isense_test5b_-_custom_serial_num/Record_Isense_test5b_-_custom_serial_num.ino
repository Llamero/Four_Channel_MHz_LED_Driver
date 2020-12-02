
#include <ADC.h>
#include <AnalogBufferDMA.h>
#include "pinSetup.h"

const int readPin_adc_1 = 37;
uint8_t mode;
pinSetup pin;
uint16_t a=3200;
uint32_t pot = 0;
uint16_t fan_speed = 0;
boolean LEDstate = false;
boolean fanState = false;
float mos;
float res;


//Uncomment to assign a custom serial number to the driver
//extern "C"
//{
//    struct usb_string_descriptor_struct
//    {
//        uint8_t bLength;
//        uint8_t bDescriptorType;
//        uint16_t wString[10];
//    };
//
//    usb_string_descriptor_struct usb_string_serial_number =
//    {
//         22,  // 2 + 2*length of the sn string
//         3,
//         {'M','H','Z','_', 'L', 'E', 'D','0','1',0},
//    };
//}

void setup() {
  //Initialize CPU clock counter for sub-microsecond delays
  ARM_DEMCR |= ARM_DEMCR_TRCENA;
  ARM_DWT_CTRL |= ARM_DWT_CTRL_CYCCNTENA;
  Serial.begin(9600);
//  while(!Serial);
  pin.configurePins();
  digitalWriteFast(pin.RELAY[0], HIGH);
  digitalWriteFast(pin.ANALOG_SELECT, LOW);
  analogWrite(pin.DAC0, 2500);
  analogWriteFrequency(pin.INTERLINE, 234375);
  analogWrite(pin.INTERLINE, 0);
//  digitalWriteFast(pin.LED[0], HIGH);
//  digitalWriteFast(pin.LED[1], HIGH);
//  digitalWriteFast(pin.LED[2], HIGH);
//  digitalWriteFast(pin.LED[3], HIGH);
  while(true) delay(1000);

  
  analogWrite(pin.DAC0, 4095);
  digitalWriteFast(pin.RELAY[3], HIGH);
//  analogWriteFrequency(pin.INTERLINE, 7324);
  analogWrite(pin.FAN_PWM, 2048);
//  analogWrite(pin.INTERLINE, 2048);
  /*
  while(true){
    if(digitalRead(pin.PUSHBUTTON[0])){
      delay(200);
      while(digitalRead(pin.PUSHBUTTON[0]));
      delay(200);
      if(LEDstate){
        digitalWriteFast(pin.LED[0], LOW);
        digitalWriteFast(pin.INTERLINE, LOW);
      }
      else{
        digitalWriteFast(pin.LED[0], HIGH);
        analogWrite(pin.INTERLINE, 2048);
      }
      LEDstate = !LEDstate;
    }
  }
  */
}
  
void loop() {
  while(!Serial.available()){
    pot = 0;
    for(a=0; a<32; a++){
      pot += analogRead(pin.POT);
    }
    pot = pot >> 9;
//    Serial.println(pot);
    analogWrite(pin.DAC0, pot);
    
    /*
    if(digitalRead(pin.PUSHBUTTON[0])){
      delay(100);
      while(digitalRead(pin.PUSHBUTTON[0]));
      delay(100);
      if(LEDstate){
        digitalWriteFast(pin.LED[0], LOW);
        digitalWriteFast(pin.INTERLINE, LOW);
      }
      else{
        digitalWriteFast(pin.LED[0], HIGH);
        digitalWriteFast(pin.INTERLINE, HIGH);
      }
      LEDstate = !LEDstate;
    }
    mos = pin.mosfetTemp();
    res = pin.resistorTemp();
    
    if(mos > 30){
      fan_speed = round(4095/(60-30)*(mos-30));
      analogWrite(pin.FAN_PWM, fan_speed);
    }
    else if(mos > 60) {
        analogWrite(pin.DAC0, 0);
        digitalWriteFast(pin.RELAY[3], LOW);
        digitalWriteFast(pin.INTERLINE, LOW);
    }
    else{
      analogWrite(pin.FAN_PWM, 0);
    }
    Serial.print("MOSFET: ");
    Serial.print(mos);
    Serial.print(" °C, RESISTOR: ");
    Serial.print(res);
    Serial.print(" °C, FAN SPEED: ");
    Serial.println(fan_speed);
    delay(500); 
    */
  }
  while(Serial.available()) mode = Serial.read();
  if(mode == 1){
    digitalWriteFast(LED_BUILTIN, HIGH);
    pin.captureWave(pot);
    digitalWriteFast(LED_BUILTIN, LOW);
  }
  
}
