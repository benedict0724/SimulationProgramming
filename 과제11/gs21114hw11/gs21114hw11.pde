Mover movers[];

void setup() {

  size(800, 800);
  smooth();
  movers = new Mover[100];
  for(int i=0;i<100;i++)
  {
    movers[i] = new Mover(new PVector(width/2, height/2), radians(3.6*i));
  }
}

void draw() {
  background(255);
  
  fill(100);
  rect(100, 150, 100, 100);
  fill(200);
  circle(500, 500, 200);
  
  for(int i=0;i<100;i++) movers[i].run();
}
