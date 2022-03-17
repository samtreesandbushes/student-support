/* Sweep
 by BARRAGAN <http://barraganstudio.com>
 This example code is in the public domain.

 modified 8 Nov 2013
 by Scott Fitzgerald
 http://www.arduino.cc/en/Tutorial/Sweep
*/

#include <Servo.h>

Servo myservo;  // create servo object to control a servo
// twelve servo objects can be created on most boards

int pos = 0;    // variable to store the servo position

int t = 0;

void setup() {
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
}

void loop() {


    // Mr
    myservo.write(30);              // tell servo to go to position in variable 'pos'
    delay(570);                       // waits 15ms for the servo to reach the position

   // Sand
   myservo.write(0);              // tell servo to go to position in variable 'pos'
    delay(630);                       // waits 15ms for the servo to reach the position

    // Man
    myservo.write(30);              // tell servo to go to position in variable 'pos'
    delay(321);                       // waits 15ms for the servo to reach the position

   // Sand
   myservo.write(0);              // tell servo to go to position in variable 'pos'
    delay(84);                       // waits 15ms for the servo to reach the position

    // Mr
    myservo.write(30);              // tell servo to go to position in variable 'pos'
    delay(2186);                       // waits 15ms for the servo to reach the position

   // Sand
   myservo.write(0);              // tell servo to go to position in variable 'pos'
    delay(27);                       // waits 15ms for the servo to reach the position

    // Mr
    myservo.write(30);              // tell servo to go to position in variable 'pos'
    delay(333);                       // waits 15ms for the servo to reach the position

   // Sand
   myservo.write(0);              // tell servo to go to position in variable 'pos'
    delay(76);                       // waits 15ms for the servo to reach the position



}
