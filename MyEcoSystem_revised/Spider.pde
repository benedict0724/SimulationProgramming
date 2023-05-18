class Spider extends Agent {
  
  float s = random(-90, 90);
  float A;
  float w;
  float t;
  float theta;
  
  Spider(PVector l) {
    super(l);
    A = 0.3;
    w = 0.05;
    t = 0;
  }
  
  void update(PVector breadLocation) {
    super.update(breadLocation);
    theta = A*sin(w*t);
    t += 1;
  }
  
  void drawBody() {
    pushMatrix();
      translate(location.x, location.y);
      scale(d*1.4);
      stroke(0);
      fill(0);
      
      rotate(theta);
      line(0, 0, 0, 200);
      ellipse(0, 200, 30, 70);
      line(0, 200, 50, 250);
      line(0, 200, 60, 220);
      line(0, 200, 60, 180);
      line(0, 200, 50, 150);
      line(0, 200, -50, 250);
      line(0, 200, -60, 220);
      line(0, 200, -60, 180);
      line(0, 200, -50, 150);
    popMatrix();
  }
}
