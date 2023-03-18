Mover movers[];

int count;

void setup() {

  size(800, 800);
  smooth();
  movers = new Mover[10];
  for(int i=0;i<10;i++) movers[i] = new Mover();
}

void draw() {
  background(255);
  
  for(int i=0;i<10;i++)
  {
    movers[i].resetForce();
    for(int j=0;j<10;j++)
    {
      if(i == j) continue;
      movers[i].addForce(movers[j].location);
    }
  }
  
  for(int i=0;i<10;i++) movers[i].run();
}
