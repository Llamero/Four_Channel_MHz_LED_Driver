#include "Arduino.h"
#include "SDcard.h"
#include "SD.h"
#include "TimeLib.h"

Sd2Card card;
SdVolume volume;
SdFile root;
File f;

char SDcard::message_buffer[256]; //Temporary buffer for preparing packets immediately before transmission
size_t SDcard::message_size; //Size of temporary packet to transmit
size_t SDcard::file_size; //Size of file on SD card
const char SDcard::seq_bin_dir[] = "seq_bin"; //Directory to save boot log files into - max length 8 char
const char SDcard::seq_files[][13] = {"dig_low.bin", "dig_high.bin", "con_stby.bin", "con_scan.bin"};

SDcard::SDcard()
{
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

boolean SDcard::initializeSD(){
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
      return false;
    }
    if(!SD.exists(seq_bin_dir)){ 
      if(!SD.mkdir(seq_bin_dir)){
        message_size = sprintf(message_buffer, "-Warning: Could not access directory on SD card. Sequence files will not be permanently saved to the LED driver, and will be lost on reboot.");
        return false;
      }
    }
  }
  /////////////////CREATE EMPTY SEQ FILES IF NECESSARY///////////////////////////
  for(int a = 0; a<N_SEQ_FILES; a++){
    sprintf(message_buffer, "%s/%s", seq_bin_dir, seq_files[a]); //Path to file
    if(!SD.exists(message_buffer)){ //If file doesn't exist, create an empty file
      f = SD.open(message_buffer, FILE_WRITE);
      f.close();
    }
  }
  return message_size == 0;
}

//Save data to the SD card
bool SDcard::saveToSD(char *data_array, uint32_t start_index, uint32_t end_index, const char (*file_name), const char (*file_dir), boolean force_write){
  file_size = 0;
  if(end_index > start_index && end_index != (uint32_t) -1) file_size = end_index-start_index; //If buffer is not empty calcualte log size
  sprintf(message_buffer, "%s/%s", file_dir, file_name); //Path to file to save
   
  if(force_write || file_size >= 512){ 
    if(SD.exists(file_dir)){ //Make sure that the save directories exist before trying to save to it - without this check open() will lock without SD card  
      //Open file
      SD.remove(message_buffer); //Delete file to ensure clean sequence write
      f = SD.open(message_buffer, FILE_WRITE); //Overwrite existing file if exists https://pubs.opengroup.org/onlinepubs/7908799/xsh/open.html
      if(f){
        if(file_size){ //Write file if there is data to write
          while(file_size >= 512){ //Retrieve a blocks of 512 bytes
            f.write((data_array + start_index), 512);
            start_index += 512;
            file_size = end_index-start_index; //Update remaining log size
          }
          if(force_write){ //Print remainder of data buffer if force_write is enabled
            f.write((data_array + start_index), file_size);
            start_index += file_size;                       
          }
        }
        f.close(); //File timestamp applied on close (save)
        message_size = 0;
      }
      else message_size = sprintf(message_buffer, "-Warning: Could not save file to SD card. Sequence files will not be permanently saved to the LED driver, and will be lost on reboot.");
    }
    else message_size = sprintf(message_buffer, "-Warning: Could not find SD card. Sequence files will not be permanently saved to the LED driver, and will be lost on reboot.");
  }
  return bool(!message_size);
}

