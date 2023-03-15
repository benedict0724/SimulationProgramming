# [과제 8]
```processing
PVector mouse = new PVector(mouseX,mouseY);
PVector center = new PVector(width/2,height/2);
mouse.sub(center);
float m = mouse.mag();
float R = 3000/(10+m);
```
PVector의 mag함수를 이용하여 크기를 구하고, 가까워질수록 크기가 커지되 300 이상 커지진 않도록 반지름의 식을 3000/(10+m)으로 두었다.

```processing
stroke(0);
strokeWeight(2);
noFill();
arc(width/2, height/2, R, R, 0, HALF_PI);
arc(width/2, height/2, 0.85*R, 0.85*R, QUARTER_PI, QUARTER_PI+HALF_PI);
arc(width/2, height/2, 1.1*R, 1.1*R, HALF_PI, PI);
arc(width/2, height/2, R, R, HALF_PI+QUARTER_PI, PI+QUARTER_PI);
arc(width/2, height/2, 0.85*R, 0.85*R, PI, PI+HALF_PI);
fill(200);
circle(width/2, height/2, 0.7*R);
fill(100);
circle(width/2, height/2, 0.3*R);
```
원래는 그냥 단순한 원을 그렸으나 다른 친구의 과제 8을 보고 뭔가 해야겠다는 생각이.. 들어서 좀 더 복잡한 도형으로 만들어주었다. 출력 결과는 아래와 같다.
<img width="752" alt="스크린샷 2023-03-15 오후 10 27 58" src="https://user-images.githubusercontent.com/74486197/225322826-ddcec4c9-7694-4cd9-9b5d-903b44ffefb7.png">
