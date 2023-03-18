class Chicken  extends Agent {
  
  float s = random(-90, 90);
  float d = random(0.1, 0.3);
  PShape sh;
  
  Chicken(PVector l) {
    super(l);
    sh = loadShape("chicken-svgrepo-com.svg");
  }
  
  void update(ArrayList<Agent> agents) {
    
    PVector force = new PVector(0, 0);
    for(int i=0;i<agents.size();i++) {
      PVector P = new PVector(agents.get(i).location.x, agents.get(i).location.y);
      P.sub(location);
      float D = P.mag();
      D = max(10, D);
      P.mult(-1/(D*D));
      force.add(P);
    }
    
    velocity.add(force);
    velocity.limit(5);
    location.add(velocity);
    health -= 0.2;
  }
  
  void drawBody() {
    pushMatrix();
      translate(location.x, location.y);
      scale(d);
      stroke(0,health);
      fill(0, health);
      
      rotate(velocity.heading()-radians(90));
      rotate(radians(270));
      shape(sh, 0, 0, 200, 200);
    popMatrix();
  }
}
