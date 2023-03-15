# [과제 7]
```processing
void update() {
  velocity.add(acceleration);
  position.add(velocity);
  if(position.x > width) position.x = position.x - width;
}
```
Mover 클래스의 update() 메서드에는 Mover가 화면 밖으로 넘어갔을 때 다시 화면의 첫 지점으로 돌아오는 코드를 추가했다.

```processing
PVector slow = m.velocity.mult(-0.01);
PVector fast = new PVector(0.1, 0);

if(keyPressed) m.applyForce(fast);
else m.applyForce(slow);
```
키보드가 눌려 있지 않으면 속도를 일정한 비율로 감소시키고, 키보드를 누르면 일정한 가속도를 받도록 하였다.
