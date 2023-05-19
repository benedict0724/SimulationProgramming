/*
 * Jonghwa Park
 * suakii@gmail.com
*/


class Bread {
  PVector location;
  PImage img;
  
  boolean available;

  Bread(PVector l) {
    location = l;
    available = true;
    img = loadImage("bread.png");
  }
  
  void check(ArrayList<Chicken> agents) {
    if(!available) return;
    for(int i=0;i<agents.size();i++) {
      Chicken agent = agents.get(i);
      PVector aLocation = agent.location;
      if(PVector.dist(location, aLocation) < 4) {
        location = new PVector(random(width-100)+50, random(height-100)+50);
        agent.score += 1;
        available = false;
        bnum--;
      }
    }
  }
  
  void display() {
    if(!available) return;
    pushMatrix();
      translate(location.x, location.y);
      scale(0.2);
      image(img, -30, -30, 60, 60);
    popMatrix();
  }
}
