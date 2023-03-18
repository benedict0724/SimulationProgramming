# [과제 14]
인터넷에서 다운받은 svg 파일을 이용하여 닭 그림을 먹이로 설정했다. svg 파일을 data 파일에 넣고 loadShape 메서드를 이용하면 된다.
```processing
PShape sh;
  
Chicken(PVector l) {
  super(l);
  sh = loadShape("chicken-svgrepo-com.svg");
}

void drawBody() {
  pushMatrix();
    //(중략)
    shape(sh, 0, 0, 200, 200);
  popMatrix();
}
```

update 메서드에 인자로 agent들의 Arraylist를 넣었다. 포식자(사람)들은 먹이(닭)들로부터 인력을 받고, 먹이들은 포식자들로부터 척력을 받도록 만들었다. 아래 코드는 Chicken 클래스에 있는 update 함수이다.
```processing
void update(ArrayList<Agent> agents) {
    
  PVector force = new PVector(0, 0);
  for(int i=0;i<agents.size();i++) {
    PVector P = new PVector(agents.get(i).location.x, agents.get(i).location.y);
    P.sub(location);
    float D = P.mag();
    D = max(10, D);
    P.mult(-1/(D*D)); //인력을 받고 싶을 경우 P.mult(1/D*D)
    force.add(P);
  }

  velocity.add(force);
  velocity.limit(5);
  location.add(velocity);
  health -= 0.2;
}
```

