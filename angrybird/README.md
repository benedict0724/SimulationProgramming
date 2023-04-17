# [과제 32]
처음에는 stage가 0으로 되어 있습니다. 이때 마우스를 클릭하면 stage가 1로 바뀌며 앵그리버드가 시작됩니다.

Bar1부터 Bar8은 막대기를 만들고 box2D에 들어가는 클래스입니다. 이미지와 x좌표, y좌표, 그리고 높이와 폭을 제외하면 근본적으로 물리엔진이 같기 때문에 Bar이라는 클래스로 이를 통일하여 코드를 다시 짰습니다.

```processing
class Bar { 
  Body body;
  float r = 16;   // Size
  float w, h;
  PImage fort;
  

  Bar(float x, float y, float w_, float h_, PImage fort_) {
    w = w_;
    h = h_;
    fort = fort_;
    makeBody(new Vec2(x,y),0,new Vec2(0, 0),0);
    body.setUserData(this);
  } 
}
```

Resortera에 속도 벡터를 처음 넣으면 Redbird 또는 Blackbird(stage가 2일 때)가 발사됩니다. Redbird와 Blackbird 클래스는 움직이기 위한 코드는 없고, Resortera에서 바뀐 위치 정보를 받아 화면에 보여줍니다. 


아래는 잔상을 표시하기 위해 만든 클래스입니다. 잔상을 추가할 당시의 위치와 각도를 담고 있습니다. AfterImage 클래스의 ArrayList를 만든 후 tint()를 이용해 투명도를 조절하며 잔상을 띄워줄 수 있습니다. 6프레임마다 한 번 ArrayList에 들어가도록 하였습니다.
```processing
class AfterImage{
  Vec2 pos;
  float a;
  
  AfterImage(Vec2 pos_, float a_) {
    pos = pos_;
    a = a_;
  }
}
```
<img width="678" alt="스크린샷 2023-04-17 오후 11 04 23" src="https://user-images.githubusercontent.com/74486197/232521086-868c3f71-17b5-4ea3-94b4-c0181a7ed9c8.png">
