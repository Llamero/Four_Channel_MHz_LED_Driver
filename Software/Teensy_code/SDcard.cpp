#include "Arduino.h"
#include "syncMode.h"
#include "SDcard.h"
#include "SD.h"
#include "TimeLib.h"

//Setup SD card
const int chipSelect = BUILTIN_SDCARD;
boolean boot_file_saved = false; //Whether the boot log has been saved to the SD card

const static char SDcard::seq_bin_dir[] = "seq_bin"; //Directory to save boot log files into - max length 8 char
const static char SDcard::seq_txt_dir[] = "seq_txt"; //Directory to save data log files into - max length 8 char
const static char SDcard::config_txt_dir[] = "config"; //Directory to save boot log files into - max length 8 char
const static char SDcard::waveform_dir[] = "waveform"; //Directory to save recorded LED waveforms
char boot_text[10][20]; //Initialize array for storing boot information
int boot_index = 0; //current index in the boot log


Sd2Card card;
SdVolume volume;
SdFile root;
File f;
syncMode sync2;

SDcard::SDcard()
{
//  float a = sync2.MIRROR_PERIOD;
  
}

void SDcard::init(){
  
}

// call back for file timestamps - from: https://forum.arduino.cc/index.php?topic=348562.0
void dateTime(uint16_t* date, uint16_t* time) {
  time_t unix_t = now();
  // return date using FAT_DATE macro to format fields
  *date = FAT_DATE(year(unix_t), month(unix_t), day(unix_t));
  // return time using FAT_TIME macro to format fields
  *time = FAT_TIME(hour(unix_t), minute(unix_t), second(unix_t));
}

void SDcard::inititializeSD(){
  // set date time callback function for applying RTC synced time stamps to SD card file time stamps
  SdFile::dateTimeCallback(dateTime);

  //Test SD card
  if (card.init(SPI_HALF_SPEED, chipSelect)) { //Check if SD card is present
    strcpy(boot_text[boot_index++], "SD card found       ");
  }
  else{
//////////////////////CARD MISSING///////////////////////////    
    strcpy(boot_text[boot_index++], "SD card not found!  ");
    warning_count += 1;
  }
  
  if (volume.init(card)) { //Check that there is a FAT32 partition
/////////////////VALID PARTITION TYPE/////////////////////////////////////
    int partition = volume.fatType();
/////////////////VOLUME SIZE/////////////////////////////////////
    float volumesize;
    sprintf(boot_text[boot_index++], "FAT%2d volume found  ", partition);
    volumesize = volume.blocksPerCluster();    // clusters are collections of blocks
    volumesize *= volume.clusterCount();       // we'll have a lot of clusters
    volumesize /= 2;
    if(volumesize >= 1e3){ //If volume is more than 1MB in size - report size as MB
      volumesize /= 1000;
      if(volumesize >= 1e3){ //If volume is more than 1GB in size - report size as GB
        volumesize /= 1000;
        if(volumesize >= 1e3){ //If volume is more than 1TB in size - report size as TB
          volumesize /= 1000;
          sprintf(boot_text[boot_index++], "Size: % 8.4fTB    ", volumesize); 
        }
        else sprintf(boot_text[boot_index++], "Size: % 8.4fGB    ", volumesize); 
      }
      else sprintf(boot_text[boot_index++], "Size: % 8.4fMB    ", volumesize); 
    }
    else sprintf(boot_text[boot_index++], "Size: % 8.4fkB    ", volumesize);
  }
  else{
/////////////////INVALID PARTITION/////////////////////////////////////
    strcpy(boot_text[boot_index++], "No FAT16/32 volume! ");
    warning_count += 1;
  }

/////////////////CREATE DIRECTORIES IF NECESSARY/////////////////////////////////////
  //Create directories for saving log files and boot info
  if(!SD.exists(seq_bin_dir)){ //Don't run begin again if it has already been run - known bug in SD.h library: https://arduino.stackexchange.com/questions/3850/sd-begin-fails-second-time
    if(!SD.begin(chipSelect)){
      strcpy(boot_text[boot_index++], "SD initialize failed");
      warning_count += 1;
    }
    int a = 4;
    while(a--){
      char dir[8];
      if(a==3) char dir = seq_bin_dir;
      else if(a==2) char dir = seq_txt_dir;
      else if(a==1) char dir = config_txt_dir;
      else if(a==0) char dir = waveform_dir;
      else char dir[] = {0,0,0,0,0,0,0,0};
  
      if(!SD.exists(dir)){ 
        if(!SD.mkdir(dir)){
          strcpy(boot_text[boot_index++], "SD.mkdir() failed!  ");
          warning_count += 1;
        }
      }
   }
  }
  
//  //Search for the most recent log file and increment log_file_count to next file ID
//  if(SD.exists(log_dir)){
//    for(log_file_count = 0; log_file_count < max_log_file-1; log_file_count++){
//      sprintf(current_log_file_path, "%s/%02d%02d%02d%c%c.csv", log_dir, year(unix_t)-2000, month(unix_t), day(unix_t), (log_file_count/26)+97, (log_file_count%26)+97);     
//      if(!SD.exists(current_log_file_path)) break;
//    }
//    sprintf(current_boot_file_path, "%s/%02d%02d%02d%c%c.txt", boot_dir, year(unix_t)-2000, month(unix_t), day(unix_t), (log_file_count/26)+97, (log_file_count%26)+97); 
//  }
 
  //Report number of warning encountered
  if(warning_count){
    sprintf(boot_text[boot_index++], "% 2d Warnings on boot!", warning_count);
  }
  else{
    strcpy(boot_text[boot_index++], "Success! 0 Warnings ");
  }
  
  //Save current boot log
  for(int a = 0; a<boot_index; a++){
    boot_text[a][19] = '\n'; //Replace all nulls with new lines for *.txt formatting
  }
//  if(saveToSD(current_boot_file_path, (char *) boot_text, 0, boot_index*LCD_dim_x, true) != boot_index*LCD_dim_x){
//    strcpy(boot_text[boot_index++], "Boot save FAIL!     ");
//  }
  for(int a = 0; a<boot_index; a++){
    boot_text[a][19] = 0; //Replace all new lines with nulls for println() formatting
  }
}

//Save data to the SD card
uint32_t SDcard::saveToSD(char (*file_path), char *data_array, uint32_t start_index, uint32_t end_index, boolean force_write){
  uint32_t log_size = end_index-start_index;
  
  if(force_write || log_size >= 512){ 
    if(SD.exists(seq_bin_dir)){ //Make sure that the save directories exist before trying to save to it - without this check open() will lock without SD card  

      //Open file
      f = SD.open(file_path, FILE_WRITE);
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
      }
    }
    else{
      //////////////ACTION TO TAKE IF SD IS NO LONGER PRESENT
    }
  }
  return start_index;
}

//Save data to the SD card
uint32_t SDcard::readFromSD(char (*file_path), char *data_array, uint32_t start_index, uint32_t end_index, boolean force_read){
  uint32_t log_size = end_index-start_index;
  
  if(force_read || log_size >= 512){ 
    if(SD.exists(seq_bin_dir)){ //Make sure that the save directories exist before trying to save to it - without this check open() will lock without SD card  

      //Open file
      f = SD.open(file_path, FILE_WRITE);
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
      }
    }
    else{
      //////////////ACTION TO TAKE IF SD IS NO LONGER PRESENT
    }
  }
  return start_index;
}
