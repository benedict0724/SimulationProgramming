Mover m;

void setup() {
  size(640,360);
  m = new Mover(); 
}

void draw() {
  background(255);

  PVector slow = m.velocity.mult(-0.01);
  PVector fast = new PVector(0.1, 0);
  
  if(keyPressed) m.applyForce(fast);
  else m.applyForce(slow);


  m.update();
  m.display();
  m.checkEdges();

}
