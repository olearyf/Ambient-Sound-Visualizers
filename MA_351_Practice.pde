float time = 0.0;
float a = .5;
void setup() {
  size(1000, 1000);
  background(0);
  stroke(255);
  //translate(width/2, height/2);
  //rect(500, 500, 500, 500, 500);
  //scale(0.05);
}

void draw() {
  //background(0);
  //translate(width/2, height/2);
  //rotateX(time);
  //rotateX(45);
  stroke(190);
  strokeWeight(.5);
  //strokeWeight(10);
  //point(exp(a*time)*cos(time)+(width/2), exp(a*time)*sin(time) + (height/2));
  //scale(.05);
  line(exp(a*time)*cos(time)+(width/2), exp(a*time)*sin(time) + (height/2), exp(a*time+2)*cos(time+2)+(width/2), exp(a*time+2)*sin(time+2) + (height/2));
   // line(-(exp(a*time)*cos(time)+(width/2)), -(exp(a*time)*sin(time) + (height/2)), -(exp(a*time+1)*cos(time+1)+(width/2)), -(exp(a*time+1)*sin(time+1) + (height/2)));
  time+=0.05;
  if(time >= 14){
    time = 0;
    background(0);
    saveFrame("result.png");
    //rotate(PI/2);
  }
  //System.out.println(time);
  //scale(.5);
}