//Read data from the SD card
boolean SDcard::readFromSD(char *data_array, uint32_t start_index, uint32_t end_index, const char (*file_name), const char (*file_dir), boolean force_read){
  file_size = 0;
  if(end_index > start_index && end_index != (uint32_t) -1) file_size = end_index-start_index; //If buffer is not empty calcualte log size
  sprintf(message_buffer, "%s/%s", file_dir, file_name); //Path to file to save
  
  if(force_read || file_size >= 512){ 
    if(SD.exists(seq_bin_dir)){ //Make sure that the save directories exist before trying to save to it - without this check open() will lock without SD card  
      //Open file
      f = SD.open(message_buffer, FILE_READ);
      if(f){
        if(file_size == 0){
          file_size = f.size(); //Get the size of the file being read if one wasn't specified
          end_index = file_size;
        }
        while(file_size >= 512){ //Retrieve a blocks of 512 bytes
          f.readBytes((data_array + start_index), 512);
          start_index += 512;
          file_size = end_index-start_index; //Update remaining log size
        }
        if(force_read){ //Print remainder of data buffer if force_write is enabled
          f.readBytes((data_array + start_index), file_size);
          start_index += file_size;                       
        }
        file_size = end_index;
        f.close(); //File timestamp applied on close (save)
        message_size = 0;
      }
      else message_size = sprintf(message_buffer, "-Warning: Could not read file on SD card. Sequence file \"%s\" was not loaded.", file_name);
    }
    else message_size = sprintf(message_buffer, "-Warning: Could not find SD card. Please check SD card and restart Teensy.");
  }
  return bool(!message_size);
}

// call back for file timestamps - from: https://forum.arduino.cc/index.php?topic=348562.0
void SDcard::dateTime(uint16_t* date, uint16_t* time) {
 time_t unix_t = now();
 // return date using FAT_DATE macro to format fields
 *date = FAT_DATE(year(unix_t), month(unix_t), day(unix_t));
 // return time using FAT_TIME macro to format fields
 *time = FAT_TIME(hour(unix_t), minute(unix_t), second(unix_t));
}

//Delete all files and folders on SD card
boolean SDcard::clearSdCard(){
    File root = SD.open("/");
    if(clearFileTree(root)) return true;
    return false;
}

boolean SDcard::clearFileTree(File dir) {
   while(true) {
     File entry = dir.openNextFile();
     sprintf(message_buffer, "%s/%s", dir.name(), entry.name());
     Serial.println(message_buffer);
     if (! entry) break;
     if (entry.isDirectory()) {
       clearFileTree(entry);
       if(!SD.remove(message_buffer)) return false;
     } 
     else if(!SD.remove(message_buffer)) return false;
     entry.close();
   }
   return true;
}



//Functions below are for debugging purposes - from SD "list files" example

void SDcard::getFileList(){
    while(!Serial);
    File root = SD.open("/");
    printDirectory(root, 0);
}

void SDcard::printDirectory(File dir, int numSpaces) {
   while(true) {
     File entry = dir.openNextFile();
     if (! entry) {
       //Serial.println("** no more files **");
       break;
     }
     printSpaces(numSpaces);
     Serial.print(entry.name());
     if (entry.isDirectory()) {
       Serial.println("/");
       printDirectory(entry, numSpaces+2);
     } else {
       // files have sizes, directories do not
       int n = log10f(entry.size());
       if (n < 0) n = 10;
       if (n > 10) n = 10;
       printSpaces(50 - numSpaces - strlen(entry.name()) - n);
       Serial.print("  ");
       Serial.print(entry.size(), DEC);
       DateTimeFields datetime;
       if (entry.getModifyTime(datetime)) {
         printSpaces(4);
         printTime(datetime);
       }
       Serial.println();
     }
     entry.close();
   }
}

void SDcard::printSpaces(int num) {
  for (int i=0; i < num; i++) {
    Serial.print(" ");
  }
}

void SDcard::printTime(const DateTimeFields tm) {
  const char *months[12] = {
    "January","February","March","April","May","June",
    "July","August","September","October","November","December"
  };
  if (tm.hour < 10) Serial.print('0');
  Serial.print(tm.hour);
  Serial.print(':');
  if (tm.min < 10) Serial.print('0');
  Serial.print(tm.min);
  Serial.print("  ");
  Serial.print(tm.mon < 12 ? months[tm.mon] : "???");
  Serial.print(" ");
  Serial.print(tm.mday);
  Serial.print(", ");
  Serial.print(tm.year + 1900);
}
