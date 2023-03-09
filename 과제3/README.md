# [과제 3]
```java
int dX = mouseX - x;
int dY = mouseY - y;

if(dX*dX > dY*dY) {
  if(dX > x) x++;
  else x--;
} else {
  if(dY > y) y++;
  else y--;
}
```
Walker 코드에서 50% 확률로 위의 코드가 실행되어 마우스가 있는 방향을 따라가도록 만들었다.
