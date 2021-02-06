/*
  Default configuration of teensy pins
*/

#include "Arduino.h"
#include "usbSerial.h"
#include "PacketSerial.h"
#include "SDcard.h"

//NOTE: It seems that in this compiler lists longer than 4 need to be built in CPP while shorter lists need to be built in header with constexpr
static char usbSerial::MAGIC_SEND[] = "-kvlWfsBplgasrsh3un5K"; //Magic number reply to Teensy verifying this is an LED driver 
const static char usbSerial::MAGIC_RECEIVE[] = "kc1oISEIZ60AYJqH4J1P"; //Magic number received from Teensy verifying it is an LED driver "-" is for providing byte prefix in serial message
static boolean usbSerial::sd_available = false;

PacketSerial_<COBS, 0, 4096> usb; //Sets Encoder, framing character, buffer size
SDcard SDcard;

usbSerial::usbSerial()
{
}

static void usbSerial::init(){
}

static void usbSerial::startSerial(){
  usb.begin(115200);
  usb.setPacketHandler(&onPacketReceived);
  sd_available = SDcard.inititializeSD();
}

static void usbSerial::checkBuffer(){
  usb.update();
}

static void usbSerial::onPacketReceived(const uint8_t* buffer, size_t size){
  // Route decoded packet based on prefix byte
  uint8_t prefix = buffer[0];
  switch (prefix){
    case 0:
      magicExchange(buffer, size);
      break;
    case 1:
      sendConfiguration(buffer, size);
      break;
    case 2:
      recvConfiguration(buffer, size);
  }
}

static void usbSerial::magicExchange(const uint8_t* buffer, size_t size){
  int a;
  if(size == sizeof(MAGIC_RECEIVE)){
    for(a=0; a<size; a++){
      if(buffer[a+1] != MAGIC_RECEIVE[a]){
        break;
      }
    }
    if(a==size-1){
      MAGIC_SEND[0] = buffer[0];
      usb.send(MAGIC_SEND, size);
    }
  }
}

static void usbSerial::sendConfiguration(const uint8_t* buffer, size_t size){
    
    if(size == 1){
      char DRIVER_ID[] = "-Hello World for REALZ!";
      DRIVER_ID[0] = 1;
      usb.send(DRIVER_ID, sizeof(DRIVER_ID));
    }
}

static void usbSerial::recvConfiguration(const uint8_t* buffer, size_t size){
  
}
