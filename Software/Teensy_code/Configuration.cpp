/*
  Default configuration of teensy pins
*/

#include "Arduino.h"
#include "Configuration.h"

static uint16_t pushbutton_intensity = 65535; //LED intensity in PWM units
static uint16_t pushbutton_mode = 0; //LED illumination mode when alarm is active

Configuration::Configuration()
{
}

static void Configuration::init(){
}
