import processing.svg.*;

World world;
int hnum, cnum, snum, bnum, gen;

void setup() {

  hnum = 0;
  cnum = 30;
  snum = 0;
  bnum = 100;
  gen = 0;
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
  if(bnum == 0) {
    bnum = 100;
    world.resetWorld(cnum, bnum);
    gen += 1;
  }
  
  float meanT = 0;
  float meanX = 0;
  float meanY = 0;
  for(int i=0;i<cnum;i++) {
    Chicken C = world.agents.get(i);
    meanT += C.genes[0]/cnum;
    meanX += C.genes[1]/cnum;
    meanY += C.genes[2]/cnum;
  }
  
  fill(0);
  textSize(20);
  text("gen : " + gen, 30, 30);
  text("chickens : " + cnum, 30, 50);
  text("mean of track : " + meanT, 30, 70);
  text("mean of rand : " + meanX + " " + meanY, 30, 90);
  text("breads : " + bnum, 30, 110);
}
