class Balloon extends Mover {
  Balloon(PVector l) {
    super(l);
  }
  
  void drawBody() {
    pushMatrix();
      translate(location.x, location.y);
      noStroke();
      fill(255, 0, 0);
      ellipse(0, -15, 25, 30);
      
      stroke(0);
      noFill();
      beginShape();
      vertex(0, 0);
      bezierVertex(10, 5, -10, 12, 5, 25);
      vertex(5, 25);
      endShape();
    popMatrix();
  }
}
