
// New code for pond dipping sensor by Francisco




#include <Wire.h>
#include <Adafruit_MotorShield.h>

// Create the motor shield object with the default I2C address
Adafruit_MotorShield AFMS = Adafruit_MotorShield(); 
// Or, create it with a different I2C address (say for stacking)
// Adafruit_MotorShield AFMS = Adafruit_MotorShield(0x61); 

// Select which 'port' M1, M2, M3 or M4. In this case, M1
Adafruit_DCMotor *myMotor = AFMS.getMotor(1);
// You can also make another motor on port M2
//Adafruit_DCMotor *myOtherMotor = AFMS.getMotor(2);





void setup() {
  Serial.begin(9600);           // set up Serial library at 9600 bps
  Serial.println("Adafruit Motorshield v2 - DC Motor test!");

  AFMS.begin();  // create with the default frequency 1.6KHz
  //AFMS.begin(1000);  // OR with a different frequency, say 1KHz
  
  // Set the speed to start, from 0 (off) to 255 (max speed)
  myMotor->setSpeed(150);
  myMotor->run(FORWARD);
  // turn on motor
  myMotor->run(RELEASE);
}





void loop() {

  // read the input on analog pin 0:
  int sensorValue = analogRead(A0);
  
  // print out the value you read:
  Serial.println(sensorValue);
  delay(1);        // delay in between reads for stability

  // make the motor run clockwise
  myMotor->run(FORWARD);

  // if the sensor is in the water, set the motor to full speed
  if (sensorValue > 100) {
     myMotor->setSpeed(170); 
     // wait at least 5 seconds after turning on
  }

  // wait at least 1 second after sensor is out of the water
  delay(100);

  // turn motor off
  myMotor->setSpeed(0);



  /*Serial.print("tech");
  myMotor->run(RELEASE);
  delay(1000);
  */
}
