Balloon B;

void setup() {

  size(400, 400);
  smooth();
  B = new Balloon(new PVector(width/2, height));
  
}

void draw() {
  background(255);

  fill(0);
  B.run();

}
