class Mover {
  PVector location;
  PVector velocity;
  PVector accel;
  
  color c;
  
  Mover() {
    location = new PVector(0, 0);
    location.x = random(width/4) + 3*width/8;
    location.y = random(height/4) + 3*height/8;
    velocity = new PVector(0, 0);
    accel = new PVector(0, 0);
    
    c = color(random(255), random(255), random(255));
  }
  
  void resetForce() {
    accel.x = 0;
    accel.y = 0;
  }
  
  void addForce(PVector p) {
    PVector force = new PVector(location.x, location.y);
    
    force.sub(p);
    float d = force.mag();
    force.normalize();
    if(d < 0.1) force.mult(100);
    else force.div(d*d);
    
    force.mult(2000);
    
    accel.add(force);
  }
  
  void run() {
    update();
    display();
  }
  
  void update() { 
    velocity.add(accel);
    location.add(velocity);
    velocity.mult(0.8);
  }
  
  void display() {
    pushMatrix();
    drawBody();
    popMatrix();
  }
  
  void drawBody() {
    fill(c);
    noStroke();
    circle(location.x, location.y, 50);
  }
}
