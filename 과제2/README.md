# [과제 2]
```java
void step()
{
  int choice = int(random(6));
  if(choice <= 1) {
    x++;
  } else if (choice == 2) {
    x--;
  } else if(choice <= 4) {
    y++;
  } else {
    y--;
  }
}
```
33%의 확률로 오른쪽 또는 아래로 이동하고, 17%의 확률로 왼쪽 또는 위로 이동한다.
