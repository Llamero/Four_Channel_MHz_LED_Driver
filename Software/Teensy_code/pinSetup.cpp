/*
  Default configuration of teensy pins
*/

#include "Arduino.h"
#include "pinSetup.h"
#include "ADC.h"
#include "ADC_util.h"
#include "Wire.h"
#include "AnalogBufferDMA.h"

ADC *adc = new ADC(); // adc object;

//NOTE: It seems that in this compiler lists longer than 4 need to be built in CPP while shorter lists need to be built in header with constexpr

const int pinSetup::NC[] = {5, 6, 7, 8, 9, 38, 39}; //Not connected pins
const int pinSetup::OUTPUTS[] = {22, 21, 20};
const int pinSetup::PUSHBUTTON[] = {27, 25, 26, 30}; //Four pushbutton inputs 
const int pinSetup::LED[] = {29, 24, 28, 31}; //Indicator LEDs on pushbuttons
const int pinSetup::INPUTS[] = {37, 36, 35, 34}; //4-channel analog/digital inputs
const int pinSetup::RELAY[] = {3, 2, 1, 0}; //SSR relays for changing LED channel
const int pinSetup::ALARM[] = {11, 32}; //Audible alarm
DMAMEM static volatile uint16_t __attribute__((aligned(32))) dma_adc2_buff1[1600];
AnalogBufferDMA abdma2(dma_adc2_buff1, 1600);


pinSetup::pinSetup()
{
}

void pinSetup::init(){
}


void pinSetup::configurePins(){
    unsigned int a; //Loop counter
    analogWriteResolution(16);
    
    ///// ADC0 ////
    // reference can be ADC_REFERENCE::REF_3V3, ADC_REFERENCE::REF_1V2 (not for Teensy LC) or ADC_REFERENCE::REF_EXT.
    adc->adc0->setReference(ADC_REFERENCE::REF_3V3); // change all 3.3 to 1.2 if you change the reference to 1V2

    adc->adc0->setAveraging(adc_averaging); // set number of averages
    adc->adc0->setResolution(adc_resolution); // set bits of resolution

    // it can be any of the ADC_CONVERSION_SPEED enum: VERY_LOW_SPEED, LOW_SPEED, MED_SPEED, HIGH_SPEED_16BITS, HIGH_SPEED or VERY_HIGH_SPEED
    // see the documentation for more information
    // additionally the conversion speed can also be ADACK_2_4, ADACK_4_0, ADACK_5_2 and ADACK_6_2,
    // where the numbers are the frequency of the ADC clock in MHz and are independent on the bus speed.
    adc->adc0->setConversionSpeed(ADC_CONVERSION_SPEED::VERY_HIGH_SPEED); // change the conversion speed
    // it can be any of the ADC_MED_SPEED enum: VERY_LOW_SPEED, LOW_SPEED, MED_SPEED, HIGH_SPEED or VERY_HIGH_SPEED
    adc->adc0->setSamplingSpeed(ADC_SAMPLING_SPEED::VERY_HIGH_SPEED); // change the sampling speed

    ////// ADC1 /////
    adc->adc1->setReference(ADC_REFERENCE::REF_3V3);
    adc->adc1->setAveraging(adc_averaging); // set number of averages
    adc->adc1->setResolution(adc_resolution); // set bits of resolution
    adc->adc1->setConversionSpeed(ADC_CONVERSION_SPEED::VERY_HIGH_SPEED); // change the conversion speed
    adc->adc1->setSamplingSpeed(ADC_SAMPLING_SPEED::VERY_HIGH_SPEED); // change the sampling speed
    
    ////// INPUT /////
    pinMode(TOGGLE, INPUT_PULLUP);
    for(a=0; a<sizeof(PUSHBUTTON)/sizeof(PUSHBUTTON[0]); a++) pinMode(PUSHBUTTON[a], INPUT_PULLUP);
    pinMode(ISENSE, INPUT);

    ////// OUTPUT /////
    for(a=0; a<sizeof(RELAY)/sizeof(RELAY[0]); a++) pinMode(RELAY[a], OUTPUT);
    for(a=0; a<sizeof(RELAY)/sizeof(RELAY[0]); a++) digitalWriteFast(RELAY[a], !RELAY_CLOSE);
    pinMode(INTERLINE, OUTPUT);
    digitalWriteFast(INTERLINE, LOW);
    analogWriteFrequency(INTERLINE, LED_FREQ); //Set output PWM freq to optimal CPU fan freq, also sets analog_select PWM freq (on same timer): https://www.pjrc.com/teensy/td_pulse.html
    pinMode(ANALOG_SELECT, OUTPUT);
    digitalWriteFast(ANALOG_SELECT, LOW);
    pinMode(LED_BUILTIN, OUTPUT);
    digitalWriteFast(LED_BUILTIN, LOW);
    for(a=0; a<sizeof(ALARM)/sizeof(ALARM[0]); a++) pinMode(ALARM[a], OUTPUT);
    for(a=0; a<sizeof(ALARM)/sizeof(ALARM[0]); a++) digitalWriteFast(ALARM[a], LOW);
    for(a=0; a<sizeof(OUTPUTS)/sizeof(OUTPUTS[0]); a++) pinMode(OUTPUTS[a], OUTPUT);
    for(a=0; a<sizeof(OUTPUTS)/sizeof(OUTPUTS[0]); a++) digitalWriteFast(OUTPUTS[a], LOW);
    analogWriteFrequency(OUTPUTS[0], FAN_FREQ); //Set output PWM freq to optimal CPU fan freq, also sets analog_select PWM freq (on same timer): https://www.pjrc.com/teensy/td_pulse.html
    pinMode(FAN_PWM, OUTPUT);
    digitalWriteFast(FAN_PWM, LOW);
    for(a=0; a<sizeof(LED)/sizeof(LED[0]); a++) pinMode(LED[a], OUTPUT);
    for(a=0; a<sizeof(LED)/sizeof(LED[0]); a++) digitalWriteFast(LED[a], LOW);
    
    ////// DISABLE /////
    for(a=0; a<sizeof(INPUTS)/sizeof(INPUTS[0]); a++) pinMode(INPUTS[a], INPUT_DISABLE);
    for(a=0; a<sizeof(NC)/sizeof(NC[0]); a++) pinMode(NC[a], INPUT_DISABLE);
    pinMode(EXTERNAL_TEMP, INPUT_DISABLE);
    
    ////// I2C /////
    Wire.begin();
    Wire.setClock(3400000);
    Wire.setSDA(SDA0);
    Wire.setSCL(SCL0);
}

