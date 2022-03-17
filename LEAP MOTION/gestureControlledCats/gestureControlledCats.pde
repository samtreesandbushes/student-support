


import de.voidplus.leapmotion.*;

LeapMotion leap;

// DECLARE WILL USE AN IMAGE AND NAME IT 
PImage handImg;  



void setup() {
  size(640, 360);
  background(255); 
  leap = new LeapMotion(this); 
  
  // LOAD THE IMAGE
  handImg = loadImage("catBig.png");  // Load the image into the program  
} 

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}





void draw() {
  
    // REDRAW THE BACKGROUND OR NOT
   background(255);
    
    
    // START READING THE HAND MOTION
    for (Hand hand : leap.getHands ()) {
  
      
            //THESE ARE THE VARIABLES YOU CAN USE
            PVector handPosition       = hand.getPosition();
            float   handGrab           = hand.getGrabStrength();
            float   handRoll           = hand.getRoll();
       
            
            // THIS IS CODE TO PRINT THEM TO THE CONSOLE
            println("handX=" + handPosition.x);
            println("handY=" + handPosition.y);
            println("handGrab=" + handGrab);
            println("handRoll=" + handRoll);
            
            
            // THIS HIDES OR REVEALS THE HAND SKELETON
            //hand.draw();
            
            // THIS DRAWS AN IMAGE WHICH IS TIED TO THE POSITION OF YOUR HAND
            image(handImg, handPosition.x, handPosition.y, handImg.width/5, handImg.height/5);          
            
            // THIS DRAWS AN ELLIPSE WHICH IS TIED TO THE POSITION OF YOUR HAND abd controlled by roll
            //ellipse(handPosition.x, handPosition.y, handRoll, handRoll);         
            
    }
}
