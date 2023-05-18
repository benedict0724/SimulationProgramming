/*
 * Jonghwa Park
 * suakii@gmail.com
*/


class Bread {
  PVector location;
  PImage img;

  Bread(PVector l) {
    location = l;
    img = loadImage("bread.png");
  }
  
  void check(ArrayList<Agent> agents) {
    for(int i=0;i<agents.size();i++) {
      Agent agent = agents.get(i);
      PVector aLocation = agent.location;
      if(PVector.dist(location, aLocation) < 40) {
        agent.d += 0.15;
        location = new PVector(random(width-100)+50, random(height-100)+50);
        agent.health = 100;
      }
    }
  }
  
  void display() {
    pushMatrix();
      translate(location.x, location.y);
      image(img, -30, -30, 60, 60);
    popMatrix();
  }
}
