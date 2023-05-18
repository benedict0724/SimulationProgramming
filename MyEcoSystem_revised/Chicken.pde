class Chicken  extends Agent {
  
  float s = random(-90, 90);
  PShape sh;
  
  Chicken(PVector l) {
    super(l);
    sh = loadShape("chicken-svgrepo-com.svg");
  }
  
  void update(PVector breadLocation) {
    super.update(breadLocation);
    if(turn == 0) {
      velocity = new PVector(random(-5, 5), random(-5, 5));
      PVector dir = PVector.sub(breadLocation, location);
      dir.normalize();
      dir.mult(3);
      velocity.add(dir);
    }
    if(turn < 10) location.add(PVector.mult(velocity, sin(turn*PI/10.0)));
    if(turn > 15 && random(0, 10) <= 1) turn = -1;
  }
  
  void drawBody() {
    pushMatrix();
      translate(location.x, location.y);
      scale(d*zoom);
      stroke(0);
      fill(0);
      
      if(velocity.x < 0) shape(sh, -75, -75, 150, 150);
      else shape(sh, 75, -75, -150, 150);
    popMatrix();
  }
}
