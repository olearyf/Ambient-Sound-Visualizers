import processing.sound.*;
float time = 0;
float hue = 0;
float n = 2;
AudioIn in;
Amplitude amp;
FFT fft;
int bands = 512;
float[] spectrum = new float[bands];

void setup() {
  size(2000, 2000);
  colorMode(HSB);
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  amp = new Amplitude(this);
  in.start();
  amp.input(in);
  fft.input(in);
  background(0);
}

void draw() {
  frameRate(30);
  fft.analyze(spectrum);
  fill(0, amp.analyze()*400);
  rect(0, 0, width, height);
  fill(255);
  translate(width/2, height/2);
  scale(.75);
  strokeWeight(2);
  n = amp.analyze()*400;
  float x = 0;
  float y = 0;
  beginShape();
  for (int i = 0; i < n; i++) {
    float prevx = x;
    float prevy = y;
    float n = i * 2 + 1;
    float radius = amp.analyze()*4000 * (4 / (n * PI));
    x += radius * cos(n * time);
    y += radius * sin(n * time);
    hue = amp.analyze()*4000/2;
    strokeWeight(3);
    fill(hue, 150, 200);
    ellipse(prevx, prevy, radius, radius);
    stroke(255);
  }
  endShape();
  translate(200, 0);
  time += amp.analyze()/2;
}