int pinSetup::adcMax(){
  return (int) adc->adc0->getMaxValue();
}

uint16_t pinSetup::mosfetTemp(){
  return analogRead(MOSFET_TEMP);
}

uint16_t pinSetup::resistorTemp(){
  return analogRead(RESISTOR_TEMP);
}

uint16_t pinSetup::extTemp(){
  return analogRead(EXTERNAL_TEMP);
}

//Requires 14 µs to complete calculation
float pinSetup::adcToTemp(int adc, int therm_nominal = PCB_THERMISTOR_NOMINAL, int b_coefficient = PCB_B_COEFFICIENT){
  float steinhart;
  float raw = (float) adc;
  raw = adcMax() / raw - 1;
  raw = SERIES_RESISTOR / raw;
  steinhart = raw / therm_nominal;     // (R/Ro)
  steinhart = log(steinhart);                  // ln(R/Ro)
  steinhart /= b_coefficient;                   // 1/B * ln(R/Ro)
  steinhart += 1.0 / (25 + 273.15); // + (1/To)
  steinhart = 1.0 / steinhart;                 // Invert
  steinhart -= 273.15;   
  return steinhart;

}

int pinSetup::tempToAdc(float temperature, int therm_nominal = PCB_THERMISTOR_NOMINAL, int b_coefficient = PCB_B_COEFFICIENT){
  float steinhart = temperature;
  float raw;
  steinhart += 273.15;  
  steinhart = 1.0 / steinhart;  
  steinhart -= 1.0 / (25 + 273.15); // + (1/To); 
  steinhart *= b_coefficient;
  steinhart = exp(steinhart);
  raw = steinhart * therm_nominal; 
  raw = SERIES_RESISTOR/raw;
  raw = adcMax()/(raw+1); 
  return (int) round(raw);
}

uint16_t pinSetup::captureWave(uint16_t test_dac_value, uint8_t *cobs_buffer) {
  pinMode(ISENSE, INPUT);
  digitalWriteFast(INTERLINE, LOW);
  digitalWriteFast(ANALOG_SELECT, LOW);
  analogWrite(DAC0, test_dac_value);
  delayMicroseconds(100);
  abdma2.init(adc, ADC_0);
  abdma2.stopOnCompletion(true);
  adc->adc0->startContinuous(ISENSE);
  noInterrupts();
  abdma2.clearInterrupt();
  delayMicroseconds(100);
  digitalWriteFast(INTERLINE, HIGH);
  delayMicroseconds(300);
  digitalWriteFast(INTERLINE, LOW);
  delayMicroseconds(200);
  digitalWriteFast(INTERLINE, HIGH);
  delayMicroseconds(300);
  digitalWriteFast(INTERLINE, LOW);
  interrupts();
  while (!abdma2.interrupted());
  digitalWriteFast(INTERLINE, LOW);
  if ((uint32_t)cobs_buffer >= 0x20200000u)  arm_dcache_delete((void*)cobs_buffer, sizeof(dma_adc2_buff1));
  uint16_t cobs_size = (&abdma2)->bufferCountLastISRFilled()*2;
  memcpy(cobs_buffer, (const void*) ((&abdma2)->bufferLastISRFilled()), cobs_size);
  abdma2.clearCompletion();
  return cobs_size;
}
