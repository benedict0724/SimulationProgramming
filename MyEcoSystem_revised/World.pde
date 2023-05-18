class World {

  ArrayList<Agent> agents;
  ArrayList<Bread> breads;

  World(int h, int c, int s, int b) {      
    agents = new ArrayList<Agent>();
    for (int i = 0; i < h; i++) {
      PVector l = new PVector(random(width),random(height));
      agents.add(new Human(l));
    }
    for (int i = 0; i < c; i++) {
      PVector l = new PVector(random(width),random(height));
      agents.add(new Chicken(l));
    }
    for (int i = 0; i < s; i++) {
      PVector l = new PVector(random(width),random(height));
      agents.add(new Spider(l));
    }
    breads = new ArrayList<Bread>();
    for (int i = 0; i < b; i++) {
      PVector l = new PVector(random(width-100)+50,random(height-100)+50);
      breads.add(new Bread(l));
    }
  }

  void born(float x, float y) {
    PVector l = new PVector(x,y);
    int rx = int(random(3));
    if(rx == 0) {
      agents.add(new Chicken(l));
      cnum++;
    }
    else if(rx == 1) {
      agents.add(new Human(l));
      hnum++;
    }
    else {
      agents.add(new Spider(l));
      snum++;
    }
  }
  
  void born(float x, float y, int type) {
    PVector l = new PVector(x,y);
    if(type == 0) {
      agents.add(new Chicken(l));
      cnum++;
    }
    else if(type == 1) {
      agents.add(new Human(l));
      hnum++;
    }
    else {
      agents.add(new Spider(l));
      snum++;
    }
  }

  void run() {
    for (int i = agents.size()-1; i >= 0; i--) {
      Agent a = agents.get(i);
      PVector nearest = breads.get(0).location;
      for(int j=0;j<breads.size();j++) {
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
        if(agent instanceof Human) { hnum--; }
        if(agent instanceof Spider) { snum--; }
      }
    }
  }
  
}
