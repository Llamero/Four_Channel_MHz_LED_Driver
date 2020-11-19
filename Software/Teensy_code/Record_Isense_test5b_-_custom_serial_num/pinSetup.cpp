/*
  Default configuration of teensy pins
*/

#include "Arduino.h"
#include "pinSetup.h"
#include "ADC.h"
#include "ADC_util.h"
#include "AnalogBufferDMA.h"
#include "Wire.h"

ADC *adc = new ADC(); // adc object;

//NOTE: It seems that in this compiler lists longer than 4 need to be built in CPP while shorter lists need to be built in header with constexpr

const int pinSetup::NC[] = {5, 6, 7, 8, 9, 38, 39}; //Not connected pins
float _WARN_TEMP[] = {70, 70, 70}; //Warning temperatures (°C) for the MOSFET, resisitor, and external thermistor correspondingly.  This is also the temp the board need to cool down to before reactivating after a fault
float _FAULT_TEMP[] = {85, 85, 85}; //Fault temperature(°C) for the MOSFET, resisitor, and external thermistor correspondingly.  If the board rises above this temp it will deactivate the LED and driver until the temperature falls below the warn temperature
float _FAN_LIMITS_TEMP[] = {30, _WARN_TEMP[0]}; //LED temp at which the PWM fan runs at minimum speed - default to just above room temp so that fan turns off when driver is inactive
int _EXT_THERMISTOR_NOMINAL = 4700; //Value of thermistor resistor on PCB at nominal temp (normally 25°C)
int _EXT_B_COEFFICIENT = 3545; //Beta value for the PCB thermistor
float _EXT_TEMPERATURE_NOMINAL = 25; //Reference temperature for the nominal resistance on the thermistor on the PCB
int WARN_ADC[3];
int FAULT_ADC[3];
int FAN_LIMITS_ADC[2];
constexpr static uint32_t initial_average_value = 2048;
constexpr static uint32_t buffer_size = 1600;
DMAMEM static volatile uint16_t __attribute__((aligned(32))) dma_adc2_buff1[buffer_size];
//AnalogBufferDMA abdma2(dma_adc2_buff1, buffer_size, dma_adc2_buff2, buffer_size);
AnalogBufferDMA abdma2(dma_adc2_buff1, buffer_size);
uint32_t avg_wave[buffer_size];

pinSetup::pinSetup()
{
}

void pinSetup::init() {
  convertToAdc();
}

void pinSetup::convertToAdc() {
  WARN_ADC[0] = tempToAdc(_WARN_TEMP[0], PCB_THERMISTOR_NOMINAL, PCB_TEMPERATURE_NOMINAL, PCB_B_COEFFICIENT);
  WARN_ADC[1] = tempToAdc(_WARN_TEMP[1], PCB_THERMISTOR_NOMINAL, PCB_TEMPERATURE_NOMINAL, PCB_B_COEFFICIENT);
  WARN_ADC[2] = tempToAdc(_WARN_TEMP[2], _EXT_THERMISTOR_NOMINAL, _EXT_TEMPERATURE_NOMINAL, _EXT_B_COEFFICIENT);

  FAULT_ADC[0] = tempToAdc(_WARN_TEMP[0], PCB_THERMISTOR_NOMINAL, PCB_TEMPERATURE_NOMINAL, PCB_B_COEFFICIENT);
  FAULT_ADC[1] = tempToAdc(_WARN_TEMP[1], PCB_THERMISTOR_NOMINAL, PCB_TEMPERATURE_NOMINAL, PCB_B_COEFFICIENT);
  FAULT_ADC[2] = tempToAdc(_WARN_TEMP[2], _EXT_THERMISTOR_NOMINAL, _EXT_TEMPERATURE_NOMINAL, _EXT_B_COEFFICIENT);

  FAN_LIMITS_ADC[0] = tempToAdc(_FAN_LIMITS_TEMP[0], PCB_THERMISTOR_NOMINAL, PCB_TEMPERATURE_NOMINAL, PCB_B_COEFFICIENT);
  FAN_LIMITS_ADC[1] = tempToAdc(_FAN_LIMITS_TEMP[1], PCB_THERMISTOR_NOMINAL, PCB_TEMPERATURE_NOMINAL, PCB_B_COEFFICIENT);
}

