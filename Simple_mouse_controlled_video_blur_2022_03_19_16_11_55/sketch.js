let capture;

function setup() {
  createCanvas(640, 480);
  capture = createCapture(VIDEO);
  capture.size(640, 480);
  capture.hide();
}

function draw() {
  background(0);
  tint(255, 128)
  image(capture, 0, 0, 640, 480);
  tint(255, 128)
  image(capture, 0, 0, 640+ mouseX/5, 480);
  tint(255, 128)
  image(capture, 0, 0, 640+ mouseX/10, 480);
}


