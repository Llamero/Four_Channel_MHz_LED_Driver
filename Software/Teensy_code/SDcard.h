/*
  Different sync configurations for controlling the LED output
*/
#ifndef SDcard_h
#define SDcard_h

#include "Arduino.h"

class SDcard
{
  public:
    SDcard();
    void inititializeSD();
    uint32_t saveToSD(char (*file_path), char *data_array, uint32_t start_index, uint32_t end_index, boolean force_write);
    uint32_t readFromSD(char (*file_path), char *data_array, uint32_t start_index, uint32_t end_index, boolean force_read);
    int warning_count;
    const static char seq_bin_dir[];
    const static char seq_txt_dir[];
    const static char config_txt_dir[];
    const static char waveform_dir[];
    static char boot_text[10][20]; //Initialize array for storing boot information
    
  private:
    void init();
};

#endif
