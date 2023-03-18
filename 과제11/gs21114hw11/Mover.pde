class Mover {
  PVector location;
  PVector velocity;
  
  float r;
  color c;
  
  Mover(PVector l, float rad) {
    location = l;
    
    velocity = new PVector(5, 0);
    velocity.rotate(rad);
    
    c = color(random(255), random(255), random(255));
    r = 10;
  }
  
  void run() {
    update();
    borders();
    display();
  }
  
  void update() {
    machal1();
    machal2();
    location.add(velocity);
  }
  
  void borders() {
    if(location.x < r) velocity.x = abs(velocity.x);
    if(location.y < r) velocity.y = abs(velocity.y);
    if(location.x > width - r) velocity.x = -abs(velocity.x);
    if(location.y > height - r) velocity.y = -abs(velocity.y);
  }
  
  void display() {
    pushMatrix();
    drawBody();
    popMatrix();
  }
  
  void machal1() {
    if(100 < location.x && location.x < 200 && 150 < location.y && location.y < 250)
      velocity.mult(0.95);
  }
  
  void machal2() {
    PVector cent = new PVector(500, 500);
    PVector D = cent.sub(location);
    if(D.mag() < 100) velocity.mult(0.98);
  }
  
  void drawBody() {
    fill(c);
    stroke(0);
    
    circle(location.x, location.y, r);
  }
}
