//LED Blink using processing.
import processing.serial.*;
import cc.arduino.*;
import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

Arduino arduino;

float filter = 0;
float lerp = 0.95; //must be between 0-1

int ledPin = 13;           // the PWM pin the LED is attached to

int brightness = 0;    // how bright the LED is
int fadeAmount = 5;    // how many points to fade the LED by


void setup()
{
    size(400, 400);
  background(255);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  myBus = new MidiBus(this, 0, 1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.

  
  //print the available serial ports.
  printArray(Serial.list());
  //Select port from the listed array.
  //replace [0] to [1],[2]...for selecting a usable open port.
  arduino = new Arduino(this,Serial.list()[11], 57600);
  arduino.pinMode(ledPin, Arduino.OUTPUT);


}

void draw()
{
  
  
  

  int channel = 0;
  int pitch = 64;
  int velocity = 127;
  Note note = new Note(channel, pitch, velocity);

  myBus.sendNoteOn(note); // Send a Midi noteOn
  delay(200);
  myBus.sendNoteOff(note); // Send a Midi nodeOff

  int number = 0;
  int value = 90;
  ControlChange change = new ControlChange(channel, number, velocity);

  myBus.sendControllerChange(change); // Send a controllerChange
  delay(10);
}


void noteOn(Note note) {
  
  // Receive a noteOn
  println();
  /*
  println("Note On:");
  println("--------");
  println("Channel:"+note.channel());
  println("Pitch:"+note.pitch());
  println("Velocity:"+note.velocity());
  */
}

void noteOff(Note note) {
  // Receive a noteOff
  
  println();
  /*
  println("Note Off:");
  println("--------");
  println("Channel:"+note.channel());
  println("Pitch:"+note.pitch());
  println("Velocity:"+note.velocity());
  */
}

void controllerChange(ControlChange change) {
    /*
    // Receive a controllerChange
    println();
    println("Controller Change:");
    println("--------");
    println("Channel:"+change.channel());
    println("Number:"+change.number());
    println("Value:"+change.value());
    */
    
    
    int dooby = change.number();
    
    
    
    if ( dooby == 18) {
      
        background(change.value());
        
        arduino.digitalWrite(ledPin, 0);
        delay(2000);
        arduino.digitalWrite(ledPin, 255);
        delay(2000);

      /*
      arduino.analogWrite(greenPin, brightness);
          
      // reverse the direction of the fading at the ends of the fade:
      if (brightness <= 0 || brightness >= 120) {
        fadeAmount = -fadeAmount;
      }
      
      
      arduino.analogWrite(bluePin, brightness);
      
          
      // reverse the direction of the fading at the ends of the fade:
      if (brightness <= 0 || brightness >= 120) {
        fadeAmount = -fadeAmount;
      }
      */
      
      
      
      
      // wait for 30 milliseconds to see the dimming effect
      delay(20);
    /*
     println("Value of 18:"+change.value());
     filter = lerp * filter + (1.0-lerp) * change.value();
     println("Filtered Value:"+ filter);

    if (filter <= 55){
        image(imgA, 0, 0);
    }
    else if (filter >= 60) {
        image(imgB, 0, 0, imgB.width/2, imgB.height/2);
    }
    */
  }
  
  else {
        arduino.digitalWrite(ledPin, 0);
  }
  
}
  

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
  
 
