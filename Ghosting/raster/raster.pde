PImage img;

import processing.video.*;
Capture cam;

int resolution = 5;
int ghosting = 10;

void setup() {
  size(640, 480);
  background(0);

  String[] cameras = Capture.list();

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    cam = new Capture(this, cameras[0]);
    cam.start();
  }
}

void draw() {
  cam.read();
  loadPixels();
  noStroke();

  for (int x = 0; x < width; x+=resolution) {
    for (int y = 0; y < height; y+=resolution) {
      float pixelBrightness = brightness(cam.pixels[y * width + x]);
      fill(cam.pixels[y * width + x], 100);
      ellipse(x, y, map(pixelBrightness, 0, 255, 0, resolution), map(pixelBrightness, 0, 255, 0, resolution));
    }
  }

  fill(0, ghosting);
  rect(0, 0, width, height);
}
