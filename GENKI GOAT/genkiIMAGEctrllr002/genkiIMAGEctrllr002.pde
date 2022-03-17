import themidibus.*; //Import the library

MidiBus myBus; // The MidiBus

PImage imgA;  // Declare variable "a" of type PImage
PImage imgB;  // Declare variable "a" of type PImage

float filter = 0;
  float lerp = 0.95; //must be between 0-1

void setup() {
  size(400, 400);
  background(255);

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.

  // Either you can
  //                   Parent In Out
  //                     |    |  |
  myBus = new MidiBus(this, 0, 1); // Create a new MidiBus using the device index to select the Midi input and output devices respectively.

  // or you can ...
  //                   Parent         In                   Out
  //                     |            |                     |
  //myBus = new MidiBus(this, "IncomingDeviceName", "OutgoingDeviceName"); // Create a new MidiBus using the device names to select the Midi input and output devices respectively.

  // or for testing you could ...
  //                 Parent  In        Out
  //                   |     |          |
  //myBus = new MidiBus(this, -1, "Java Sound Synthesizer"); // Create a new MidiBus with no input device and the default Java Sound Synthesizer as the output device.

  imgA = loadImage("a.jpg");  // Load the image into the program  
  imgB = loadImage("b.jpg");  // Load the image into the program 
}

void draw() {
  

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
  println("Note On:");
  println("--------");
  println("Channel:"+note.channel());
  println("Pitch:"+note.pitch());
  println("Velocity:"+note.velocity());
}

void noteOff(Note note) {
  // Receive a noteOff
  println();
  println("Note Off:");
  println("--------");
  println("Channel:"+note.channel());
  println("Pitch:"+note.pitch());
  println("Velocity:"+note.velocity());
}

void controllerChange(ControlChange change) {
    
  // Receive a controllerChange
  println();
  println("Controller Change:");
  println("--------");
  println("Channel:"+change.channel());
  println("Number:"+change.number());
  println("Value:"+change.value());
  
  int dooby = change.number();
  if ( dooby == 18) {
    
     println("Value of 18:"+change.value());
     filter = lerp * filter + (1.0-lerp) * change.value();
     println("Filtered Value:"+ filter);

    if (filter <= 55){
        image(imgA, 0, 0);
    }
    else if (filter >= 60) {
        image(imgB, 0, 0, imgB.width/2, imgB.height/2);
    }
    
  }
  



}

void delay(int time) {
  int current = millis();
  while (millis () < current+time) Thread.yield();
}
