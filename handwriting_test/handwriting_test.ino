
#include "Adafruit_Thermal.h"
#include "handwriting.h"
#include "SoftwareSerial.h"

#define TX_PIN 6 // Arduino transmit labeled RX on printer
#define RX_PIN 5 // Arduino receive labeled TX on printer

SoftwareSerial mySerial(RX_PIN, TX_PIN); // Declare SoftwareSerial obj first
Adafruit_Thermal printer(&mySerial);     // Pass addr to printer constructo



void setup() {

  mySerial.begin(9600);  // Initialize SoftwareSerial
  printer.begin();        // Init printer (same regardless of serial type)

  // Print the 75x75 pixel logo in adalogo.h:
  printer.printBitmap(handwriting_width, handwriting_height, handwriting_data);

  printer.feed(2);

  printer.sleep();      // Tell printer to sleep
  delay(3000L);         // Sleep for 3 seconds
  printer.wake();       // MUST wake() before printing again, even if reset
  printer.setDefault(); // Restore printer to defaults
}



void loop() {
}
