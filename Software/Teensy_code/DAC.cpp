/*!
 * @file DAC.cpp
 * @brief Implementation for the DAC.h driver. See DAC.h for the
 *        protocol notes, the fixed-configuration rationale, and the
 *        datasheet reference.
 */

#include "DAC.h"

constexpr float DAC::FULL_SCALE_VOLTS;

DAC::DAC()
    : _spi(nullptr),
      _csPin(255),
      _spiSettings(20000000UL, MSBFIRST, SPI_MODE1),
      _dacPwdwn(false),     // CONFIG reset = 0000h -> DAC active
      _syncEn(false),       // SYNC reset = 0000h -> asynchronous updates
      _lastDacCode(0)       // DAC80501Z resets to zero-scale (= 0V here)
{
}

void DAC::begin(uint8_t csPin, SPIClass &spiBus, uint32_t spiClockHz)
{
    test = false;
    _csPin = csPin;
    _spi   = &spiBus;

    if (spiClockHz > 50000000UL) {
        spiClockHz = 50000000UL; // datasheet maximum SCLK frequency
    }
    _spiSettings = SPISettings(spiClockHz, MSBFIRST, SPI_MODE1);

    pinMode(_csPin, OUTPUT);
    digitalWrite(_csPin, HIGH); // SYNC idles high

    _spi->begin();

    // Section 8.3.3: communication is valid only after a 250 us POR delay
    // once VDD has been established. Safe to wait here even if power has
    // been up for a while.
    delayMicroseconds(300);

    // Fixed output range: REF-DIV=1, BUFF-GAIN=1 -> VOUT_FS = 2.5V at
    // VDD = 3.3V. See the rationale in the file header of DAC.h.
    writeRegister(REG_GAIN, GAIN_REGISTER_VALUE);
}

// ---------------------------------------------------------------------
// Low level
// ---------------------------------------------------------------------

void DAC::writeRegister(uint8_t reg, uint16_t data)
{
    _spi->beginTransaction(_spiSettings);
    digitalWrite(_csPin, LOW); // SYNC falling edge starts the frame
    _spi->transfer(reg & 0x0F);              // command byte (upper bits reserved = 0)
        if(test) Serial.println("test2");
    else Serial.println("test1");
    _spi->transfer((uint8_t)(data >> 8));     // MSDB
    _spi->transfer((uint8_t)(data & 0xFF));   // LSDB
    digitalWrite(_csPin, HIGH); // SYNC rising edge latches the register
    _spi->endTransaction();
    // tSYNCHIGH (>=160 ns) and tDACWAIT (>=1 us between DAC updates).
    delayMicroseconds(1);
    test = true;
}

void DAC::noop()
{
    writeRegister(REG_NOOP, 0x0000);
}

// ---------------------------------------------------------------------
// DAC output, fixed 0-2.5V range
// ---------------------------------------------------------------------

void DAC::setCode(uint16_t code)
{
    _lastDacCode = code;
    writeRegister(REG_DAC, code);
    Serial.println("done");
}

void DAC::setVoltage(float voltage)
{
    if (voltage < 0.0f) voltage = 0.0f;
    if (voltage > FULL_SCALE_VOLTS) voltage = FULL_SCALE_VOLTS;

    uint16_t code = (uint16_t)((voltage / FULL_SCALE_VOLTS) * (float)MAX_CODE + 0.5f);
    setCode(code);
}

float DAC::getLastVoltage() const
{
    return (FULL_SCALE_VOLTS * (float)_lastDacCode) / (float)MAX_CODE;
}

// ---------------------------------------------------------------------
// CONFIG register (addr 0x03) - DAC power-down only; REF_PWDWN is
// always left at 0 (internal reference enabled) per the fixed config.
// ---------------------------------------------------------------------

void DAC::powerDownDAC(bool powerDown)
{
    _dacPwdwn = powerDown;
    writeRegister(REG_CONFIG, _dacPwdwn ? 0x0001 : 0x0000);
}

// ---------------------------------------------------------------------
// SYNC register (addr 0x02)
// ---------------------------------------------------------------------

void DAC::setSynchronousMode(bool synchronous)
{
    _syncEn = synchronous;
    writeRegister(REG_SYNC, _syncEn ? 0x0001 : 0x0000);
}

// ---------------------------------------------------------------------
// TRIGGER register (addr 0x05) - write-only, self-clearing bits
// ---------------------------------------------------------------------

void DAC::triggerLDAC()
{
    writeRegister(REG_TRIGGER, (1 << 4)); // LDAC bit
}

void DAC::softReset()
{
    writeRegister(REG_TRIGGER, SOFT_RESET_KEY); // reserved code 1010b

    // A software reset triggers a full POR; wait the same delay as begin().
    delayMicroseconds(250);

    // Restore shadow state and re-apply the fixed GAIN configuration,
    // since a reset reverts GAIN to its POR default (REF-DIV=0,
    // BUFF-GAIN=1), which is not the combination this library relies on.
    _dacPwdwn    = false;
    _syncEn      = false;
    _lastDacCode = 0; // DAC80501Z -> zero scale
    writeRegister(REG_GAIN, GAIN_REGISTER_VALUE);
}
