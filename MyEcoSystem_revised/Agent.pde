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
    bunyeol();
  }
  
  void update(PVector breadLocation) {
    turn++;
    health -= 0.13;
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
  
  void bunyeol() {
    if(d > 0.7) {
      d = 0.4;
      if(this instanceof Chicken) { world.born(location.x+random(-3, 3), location.y + random(-3, 3), 0); }
      if(this instanceof Human) { world.born(location.x+random(-3, 3), location.y + random(-3, 3), 1); }
      if(this instanceof Spider) { world.born(location.x+random(-3, 3), location.y + random(-3, 3), 2); }
    }
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
