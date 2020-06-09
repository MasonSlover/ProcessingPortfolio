PImage img;

void setup() {
  size(1080, 1920);
  img = loadImage("img.JPG");
}

int backgroundColor = 255;
int frames = 0;

void draw() {
  background(backgroundColor);
  smooth();
  strokeWeight(2);
  fill(255 - backgroundColor);
  textAlign(CENTER, CENTER);
  textFont(loadFont("CooperHewitt-SemiboldItalic-100.vlw"));
  textSize(300);
  text("74°", width/2.2, height/7);
  
  int[][] points = new int[2*width][2*height];
  
  loadPixels();
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {

      if (y % 4 == 0 && x % 4 == 0) {
        if (brightness(pixels[x + y * width]) > 5) {

          float offx = map(noiseOffset(x, y), 0, 255, -50, 50);
          if (x + offx > -1 && y > -1 && x + offx < width + 200 && y < height + 200) {
            points[(int)(x + offx)][y] = 1;
          }
        }
      }
    }
  }

  background(backgroundColor);
  
  img.resize(width, height);
  image(img, 0, 0);
  
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      if (points[x][y] == 1) {

        stroke(255, 220);
        point(x - 150, y);
        
      }
    }
  }
  
  if (frames < 24 * 15) {
    saveFrame("images/#####.png");
    frames++;
  } else {
    print("done");
    noLoop();
  }
}


float offset = 0.0;
int noiseOffset(int x, int y) {
  offset += 0.0000002;
  print("\n" + frame); 
  return (int)(map(noise(.01*x+offset, .01*y-offset), 0, 1, 0, 255));
}
