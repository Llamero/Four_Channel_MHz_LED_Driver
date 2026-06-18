/*!
 * @file DAC.h
 * @brief Arduino/Teensyduino driver for the Texas Instruments DAC80501ZDGSR
 *        16-bit, SPI, voltage-output DAC, fixed for VDD = 3.3V and a
 *        0-2.5V output range using the internal 2.5V reference.
 *
 * Datasheet: https://www.ti.com/lit/ds/symlink/dac80501.pdf (SBAS794E)
 *
 * -------------------------------------------------------------------------
 * FIXED CONFIGURATION (this build assumes these and is simplified around
 * them -- see GAIN_REGISTER_VALUE below if your supply or range changes)
 * -------------------------------------------------------------------------
 * VDD = 3.3V, internal 2.5V reference enabled, full-scale output = 2.5V.
 *
 * Getting 2.5V full scale from a 2.5V reference looks like it just means
 * "gain = 1, no division" (REF-DIV=0, BUFF-GAIN=0), but that combination
 * is NOT valid at VDD = 3.3V. The datasheet's recommended operating
 * conditions cap VREFIO at 0.5 x VDD (=1.65V) when REF-DIV=0, which the
 * fixed 2.5V internal reference would exceed -- the part would assert
 * its REF-ALARM condition and force VOUT to 0V. Instead this library
 * uses REF-DIV=1 (reference divided by 2 internally) and BUFF-GAIN=1
 * (output buffer gain of 2x), which still gives VOUT_FS = VREFIO * GAIN
 * / DIV = 2.5 * 2 / 2 = 2.5V, but keeps VREFIO inside the valid 2.4V-VDD
 * range required at VDD = 3.3V with REF-DIV=1. This is written once, in
 * begin().
 *
 * -------------------------------------------------------------------------
 * HARDWARE / PROTOCOL NOTES (read before using)
 * -------------------------------------------------------------------------
 * 1. Interface select: the DAC80501's SPI2C pin must be tied LOW (to AGND)
 *    to put the part in SPI mode. This must be static after power-up.
 *
 * 2. This part uses a 3-wire SPI interface: SCLK, SDIN, and SYNC (the
 *    datasheet's name for chip-select). There is NO dedicated SPI output
 *    pin (no SDO/MISO) on this device in SPI mode -- SDIN is an input
 *    only. Per TI (datasheet section 8.5.1.1 and TI E2E confirmation),
 *    SPI mode on this chip is WRITE-ONLY: the DEVID and STATUS registers
 *    (and read-back of any register) cannot be read over SPI. This
 *    library therefore exposes only write-capable registers and keeps a
 *    local shadow copy of the DAC code so you can query what was last
 *    sent.
 *
 *    Your MISO line (pin 12) can stay wired since it's part of the
 *    Teensy 4.1's hardware SPI bus, but the DAC will never drive it.
 *
 * 3. Every transaction is a 24-bit frame: an 8-bit command byte (the
 *    register address in the low bits, upper bits reserved/0) followed
 *    by a 16-bit data word, MSB first. The addressed register updates on
 *    the rising edge of SYNC/CS in the default asynchronous mode.
 *
 * 4. SCLK can run up to 50 MHz. SYNC/CS must stay low for all 24 SCLK
 *    falling edges of a frame and be brought high for >=160 ns between
 *    frames. TI also specifies a minimum 1 us wait between sequential
 *    DAC updates (tDACWAIT). This library inserts a 1 us guard after
 *    every register write to satisfy both.
 *
 * 5. Power-on-reset: after VDD is applied, the device needs ~250 us
 *    before it will accept valid commands. begin() and softReset() both
 *    account for this.
 *
 * Wiring assumed by the default begin() pin roles on a Teensy 4.1 using
 * the primary hardware SPI bus:
 *   SCLK  -> pin 13
 *   SDIN  -> pin 11 (MOSI)
 *   (MISO)-> pin 12 (unused by the DAC, fine to leave wired)
 *   SYNC  -> pin 10 (chosen CS pin, passed to begin())
 */

#ifndef DAC_H
#define DAC_H

#include <Arduino.h>
#include <SPI.h>

class DAC {
public:
    /// Register addresses. These double as the 8-bit "command byte" sent
    /// at the start of every 24-bit SPI frame (Table 8-4 / 8-7 in the
    /// datasheet). DEVID and STATUS are read-only registers on the part
    /// and are NOT reachable over SPI (no SDO pin in SPI mode) -- they
    /// are listed here only for completeness/reference.
    enum Register : uint8_t {
        REG_NOOP    = 0x00, ///< No-operation
        REG_DEVID   = 0x01, ///< Device ID (read-only, I2C-only readback)
        REG_SYNC    = 0x02, ///< DAC_SYNC_EN (sync/async update mode)
        REG_CONFIG  = 0x03, ///< REF_PWDWN, DAC_PWDWN
        REG_GAIN    = 0x04, ///< REF-DIV, BUFF-GAIN
        REG_TRIGGER = 0x05, ///< LDAC, SOFT-RESET (write-only, self-clearing)
        REG_STATUS  = 0x07, ///< REF-ALARM (read-only, I2C-only readback)
        REG_DAC     = 0x08  ///< DAC data register, straight binary, 16-bit
    };

