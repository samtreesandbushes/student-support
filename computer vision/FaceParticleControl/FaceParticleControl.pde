import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

ParticleSystem ps;

void setup() {
  size(640,360);

    video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
  
    ps = new ParticleSystem(new PVector(width/2,50));
  
  
}

void draw() {

  background(0);
  scale(2);
  opencv.loadImage(video);

  //image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);

      ps.origin.set(faces[i].x,faces[i].y,0);
    
  ps.addParticle();
  ps.run();
    
  }
  
  // Option #1 (move the Particle System origin)


  // Option #2 (move the Particle System origin)
  // ps.addParticle(mouseX,mouseY);



}

void captureEvent(Capture c) {
  c.read();
}
