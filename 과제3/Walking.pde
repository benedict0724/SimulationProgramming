Walker w;

void setup()
{
  size(500, 500);
  w = new Walker();
  
  background(255);
}

void draw()
{
  w.step();
  w.display();
}
