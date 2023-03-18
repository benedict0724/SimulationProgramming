class Human extends Agent {
  
  float s = random(-90, 90);
  float d = random(0.1, 0.3);
  
  Human(PVector l) {
    super(l); 
  }
  
  void update(ArrayList<Agent> agents) {
    
    PVector force = new PVector(0, 0);
    for(int i=0;i<agents.size();i++) {
      PVector P = new PVector(agents.get(i).location.x, agents.get(i).location.y);
      P.sub(location);
      float D = P.mag();
      D = max(10, D);
      P.mult(1/(D*D));
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
      rotate(radians(180));
      beginShape();
        for(int i=225;i>=-45;i--)
        {
          vertex(25+25*cos(radians(i)), 25-25*sin(radians(i)));
        }
        vertex(50, 50);
        vertex(70, 50);
        vertex(70, 150);
        vertex(55, 150);
        vertex(55, 80);
        vertex(50, 80);
        vertex(50, 220);
        vertex(28, 220);
        vertex(28, 140);
        vertex(22, 140);
        vertex(22, 220);
        vertex(0, 220);
        vertex(0, 80);
        vertex(-5, 80);
        vertex(-5, 150);
        vertex(-20, 150);
        vertex(-20, 50);
        vertex(0, 50);
      endShape();
    popMatrix();
  }
  



}
