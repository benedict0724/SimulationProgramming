class Human extends Agent {
  
  float s = random(-90, 90);
  float angle = 0;
  PShape sh;
  ArrayList<Particle> particles;
  
  Human(PVector l) {
    super(l); 
    sh = loadShape("running-man.svg");
    particles = new ArrayList<Particle>();
  }
  
  void update(PVector breadLocation) {
    super.update(breadLocation);
    if(turn == 0) {
      velocity = new PVector(random(-2.5, 2.5), random(-2.5, 2.5));
      PVector dir = PVector.sub(breadLocation, location);
      dir.normalize();
      dir.mult(4);
      velocity.add(dir);
    }
    if(turn < 50) location.add(PVector.mult(velocity, sin(turn*PI/50.0)));
    if(turn > 80 && random(0, 50) <= 1) turn = -1;
  }
  
  void run(PVector breadLocation) {
    super.run(breadLocation);
    if(turn < 50) addParticle();
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  void addParticle() {
    angle = velocity.heading();
    PVector tmp = new PVector(0, 150*d);
    particles.add(new Particle(PVector.add(location, tmp), angle));
  }
  
  void drawBody() {
    pushMatrix();
    translate(location.x, location.y);
    scale(d*zoom);
    if(velocity.x > 0) shape(sh, -150, -120, 300, 500);
    else shape(sh, 150, -120, -300, 500);
    popMatrix();
  }



}
