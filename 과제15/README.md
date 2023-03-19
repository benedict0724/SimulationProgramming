# [과제 15]
기존의 코드에 normal force와 friction을 추가해줌으로써 상자가 정상적으로 떨어지게 만들었다.
normal force는 지면에 수직한 방향으로 $F_{g}\cos(\theta)$만큼 작용한다. friction은 운동마찰계수가 $\mu$라고 했을 때 운동하는 반대방향으로 $\mu F_{g}\sin(\theta)$만큼 작용한다.

```processing
float fg= gravity.mag();
PVector normalForce = new PVector(0, -fg*cos(theta));
normalForce.rotate(-theta);

float mu = 0.3;
PVector friction = new PVector(fg*sin(theta)*mu, 0);
friction.rotate(-theta);
```
