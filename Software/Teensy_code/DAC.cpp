/*
  DAC80501 Library for Teensy 4.1
  Simplified for 3.3V power, 2.5V internal reference, 16-bit operation
*/

#include "Arduino.h"
#include "DAC.h"
#include "pinSetup.h"

DAC::DAC() : _spiSettings(SPI_SPEED, MSBFIRST, SPI_MODE1)
{
    _csPin = pinSetup::CS;
}

void DAC::begin()
{
    // Configure CS pin
    pinMode(_csPin, OUTPUT);
    digitalWriteFast(_csPin, HIGH);
    
    // Initialize SPI
    SPI.begin();
    
    // Small delay for DAC power-up
    delayMicroseconds(100);
    
    // Configure the DAC:
    // REG_CONFIG (0x03): Set REF-PWDWN = 0 (enable internal reference)
    // Bit 8 = REF-PWDWN, we want it 0 to enable internal ref
    writeRegister(REG_CONFIG, 0x0000);
    
    // REG_GAIN (0x04):
    // Bit 8 = REF-DIV:   1 = bypass internal /2 divider → reference = 1.25V
    // Bit 0 = BUFF-GAIN: 1 = output buffer gain of 2
    // Vout = 1.25V * 2 * (code/65536) = 0 to 2.5V full scale
    writeRegister(REG_GAIN, 0x0101); // Changed from 0x0100 to 0x0101
    
    // Set initial output to 0V
    setCode(0);
}

void DAC::setVoltage(float voltage)
{
    // Clamp voltage to valid range
    if (voltage < 0.0f) voltage = 0.0f;
    if (voltage > VREF) voltage = VREF;
    
    setCode(voltageToCode(voltage));
}

void DAC::setCode(uint16_t code)
{
    writeRegister(REG_DAC, code);
}

uint16_t DAC::voltageToCode(float voltage)
{
    // Clamp voltage to valid range
    if (voltage < 0.0f) voltage = 0.0f;
    if (voltage > VREF) voltage = VREF;
    
    // Convert voltage to code: code = (voltage / VREF) * 65536
    uint32_t code = (uint32_t)((voltage / VREF) * 65536.0f);
    if (code > DAC_MAX) code = DAC_MAX;
    
    return (uint16_t)code;
}

float DAC::codeToVoltage(uint16_t code)
{
    // Convert code to voltage: voltage = VREF * (code / 65536)
    return VREF * ((float)code / 65536.0f);
}

void DAC::writeRegister(uint8_t reg, uint16_t value)
{
    SPI.beginTransaction(_spiSettings);
    digitalWriteFast(_csPin, LOW);
    
    // DAC80501 uses 24-bit frames: 8-bit command + 16-bit data
    // Command byte: bit 7 = R/W (0=write), bits 6:0 = register address
    SPI.transfer(reg & 0x7F);           // Write command (bit 7 = 0)
    SPI.transfer((value >> 8) & 0xFF);  // MSB of data
    SPI.transfer(value & 0xFF);         // LSB of data
    
    digitalWriteFast(_csPin, HIGH);
    SPI.endTransaction();
}

uint16_t DAC::readRegister(uint8_t reg)
{
    uint16_t value;
    
    SPI.beginTransaction(_spiSettings);
    digitalWriteFast(_csPin, LOW);
    
    // Read command: bit 7 = 1
    SPI.transfer(reg | 0x80);
    SPI.transfer(0x00);  // Dummy byte
    SPI.transfer(0x00);  // Dummy byte
    
    digitalWriteFast(_csPin, HIGH);
    
    // Second transaction to clock out the data
    delayMicroseconds(1);
    digitalWriteFast(_csPin, LOW);
    
    SPI.transfer(REG_NOOP);              // NOOP command
    value = SPI.transfer(0x00) << 8;     // MSB
    value |= SPI.transfer(0x00);         // LSB
    
    digitalWriteFast(_csPin, HIGH);
    SPI.endTransaction();
    
    return value;
}