class Mover {
  PVector location;
  PVector velocity;
  PVector buoyancy;
  
  float xoff;
  
  Mover(PVector l) {
    location = l;
    xoff = random(1000);
    
    velocity = new PVector(0, 0);
    buoyancy = new PVector(0, -0.05);
  }
  
  void run() {
    update();
    borders();
    display();
  }
  
  void update() {
    velocity.x = map(noise(xoff), 0, 1, -5, 5);
    xoff += 0.01;
    
    location.add(velocity);
    velocity.add(buoyancy);
  }
  
  void borders() {
    if(location.x < 0) location.x = width-10;
    if(location.y < 30 && velocity.y < 0) velocity.y = -velocity.y*0.5;
    if(location.y > height - 30 && velocity.y > 0) velocity.y = -velocity.y*0.5;
    if(location.x > width) location.x = 10;
  }
  
  void display() {
    pushMatrix();
    drawBody();
    popMatrix();
  }
  
  void drawBody() {
    
  }
}
