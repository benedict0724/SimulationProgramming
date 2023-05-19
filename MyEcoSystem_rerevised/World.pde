class World {

  ArrayList<Chicken> agents;
  ArrayList<Chicken> goods;
  ArrayList<Bread> breads;

  World(int h, int c, int s, int b) {      
    agents = new ArrayList<Chicken>();
    for (int i = 0; i < c; i++) {
      PVector l = new PVector(random(width),random(height));
      agents.add(new Chicken(l, random(2, 2.5), random(0, 1), random(0, 1)));
    }
    breads = new ArrayList<Bread>();
    for (int i = 0; i < b; i++) {
      PVector l = new PVector(random(width-100)+50,random(height-100)+50);
      breads.add(new Bread(l));
    }
  }
  
  void resetWorld(int c, int b) {
    int gnum = c/6;
    goods = new ArrayList<Chicken>();
    for(int i=0;i<c;i++) {
      Chicken C = agents.get(i);
      if(goods.size() < gnum) {
        goods.add(C);
        continue;
      }
      Chicken smallest = goods.get(0);
      int where = 0;
      for(int j=0;j<gnum;j++) {
        Chicken tmp = goods.get(j);
        if(smallest.score > tmp.score){
          smallest = tmp;
          where = j;
        }
      }
      if(smallest.score < C.score) {
        goods.remove(where);
        goods.add(C);
      }
    }
    
    agents = new ArrayList<Chicken>();
    for(int i=0;i<gnum;i++) {
      Chicken C = goods.get(i);
      for(int j=0;j<6;j++) {
        PVector l = new PVector(random(width),random(height));
        agents.add(new Chicken(l, C.genes[0] * random(0.8, 1.2), C.genes[1] * random(0.7, 1.3), C.genes[2] * random(0.7, 1.3)));
      }
    }
    
    breads = new ArrayList<Bread>();
    for (int i = 0; i < b; i++) {
      PVector l = new PVector(random(width-100)+50,random(height-100)+50);
      breads.add(new Bread(l));
    }
  }

  void run() {
    for (int i = agents.size()-1; i >= 0; i--) {
      Agent a = agents.get(i);
      PVector nearest = breads.get(0).location;
      for(int j=0;j<breads.size();j++) {
        if(breads.get(j).available) {
          nearest = breads.get(j).location;
        }
      }
      for(int j=0;j<breads.size();j++) {
        if(breads.get(j).available == false) continue;
        if(PVector.dist(nearest, a.location) > PVector.dist(breads.get(j).location, a.location)) {
          nearest = breads.get(j).location;
        }
      }
      a.run(nearest);
    }
    
    for(int i=0;i<breads.size();i++) {
      Bread bread = breads.get(i);
      bread.check(agents);
      bread.display();
    }
    
    for(int i=agents.size()-1;i>=0;i--) {
      Agent agent = agents.get(i);
      if(agent.death()) {
        agents.remove(i);
        if(agent instanceof Chicken) { cnum--; }
      }
    }
  }
  
}
