#ifndef usbSerial_h
#define usbSerial_h

#include "Arduino.h"
#include "PacketSerial.h"
#include "SDcard.h"

//NOTE: It seems that in this compiler lists longer than 4 need to be built in CPP while shorter lists need to be built in header with constexpr

class usbSerial
{
  public:
    usbSerial();
    static void startSerial(); //Initialize PacketSerial
    static void send(); //Send COBS message to GUI
    static void checkBuffer(); //Check if serial is available using PacketSerial function
    static int magicSize(); //returns size of MAGIC_RECEIVE
    static boolean sd_available; //Whether there is an SD card available
    const static char MAGIC_RECEIVE[]; //Magic number received from Teensy verifying it is an LED driver 
    

  private:
    static char MAGIC_SEND[]; //Magic number reply to Teensy verifying this is an LED driver 
    static void init(); //Initialize reference variables  
    static void onPacketReceived(const uint8_t* buffer, size_t size); //Function is called if a valid COBS packet is ready
    static void magicExchange(const uint8_t* buffer, size_t size); //Check received magic number, and if valid send magic reply
    static void sendConfiguration(const uint8_t* buffer, size_t size);
    static void recvConfiguration(const uint8_t* buffer, size_t size);
    
};
   
#endif
