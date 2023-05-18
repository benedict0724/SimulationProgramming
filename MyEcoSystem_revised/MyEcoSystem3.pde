import processing.svg.*;

World world;
int hnum, cnum, snum, bnum;

void setup() {

  hnum = 3;
  cnum = 3;
  snum = 0;
  bnum = 3;
  size(800, 800);
  world = new World(hnum, cnum, snum, bnum);
  smooth();

}

void draw() {
  background(255);
  
  float rows = 25, cols = 25;
  float cellW = width/cols;
  float cellH = height/rows;
  
  for(int i=0;i<rows;i++) {
    for(int j=0;j<cols;j++) {
      pushMatrix();
      translate(cellW*j, cellH*i);
      if((i+j)%2 == 0) fill(117, 166, 74);
      else fill(160, 176, 54);
      noStroke();
      rect(0, 0, cellW, cellH);
      popMatrix();
    }
  }

  world.run();
  
  fill(0);
  textSize(20);
  text("humans : " + hnum, 30, 30);
  text("chickens : " + cnum, 30, 50);
}
