
#include <Servo.h>

Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards

int pos = 0;    // variable to store the servo position

int pwm_a = 3;  //PWM control for motor outputs 1 and 2 
int dir_a = 2;  //direction control for motor outputs 1 and 2 





void setup() {
  pinMode(pwm_a, OUTPUT);  //Set control pins to be outputs
  pinMode(dir_a, OUTPUT);
  
  analogWrite(pwm_a, 100);  //set both motors to run at (100/255 = 39)% duty cycle (slow)

  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
}





void loop() {


  for (int i = 0; i < 255; i++) {    
    
    analogWrite(pwm_a, i);

    pos = map(i, 0, 255, 0, 90);
    constrain(pos, 0, 90);
    
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
   
    // going up speed
    delay(40);
    
  }

  delay(5000);

  analogWrite(pwm_a, 0);
  
  myservo.write(0);              // tell servo to go to position in variable 'pos'
   
  delay(5000);
  
}