void pinSetup::setValues(float WARN_TEMP[3], float FAULT_TEMP[3], float FAN_LIMITS_TEMP[2], int EXT_THERMISTOR_NOMINAL, int EXT_B_COEFFICIENT, float EXT_TEMPERATURE_NOMINAL) {
  *_WARN_TEMP = *WARN_TEMP; //Warning temperatures (°C) for the MOSFET, resisitor, and external thermistor correspondingly.  This is also the temp the board need to cool down to before reactivating after a fault
  *_FAULT_TEMP = *FAULT_TEMP; //Fault temperature(°C) for the MOSFET, resisitor, and external thermistor correspondingly.  If the board rises above this temp it will deactivate the LED and driver until the temperature falls below the warn temperature
  *_FAN_LIMITS_TEMP = *FAN_LIMITS_TEMP; //LED temp at which the PWM fan runs at minimum speed - default to just above room temp so that fan turns off when driver is inactive
  _EXT_THERMISTOR_NOMINAL = EXT_THERMISTOR_NOMINAL; //Value of thermistor resistor on PCB at nominal temp (normally 25°C)
  _EXT_B_COEFFICIENT = EXT_B_COEFFICIENT; //Beta value for the PCB thermistor
  _EXT_TEMPERATURE_NOMINAL = EXT_TEMPERATURE_NOMINAL; //Reference temperature for the nominal resistance on the thermistor on the PCB

  convertToAdc();
}

void pinSetup::configurePins() {
  unsigned int a; //Loop counter
  analogWriteResolution(12);

  ///// ADC0 ////
  // reference can be ADC_REFERENCE::REF_3V3, ADC_REFERENCE::REF_1V2 (not for Teensy LC) or ADC_REFERENCE::REF_EXT.
  adc->adc0->setReference(ADC_REFERENCE::REF_3V3); // change all 3.3 to 1.2 if you change the reference to 1V2

  adc->adc0->setAveraging(ADC_AVERAGING); // set number of averages
  adc->adc0->setResolution(ADC_RESOLUTION); // set bits of resolution

  // it can be any of the ADC_CONVERSION_SPEED enum: VERY_LOW_SPEED, LOW_SPEED, MED_SPEED, HIGH_SPEED_16BITS, HIGH_SPEED or VERY_HIGH_SPEED
  // see the documentation for more information
  // additionally the conversion speed can also be ADACK_2_4, ADACK_4_0, ADACK_5_2 and ADACK_6_2,
  // where the numbers are the frequency of the ADC clock in MHz and are independent on the bus speed.
  adc->adc0->setConversionSpeed(ADC_CONVERSION_SPEED::VERY_HIGH_SPEED); // change the conversion speed
  // it can be any of the ADC_MED_SPEED enum: VERY_LOW_SPEED, LOW_SPEED, MED_SPEED, HIGH_SPEED or VERY_HIGH_SPEED
  adc->adc0->setSamplingSpeed(ADC_SAMPLING_SPEED::VERY_HIGH_SPEED); // change the sampling speed

  ////// ADC1 /////
  adc->adc1->setReference(ADC_REFERENCE::REF_3V3);
  adc->adc1->setAveraging(ADC_AVERAGING); // set number of averages
  adc->adc1->setResolution(ADC_RESOLUTION); // set bits of resolution
  adc->adc1->setConversionSpeed(ADC_CONVERSION_SPEED::VERY_HIGH_SPEED); // change the conversion speed
  adc->adc1->setSamplingSpeed(ADC_SAMPLING_SPEED::VERY_HIGH_SPEED); // change the sampling speed

  ////// INPUT /////
  pinMode(TOGGLE, INPUT_PULLUP);
  for (a = 0; a < sizeof(PUSHBUTTON) / sizeof(PUSHBUTTON[0]); a++) pinMode(PUSHBUTTON[a], INPUT_PULLUP);

  ////// OUTPUT /////
  for (a = 0; a < sizeof(RELAY) / sizeof(RELAY[0]); a++) pinMode(RELAY[a], OUTPUT);
  for (a = 0; a < sizeof(RELAY) / sizeof(RELAY[0]); a++) digitalWriteFast(RELAY[a], LOW);
  pinMode(INTERLINE, OUTPUT);
  digitalWriteFast(INTERLINE, LOW);
  pinMode(ANALOG_SELECT, OUTPUT);
  digitalWriteFast(ANALOG_SELECT, LOW);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWriteFast(LED_BUILTIN, LOW);
  for (a = 0; a < sizeof(ALARM) / sizeof(ALARM[0]); a++) pinMode(ALARM[a], OUTPUT);
  for (a = 0; a < sizeof(ALARM) / sizeof(ALARM[0]); a++) digitalWriteFast(ALARM[a], LOW);
  for (a = 0; a < sizeof(OUTPUTS) / sizeof(OUTPUTS[0]); a++) pinMode(OUTPUTS[a], OUTPUT);
  for (a = 0; a < sizeof(OUTPUTS) / sizeof(OUTPUTS[0]); a++) digitalWriteFast(OUTPUTS[a], LOW);
  pinMode(FAN_PWM, OUTPUT);
  digitalWriteFast(FAN_PWM, LOW);
  for (a = 0; a < sizeof(LED) / sizeof(LED[0]); a++) pinMode(LED[a], OUTPUT);
  for (a = 0; a < sizeof(LED) / sizeof(LED[0]); a++) digitalWriteFast(LED[a], LOW);

  ////// DISABLE /////
  for (a = 0; a < sizeof(INPUTS) / sizeof(INPUTS[0]); a++) pinMode(INPUTS[a], INPUT_DISABLE);
  for (a = 0; a < sizeof(NC) / sizeof(NC[0]); a++) pinMode(NC[a], INPUT_DISABLE);
  pinMode(EXTERNAL_TEMP, INPUT_DISABLE);

  ////// I2C /////
  Wire.begin();
  Wire.setClock(3400000);
  Wire.setSDA(SDA0);
  Wire.setSCL(SCL0);
}

