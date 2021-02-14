#include "Arduino.h"
#include "SDcard.h"
#include "SD.h"
#include "TimeLib.h"

Sd2Card card;
SdVolume volume;
SdFile root;
File f;

static char SDcard::message_buffer[256]; //Temporary buffer for preparing packets immediately before transmission
static int SDcard::message_size; //Size of temporary packet to transmit
const static char SDcard::seq_bin_dir[] = "seq_bin"; //Directory to save boot log files into - max length 8 char
const static char SDcard::seq_files[][13] = {"dig_high.bin", "dig_low.bin", "con_img.bin", "con_fly.bin"};

SDcard::SDcard()
{
//  float a = sync2.MIRROR_PERIOD;
  
}

static void SDcard::init(){
  
}

// call back for file timestamps - from: https://forum.arduino.cc/index.php?topic=348562.0
static void dateTime(uint16_t* date, uint16_t* time) {
  time_t unix_t = now();
  // return date using FAT_DATE macro to format fields
  *date = FAT_DATE(year(unix_t), month(unix_t), day(unix_t));
  // return time using FAT_TIME macro to format fields
  *time = FAT_TIME(hour(unix_t), minute(unix_t), second(unix_t));
}

static boolean SDcard::initializeSD(){
  message_size = 0;
  // set date time callback function for applying RTC synced time stamps to SD card file time stamps
  SdFile::dateTimeCallback(dateTime);

  //Test SD card
  //////////////////////CARD MISSING///////////////////////////
  if (!card.init(SPI_HALF_SPEED, chipSelect)) { //Check if SD card is present
    message_size = sprintf(message_buffer, "-Warning: SD card not found. Sequence files will not be permanently saved to the LED driver, and will be lost on reboot.");
    return false;
  }
  /////////////////INVALID PARTITION/////////////////////////////////////
  if (!volume.init(card)) { //Check that there is a FAT32 partition
    message_size = sprintf(message_buffer, "-Warning: SD card is not FAT32 formatted. Sequence files will not be permanently saved to the LED driver, and will be lost on reboot..");
    return false;
  }

  /////////////////CREATE DIRECTORIES IF NECESSARY/////////////////////////////////////
  //Create directories for saving log files and boot info
  if(!SD.exists(seq_bin_dir)){ //Don't run begin again if it has already been run - known bug in SD.h library: https://arduino.stackexchange.com/questions/3850/sd-begin-fails-second-time
    if(!SD.begin(chipSelect)){
      message_size = sprintf(message_buffer, "-Warning: SD initialization failed. Sequence files will not be permanently saved to the LED driver, and will be lost on reboot.");
      return;
    }
    if(!SD.exists(seq_bin_dir)){ 
      if(!SD.mkdir(seq_bin_dir)){
        message_size = sprintf(message_buffer, "-Warning: Could not access directory on SD card. Sequence files will not be permanently saved to the LED driver, and will be lost on reboot.");
        return false;
      }
    }
  }

  return message_size == 0;
}

//Save data to the SD card
static bool SDcard::saveToSD(char *data_array, uint32_t start_index, uint32_t end_index, char (*file_name), char (*file_dir) = seq_bin_dir, boolean force_write = true){
  uint32_t log_size = end_index-start_index;
  message_size = sprintf(message_buffer, "%s/%s", file_dir, file_name);
  if(force_write || log_size >= 512){ 
    if(SD.exists(seq_bin_dir)){ //Make sure that the save directories exist before trying to save to it - without this check open() will lock without SD card  
      //Open file
      f = SD.open(message_buffer, FILE_WRITE);
      if(f){
        while(log_size >= 512){ //Retrieve a blocks of 512 bytes
          f.write((data_array + start_index), 512);
          start_index += 512;
          log_size = end_index-start_index; //Update remaining log size
        }
        if(force_write){ //Print remainder of data buffer if force_write is enabled
          f.write((data_array + start_index), log_size);
          start_index += log_size;                       
        }
        f.close(); //File timestamp applied on close (save)
        message_size = 0;
      }
    }
    else{
      //////////////ACTION TO TAKE IF SD IS NO LONGER PRESENT
      message_size = sprintf(message_buffer, "-Warning: Could not save file to SD card. Sequence files will not be permanently saved to the LED driver, and will be lost on reboot.");
    }
  }
  return bool(!message_size);
}

//Read data from the SD card
static boolean SDcard::readFromSD(char *data_array, uint32_t start_index, uint32_t end_index, char (*file_name), char (*file_dir) = seq_bin_dir, boolean force_read = true){
  uint32_t log_size = end_index-start_index;
  message_size = sprintf(message_buffer, "%s/%s", file_dir, file_name);
  if(force_read || log_size >= 512){ 
    if(SD.exists(seq_bin_dir)){ //Make sure that the save directories exist before trying to save to it - without this check open() will lock without SD card  
      //Open file
      f = SD.open(message_buffer, FILE_READ);
      if(f){
        while(log_size >= 512){ //Retrieve a blocks of 512 bytes
          f.readBytes((data_array + start_index), 512);
          start_index += 512;
          log_size = end_index-start_index; //Update remaining log size
        }
        if(force_read){ //Print remainder of data buffer if force_write is enabled
          f.readBytes((data_array + start_index), log_size);
          start_index += log_size;                       
        }
        f.close(); //File timestamp applied on close (save)
        message_size = 0;
      }
    }
    else{
      //////////////ACTION TO TAKE IF SD IS NO LONGER PRESENT
      message_size = sprintf(message_buffer, "-Warning: Could not read file on SD card. Sequence file \"%s\" was not loaded.", file_name);
      return;
    }
  }
  return bool(!message_size);
}

// call back for file timestamps - from: https://forum.arduino.cc/index.php?topic=348562.0
static void SDcard::dateTime(uint16_t* date, uint16_t* time) {
 time_t unix_t = now();
 // return date using FAT_DATE macro to format fields
 *date = FAT_DATE(year(unix_t), month(unix_t), day(unix_t));
 // return time using FAT_TIME macro to format fields
 *time = FAT_TIME(hour(unix_t), minute(unix_t), second(unix_t));
}
