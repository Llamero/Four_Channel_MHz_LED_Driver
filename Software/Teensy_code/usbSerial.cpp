/*
  Default configuration of teensy pins
*/

#include "Arduino.h"
#include "usbSerial.h"
#include "PacketSerial.h"

//NOTE: It seems that in this compiler lists longer than 4 need to be built in CPP while shorter lists need to be built in header with constexpr
static char usbSerial::MAGIC_SEND[] = "-kvlWfsBplgasrsh3un5K";
const static char usbSerial::MAGIC_RECEIVE[] = "kc1oISEIZ60AYJqH4J1P";

PacketSerial_<COBS, 0, 512> usb; //Sets Encoder, framing character, buffer size

usbSerial::usbSerial()
{
}

static void usbSerial::init(){
}

static void usbSerial::startSerial(){
  usb.begin(115200);
  usb.setPacketHandler(&onPacketReceived);
}

static void usbSerial::checkBuffer(){
  digitalWriteFast(LED_BUILTIN, HIGH);
  usb.update();
  delay(20);
  digitalWriteFast(LED_BUILTIN, LOW);
  delay(20);
}

static void usbSerial::onPacketReceived(const uint8_t* buffer, size_t size){
  digitalWriteFast(LED_BUILTIN, HIGH);
  
  // Route decoded packet based on prefix byte
  uint8_t prefix = buffer[0];
  if (prefix == 0){
    magicExchange(buffer, size);
  }
  else if(prefix == 1){
    if(size == 1){
      char DRIVER_ID[] = "-Hello World for REALZ!";
      DRIVER_ID[0] = 1;
      usb.send(DRIVER_ID, sizeof(DRIVER_ID));
    }
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