int pinSetup::adcMax() {
  return (int) adc->adc0->getMaxValue();
}

float pinSetup::mosfetTemp() {
  int adc = analogRead(MOSFET_TEMP);
  return adcToTemp(adc, PCB_THERMISTOR_NOMINAL, PCB_TEMPERATURE_NOMINAL, PCB_B_COEFFICIENT);
}

float pinSetup::resistorTemp() {
  int adc = analogRead(RESISTOR_TEMP);
  return adcToTemp(adc, PCB_THERMISTOR_NOMINAL, PCB_TEMPERATURE_NOMINAL, PCB_B_COEFFICIENT);
}

float pinSetup::extTemp() {
  int adc = analogRead(EXTERNAL_TEMP);
  return adcToTemp(adc, PCB_THERMISTOR_NOMINAL, PCB_TEMPERATURE_NOMINAL, PCB_B_COEFFICIENT);
}

float pinSetup::adcToTemp(int adc, int therm_nominal, float temp_nominal, int b_coefficient) {
  float steinhart;
  float raw = (float) adc;
  raw = adcMax() / raw - 1;
  raw = SERIES_RESISTOR / raw;
  steinhart = raw / therm_nominal;     // (R/Ro)
  steinhart = log(steinhart);                  // ln(R/Ro)
  steinhart /= b_coefficient;                   // 1/B * ln(R/Ro)
  steinhart += 1.0 / (temp_nominal + 273.15); // + (1/To)
  steinhart = 1.0 / steinhart;                 // Invert
  steinhart -= 273.15;
  return steinhart;
}

int pinSetup::tempToAdc(float temperature, int therm_nominal, float temp_nominal, int b_coefficient) {
  float steinhart = temperature;
  float raw;
  steinhart += 273.15;
  steinhart = 1.0 / steinhart;
  steinhart -= 1.0 / (temp_nominal + 273.15); // + (1/To);
  steinhart *= b_coefficient;
  steinhart = exp(steinhart);;
  raw = steinhart * therm_nominal;
  raw = SERIES_RESISTOR / raw;
  raw = adcMax() / (raw + 1);
  return (int) round(raw);
}

void pinSetup::captureWave(uint16_t DAC_value) {
  pinMode(ISENSE, INPUT);
  pinMode(SCL0, OUTPUT); ////////////////////////////////////TRIG SYNC FOR TESTING
  digitalWriteFast(RELAY[3], HIGH);
  digitalWriteFast(INTERLINE, LOW);
  digitalWriteFast(ANALOG_SELECT, LOW);
  analogWrite(DAC0, DAC_value);
  delay(1);
  abdma2.init(adc, ADC_0);
  abdma2.stopOnCompletion(true);
  adc->adc0->startContinuous(ISENSE);
  noInterrupts();
  abdma2.clearInterrupt();
  delayMicroseconds(100);
  digitalWriteFast(SCL0, HIGH); ////////////////////////////////////TRIG SYNC FOR TESTING
  digitalWriteFast(INTERLINE, HIGH);
  delayMicroseconds(500);
  digitalWriteFast(INTERLINE, LOW);
  delayMicroseconds(200);
  digitalWriteFast(INTERLINE, HIGH);
  delayMicroseconds(500);
  digitalWriteFast(INTERLINE, LOW);
  digitalWriteFast(SCL0, LOW); ////////////////////////////////////TRIG SYNC FOR TESTING
  interrupts();
  while (!abdma2.interrupted());
  digitalWriteFast(INTERLINE, LOW);
  ProcessAnalogData(&abdma2, ADC_0);
  abdma2.clearCompletion();
}

void pinSetup::ProcessAnalogData(AnalogBufferDMA *pabdma, int8_t adc_num) {
  volatile uint16_t *pbuffer = pabdma->bufferLastISRFilled();
  volatile uint16_t *end_pbuffer = pbuffer + pabdma->bufferCountLastISRFilled();
  volatile uint16_t test;

  if ((uint32_t)pbuffer >= 0x20200000u)  arm_dcache_delete((void*)pbuffer, sizeof(dma_adc2_buff1));
  Serial.write((uint8_t *) pbuffer, pabdma->bufferCountLastISRFilled()*2);
}
