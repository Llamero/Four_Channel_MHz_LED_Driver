/*
  Different sync configurations for controlling the LED output
*/
#ifndef SDcard_h
#define SDcard_h

#include "Arduino.h"
#include "SDcard.h"
#include "SD.h"
#include "TimeLib.h"

class SDcard
{
  public:
    SDcard();
    static boolean initializeSD();
    static bool saveToSD(char *data_array, uint32_t start_index, uint32_t end_index, char (*file_name), char (*file_dir) = seq_bin_dir, boolean force_write = true);
    static boolean readFromSD(char *data_array, uint32_t start_index, uint32_t end_index, char (*file_name), char (*file_dir) = seq_bin_dir, boolean force_write = true);
    static char message_buffer[256]; //Temporary buffer for preparing packets immediately before transmission
    static int message_size; //Size of temporary packet to transmit
    const static char seq_bin_dir[]; //Directory to save boot log files into - max length 8 char
    
  private:
    const static int chipSelect = BUILTIN_SDCARD;
    static void dateTime(uint16_t* date, uint16_t* time); 
    static void init();
};

#endif
