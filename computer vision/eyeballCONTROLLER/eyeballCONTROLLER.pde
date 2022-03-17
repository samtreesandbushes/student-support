import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(1000, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);

  //image(video, 0, 0 );
  background(0);
  
  noFill();
  // stroke(0, 255, 0);
  // strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  ellipse(200, 100, 200, 200);
    fill(255);
    
  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
   //  ellipse(faces[i].x, faces[i].y, 100, 100);
    // fill(0);
    float newEyeX = map( faces[i].x, 0, 200, 150, 350);
    ellipse(newEyeX, faces[i].y, 50, 50);
    
    float newEyeTwoX = map( faces[i].x+150, 0, 200, 150, 350);
    ellipse(newEyeTwoX, faces[i].y, 50, 50);
  
    println("newEyeX = " + newEyeX);
  

  }
}

void captureEvent(Capture c) {
  c.read();
}