    static const uint16_t MAX_CODE = 0xFFFF; ///< Full-scale 16-bit code
    static const uint16_t SOFT_RESET_KEY = 0x000A; ///< Reserved 1010b code

    /// GAIN register value written once in begin(): REF-DIV=1, BUFF-GAIN=1.
    /// Produces VOUT_FS = VREFIO * 2 / 2 = 2.5V while keeping VREFIO inside
    /// the valid headroom range at VDD = 3.3V (see file header comment).
    static const uint16_t GAIN_REGISTER_VALUE = 0x0101;

    /// Output voltage at full-scale code (0xFFFF) under this fixed
    /// configuration: internal 2.5V reference, REF-DIV=1, BUFF-GAIN=1.
    static constexpr float FULL_SCALE_VOLTS = 2.5f;

    DAC();

    /*!
     * @brief Initialize the driver, the SPI bus, and the DAC's GAIN
     *        register for a fixed 0-2.5V output range.
     * @param csPin       Digital pin wired to the DAC's SYNC pin (e.g. 10).
     * @param spiBus      Which SPI peripheral to use. Defaults to the
     *                     Teensy 4.1's primary hardware SPI (pins 13/11/12).
     * @param spiClockHz  SPI clock rate in Hz. Clamped to the part's
     *                     50 MHz maximum. Defaults to a conservative 20 MHz.
     */
    void begin(uint8_t csPin, SPIClass &spiBus = SPI, uint32_t spiClockHz = 20000000UL);

    // ---------------------------------------------------------------
    // DAC output (DAC register, addr 0x08), 0-2.5V fixed range
    // ---------------------------------------------------------------

    /// Write a raw straight-binary 16-bit code directly to the DAC register.
    void setCode(uint16_t code);

    /// Set the output voltage (0-2.5V; out-of-range values are clamped)
    /// and write the corresponding code to the DAC.
    void setVoltage(float voltage);

    /// Last code written via setCode()/setVoltage() (shadow value; the
    /// part cannot be read back over SPI).
    uint16_t getLastCode() const { return _lastDacCode; }

    /// Output voltage implied by the last written code.
    float getLastVoltage() const;

    // ---------------------------------------------------------------
    // CONFIG register (addr 0x03): DAC power control
    // ---------------------------------------------------------------

    /// Power down the DAC output stage (VOUT pulled to AGND through an
    /// internal 1 kOhm resistor) (DAC_PWDWN bit). The internal reference
    /// is always left enabled (REF_PWDWN=0), per the fixed configuration.
    void powerDownDAC(bool powerDown);
    bool isDacPoweredDown() const { return _dacPwdwn; }

    // ---------------------------------------------------------------
    // SYNC register (addr 0x02): update mode
    // ---------------------------------------------------------------

    /// false (default/async): a DAC register write updates VOUT
    /// immediately on the rising edge of SYNC.
    /// true (sync): writes only update the buffer; call triggerLDAC()
    /// to latch the buffered value into the active DAC register.
    void setSynchronousMode(bool synchronous);
    bool getSynchronousMode() const { return _syncEn; }

    // ---------------------------------------------------------------
    // TRIGGER register (addr 0x05): write-only, self-clearing
    // ---------------------------------------------------------------

    /// Pulse the LDAC bit: in synchronous mode, latches the buffered DAC
    /// value into the active DAC register.
    void triggerLDAC();

    /// Issue a full software reset (equivalent to a power-on reset),
    /// then re-apply the fixed GAIN register configuration. Blocks for
    /// the required ~250 us POR delay before returning.
    void softReset();

    // ---------------------------------------------------------------
    // Low-level access
    // ---------------------------------------------------------------

    /// Send a raw 24-bit write frame (8-bit command/address + 16-bit
    /// data) to any register. Provided for advanced use; the typed
    /// methods above are preferred for normal use.
    void writeRegister(uint8_t reg, uint16_t data);

    /// Send a NOOP frame. Useful as a harmless bus/wiring sanity check.
    void noop();

private:
    SPIClass    *_spi;
    uint8_t      _csPin;
    SPISettings  _spiSettings;

    bool     _dacPwdwn;
    bool     _syncEn;
    uint16_t _lastDacCode;
    bool test;
};

#endif // DAC_H
