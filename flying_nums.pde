import peasy.*;

PeasyCam cam;
int cols, rows;
int scl = 20;
int w = 2000;
int h = 2000;
float move = 0;
float[][] z;
PFont f;

void setup() {
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(500);
  size(1000, 1000, P3D);
  f = createFont("Helvetica", 20, true);
  textFont(f);
  cols = w / scl;
  rows = h / scl;
  z = new float[cols][rows];
}

void draw() {
  move -= .1;
  float yoff = move;
  for (int y = 0; y < rows; y++){
    float xoff = 0;
    for(int x = 0; x < cols; x++) {
      z[x][y] = map(noise(xoff, yoff), 0, 1, 0, 100);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  background(0);
  stroke(255);
  translate(width/2, height/2 + 50);
  rotateX(PI/2);
  translate(-w/2, -h/2);
  for (int y = 0; y < rows-1; y++){
    for(int x = 0; x < cols; x++) {
      String s = "" + (int)map(z[x][y], 0, 100, 0, 10);
      text(s, x*scl, y*scl, z[x][y]+400);
      text(s, x*scl, y*scl, -z[x][y]+700);
    }
  }
}
