


import de.voidplus.leapmotion.*;

LeapMotion leap;

// DECLARE WILL USE AN IMAGE AND NAME IT 
PImage handImg;  



void setup() {
  size(640, 360);
  background(255); 
  leap = new LeapMotion(this); 
  
  // LOAD THE IMAGE
  handImg = loadImage("hand.png");  // Load the image into the program  
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
   //background(255);
    
    
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
            //image(handImg, handPosition.x, handPosition.y, handImg.width/5, handImg.height/5);          
            
            // THIS DRAWS AN ELLIPSE WHICH IS TIED TO THE POSITION OF YOUR HAND abd controlled by roll
            //ellipse(handPosition.x, handPosition.y, handRoll, handRoll);         
            
            
            // GET THE DATA ABOUT FINGER POSITIONS AND NAME IT
            Finger  fingerThumb        = hand.getThumb();
            Finger  fingerIndex        = hand.getIndexFinger();
            Finger  fingerMiddle       = hand.getMiddleFinger();
            Finger  fingerRing         = hand.getRingFinger();
            Finger  fingerPink         = hand.getPinkyFinger();

            
            for (Finger finger : hand.getFingers()) {
              
                    int     fingerId         = finger.getId();
                    PVector fingerPosition   = finger.getPosition();
                    PVector fingerStabilized = finger.getStabilizedPosition();
                    PVector fingerVelocity   = finger.getVelocity();
                    PVector fingerDirection  = finger.getDirection();
                    float   fingerTime       = finger.getTimeVisible();
                    
                    
                    PVector fingerThumbPosition   = fingerThumb.getPosition();
                    println("fingerThumbPosition" + fingerThumbPosition );
                    println("fingerThumbPositionX" + fingerThumbPosition.x );
                    println("fingerThumbPositionY" + fingerThumbPosition.y );
                    println("fingerThumbPositionZ" + fingerThumbPosition.z );

                    // ATTACH AN ELLIPSE TO THE THUMBPOSITION
                    ellipse(fingerThumbPosition.x, fingerThumbPosition.y, 30,30);
                    fill(239, 65, 54);

            }
        
    }
}
