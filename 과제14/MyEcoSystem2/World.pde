class World {

  ArrayList<Agent> humans, chickens;

  World(int h, int c) {
    humans = new ArrayList<Agent>();              
    for (int i = 0; i < h; i++) {
      PVector l = new PVector(random(width),random(height));
      humans.add(new Human(l));
    }
    chickens = new ArrayList<Agent>();
    for (int i = 0; i < c; i++) {
      PVector l = new PVector(random(width),random(height));
      chickens.add(new Chicken(l));
    }
  }

  void born(float x, float y) {
    PVector l = new PVector(x,y);
    int rx = int(random(2));
    if(rx == 0) chickens.add(new Chicken(l));
    else humans.add(new Human(l));
  }

  void run() {
    
    for (int i = humans.size()-1; i >= 0; i--) {
      Agent a = humans.get(i);
      a.run(chickens);
      if (a.dead()) {
        humans.remove(i);
      }
    }
    
    for (int i = chickens.size()-1; i >= 0; i--) {
      Agent a = chickens.get(i);
      a.run(humans);
      if (a.dead()) {
        chickens.remove(i);
      }
    }
    
  }
  
}
