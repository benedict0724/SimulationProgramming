class Mover {
  PVector location;
  PVector velocity;
  PVector gravity;
  PVector engine;
  
  Mover(PVector l) {
    location = l;
    
    velocity = new PVector(0, 0);
    gravity = new PVector(0, 1.5);
    engine = new PVector(1, 0);
  }
  
  void run() {
    update();
    borders();
    display();
  }
  
  void update() {
    engine.x = engine.x + 0.011;
    float vsq = velocity.x * velocity.x;
    PVector force = new PVector(-0.02*vsq, -0.01*vsq);
    float vysq = velocity.y * velocity.y;
    force.add(new PVector(0, 0.05*vysq));
    
    velocity.add(gravity);
    velocity.add(engine);
    velocity.add(force);
    
    location.add(velocity);
  }
  
  void borders() {
    if(location.x > width) location.x = 0;
    if(location.y > height - 50) {
      velocity.y = 0;
      location.y = height - 50;
    }
    if(location.y < 0) location.y = height - 50;
  }
  
  void display() {
    fill(128, 64, 0);
    rect(0, 360, 800, 40);
    pushMatrix();
      translate(location.x, location.y);
      rotate(velocity.heading());
      noStroke();
      fill(100, 200, 250);
      ellipse(0, 0, 50, 20);
      fill(255, 0, 0);
      beginShape();
        vertex(-5, 0);
        vertex(-15, 0);
        vertex(-30, -20);
        vertex(0, 0);
      endShape();
    popMatrix();
  }
}
