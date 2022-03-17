import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

PImage img;  // Declare variable "a" of type PImage

void setup() {

  size(640, 480);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  img = loadImage("moonwalksmall.jpg");  // Load the image into the program  
}

void draw() {
  
  
  scale(2);
  opencv.loadImage(video);

  //image(video, 0, 0 );

  noFill();
  stroke(0, 0, 0);
  strokeWeight(1);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    image(img, faces[i].x*2, faces[i].y*2, img.width/5, img.height/5);
  }
  
  
}


void captureEvent(Capture c) {
  c.read();
}
