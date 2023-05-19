/*
 * Jonghwa Park
 * suakii@gmail.com
*/


class Agent {
  PVector location;
  PVector velocity;
 
  float r;
  float maxspeed;
  float d;
  float zoom;
  float health;
  
  int turn;
  
  Agent(PVector l) {
    turn = 0;
    location = l;
    maxspeed = map(random(1), 0, 1, 1, 0);
    r = map(random(1), 0, 1, 0, 50);
    d = random(0.3, 0.5);
    health = 100;
    zoom = 1;
    
    velocity = new PVector(0, 0);
  }
  
  void run(PVector breadLocation) {
    update(breadLocation);
    borders();
    display();
  }
  
  void update(PVector breadLocation) {
    turn++;
  }
  void borders() {
    if (location.x < 50) {
      location.x = 50;
      velocity.x = abs(velocity.x);
    }
    if (location.y < 50) {
      location.y = 50;
      velocity.y = abs(velocity.y);
    }
    if (location.x > width-50) {
      location.x = width-50;
      velocity.x = -abs(velocity.x);
    }
    if (location.y > height-50) {
      location.y = height-50;
      velocity.y = -abs(velocity.y);
    }
  }
  
  void display() {
    pushMatrix();
      drawBody();
    popMatrix();
  }
  
  boolean death() {
    if(health < 0) {
      return true;
    } else {
      return false;
    }
  }
  
  
  
  //child class to override this 
  void drawBody() {
  
  }
}
