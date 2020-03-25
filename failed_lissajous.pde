import processing.sound.*;
Amplitude amp;
AudioIn in;
float horizSpeed = 4; 
float vertSpeed = 4;
float phaseShift = (float)Math.PI/4;
float count = 1;
float angleV = phaseShift;
float angleH = 0;
float w2, h2;
float size = 150;

void setup(){
  size(1200, 1200);
  background(0);
  stroke(255);
  strokeWeight(1);
  frameRate(120);
  size = (height-100)/2;
  w2 = sin(angleH)*size+width/2; 
  h2 = sin(angleV)*size+height/2;
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw(){
  float h = height-(sin(angleV)*size+height/2);
  float w = sin(angleH)*size+width/2;
  if(amp.analyze()*40 > 0.0){
    phaseShift = (float)Math.PI/(amp.analyze()*40);
    vertSpeed = (amp.analyze()*400);
    horizSpeed = (amp.analyze()*400);
  }
  //for constant opacity
  //fill(0, 25);
  fill(0, amp.analyze()*400);
  rect(0, 0, width, height);
  fill(255);
  angleV = phaseShift + angleV;
  line(w, h, w2, h2);
  angleV += vertSpeed*0.02;
  angleH += horizSpeed*0.02;
  float oldw = w;
  float oldh = h;
  h = height-(sin(angleV)*size+height/2);
  w = sin(angleH)*size+width/2;
  float tempW = w; 
  float tempH = h;
  line(w, h, tempW, tempH);
  bezier(oldw, oldh, w2, h2, w, h, tempW, tempH);
  angleV += vertSpeed*0.02;
  angleH += horizSpeed*0.02;
  w2 = w; 
  h2 = h;
}
