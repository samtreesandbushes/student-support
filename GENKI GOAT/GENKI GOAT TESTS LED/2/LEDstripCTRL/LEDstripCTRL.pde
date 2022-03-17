//LED Blink using processing.
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
int redPin = 3;           // the PWM pin the LED is attached to
int greenPin = 5;           // the PWM pin the LED is attached to
int bluePin = 6;           // the PWM pin the LED is attached to

int brightness = 0;    // how bright the LED is
int fadeAmount = 5;    // how many points to fade the LED by


void setup()
{
  //print the available serial ports.
  printArray(Serial.list());
  //Select port from the listed array.
  //replace [0] to [1],[2]...for selecting a usable open port.
  arduino = new Arduino(this,Serial.list()[11], 57600);
  arduino.pinMode(bluePin, Arduino.OUTPUT);
  arduino.pinMode(redPin, Arduino.OUTPUT);
  arduino.pinMode(greenPin, Arduino.OUTPUT);

}

void draw()
{
  arduino.analogWrite(redPin, 120);
  arduino.analogWrite(greenPin, 10);
  arduino.analogWrite(bluePin, 23);
  
  delay(2000);
    arduino.analogWrite(redPin, 10);
  arduino.analogWrite(greenPin, 120);
  arduino.analogWrite(bluePin, 10);
  
    delay(2000);

      arduino.analogWrite(redPin, 10);
  arduino.analogWrite(greenPin, 10);
  arduino.analogWrite(bluePin, 120);
  
     delay(1000);
 
      arduino.analogWrite(redPin, 0);
  arduino.analogWrite(greenPin, 0);
  arduino.analogWrite(bluePin, 0);
  
     delay(1000);
 
      arduino.analogWrite(redPin, 255);
  arduino.analogWrite(greenPin, 255);
  arduino.analogWrite(bluePin, 255);
    
    // change the brightness for next time through the loop:
  brightness = brightness + fadeAmount;

  // reverse the direction of the fading at the ends of the fade:
  if (brightness <= 0 || brightness >= 255) {
    fadeAmount = -fadeAmount;
  }
  // wait for 30 milliseconds to see the dimming effect
  delay(20);
}
