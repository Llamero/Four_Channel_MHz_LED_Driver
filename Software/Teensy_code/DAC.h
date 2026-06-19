/*
  DAC80501 Library for Teensy 4.1
  Simplified for 3.3V power, 2.5V internal reference, 16-bit operation
*/
#ifndef DAC_h
#define DAC_h

#include "Arduino.h"
#include <SPI.h>

class DAC
{
  public:
    DAC();
    void begin();
    void setVoltage(float voltage);  // Set voltage in volts (0 to 2.5V)
    void setCode(uint16_t code);     // Set raw 16-bit DAC code (0 to 65535)
    uint16_t voltageToCode(float voltage);  // Convert voltage to DAC code
    float codeToVoltage(uint16_t code);     // Convert DAC code to voltage
    
  private:
    void writeRegister(uint8_t reg, uint16_t value);
    uint16_t readRegister(uint8_t reg);
    
    // Register addresses
    static const uint8_t REG_NOOP    = 0x00;
    static const uint8_t REG_DEVID   = 0x01;
    static const uint8_t REG_SYNC    = 0x02;
    static const uint8_t REG_CONFIG  = 0x03;
    static const uint8_t REG_GAIN    = 0x04;
    static const uint8_t REG_TRIGGER = 0x05;
    static const uint8_t REG_STATUS  = 0x07;
    static const uint8_t REG_DAC     = 0x08;
    
    // Configuration constants
    static const uint32_t SPI_SPEED = 1e6;  // 50 MHz max for DAC80501
    static constexpr float VREF = 2.5;           // Internal 2.5V reference
    static const uint16_t DAC_MAX = 65535;       // 16-bit max value
    
    SPISettings _spiSettings;
    int _csPin;
};

#endif