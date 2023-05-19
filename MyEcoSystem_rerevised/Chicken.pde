class Chicken  extends Agent {
  
  float d = 0.1;
  float s = random(-90, 90);
  float[] genes;
  int dnaSize = 3;
  float score = 0;
  PShape sh;
  
  Chicken(PVector l, float track, float xrand, float yrand) {
    super(l);
    score = 0;
    genes = new float[dnaSize];
    
    genes[0] = track;
    genes[1] = xrand;
    genes[2] = yrand;
    
    sh = loadShape("chicken-svgrepo-com.svg");
  }
  
  void update(PVector breadLocation) {
    super.update(breadLocation);
    if(turn == 0) {
      velocity = new PVector(random(-genes[1], genes[1]), random(-genes[2], genes[2]));
      PVector dir = PVector.sub(breadLocation, location);
      dir.normalize();
      dir.mult(genes[0]);
      
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
