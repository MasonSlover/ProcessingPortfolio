import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

OpenCV opencv;
Rectangle[] faces;


Capture cam;

PImage image; 
void setup() { 

  background(0);
  size(640, 480);


  //initalize webcam
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
  scale(-1, 1);
  translate(-width, 0);

  loadPixels(); 
  cam.read();
  getFace();

  //pixels[x + y * width] = image.get(x,y); 
  //set(x, y, image.get(x, y)); updatePixels(); 
  //print(image.width + " " + image.height + "\n"); 
  int swidth = 5;

  int faceX = 0, faceY = 0;

  for (int i = 0; i < faces.length; i++) {
    faceX = faces[i].x + (faces[i].width / 2); 
    faceY = faces[i].y + ((faces[i].height) / 2);
  }

  for (int i = 0; i < 10000; i++) {
    int x = (int)random(width); 
    int y = (int)random(height); 
    fill(cam.get(x, y)); 
    noStroke();
    for (int j = 0; j < faces.length; j++) {
      faceX = faces[j].x + (faces[j].width / 2); 
      faceY = faces[j].y + ((faces[j].height) / 2);
      if (faceX > 0 && faceY > 0) {
        if (dist(faceX, faceY, x, y) > 100) {
          if (!mousePressed) {
            swidth = 8;
          } else {
            swidth = 40;
          }
        } else {
          if (!mousePressed) {
            swidth = 40;
          } else {
            swidth = 8;
          }
        }
        rect(x-swidth/2, y-swidth/2, swidth, swidth);
      }
    }
  }

  //saveFrame("#####.png");
}

void getFace() {
  opencv = new OpenCV(this, cam);


  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  faces = opencv.detect();
}
