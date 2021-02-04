#ifndef usbSerial_h
#define usbSerial_h

#include "Arduino.h"
#include "PacketSerial.h"

//NOTE: It seems that in this compiler lists longer than 4 need to be built in CPP while shorter lists need to be built in header with constexpr

class usbSerial
{
  public:
    usbSerial();
    static void startSerial();
    static void onPacketReceived(const uint8_t* buffer, size_t size);
    static void send();
    static void checkBuffer();
    const static char MAGIC_RECEIVE[]; //Magic number received from Teensy verifying it is an LED driver

  private:
    void init(); //Initialize reference variables   
    static char MAGIC_SEND[];
    static void magicExchange(const uint8_t* buffer, size_t size);
};
   
#endif
