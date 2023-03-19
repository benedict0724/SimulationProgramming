Mover plane;

void setup() {
  size(800, 400);
  plane = new Mover(new PVector(50, height-50));
}

void draw() {
  background(255);
  plane.run();
}
