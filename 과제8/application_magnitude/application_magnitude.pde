void setup() {
  size(640,360);
}

void draw() {
  background(255);
  
  PVector mouse = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);
  mouse.sub(center);

  float m = mouse.mag();
  
  float R = 3000/(10+m);
  
  stroke(0);
  strokeWeight(2);
  noFill();
  arc(width/2, height/2, R, R, 0, HALF_PI);
  arc(width/2, height/2, 0.85*R, 0.85*R, QUARTER_PI, QUARTER_PI+HALF_PI);
  arc(width/2, height/2, 1.1*R, 1.1*R, HALF_PI, PI);
  arc(width/2, height/2, R, R, HALF_PI+QUARTER_PI, PI+QUARTER_PI);
  arc(width/2, height/2, 0.85*R, 0.85*R, PI, PI+HALF_PI);
  fill(200);
  circle(width/2, height/2, 0.7*R);
  fill(100);
  circle(width/2, height/2, 0.3*R);
}
