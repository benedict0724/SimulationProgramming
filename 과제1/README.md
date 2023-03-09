#  [과제 1]

## 지시사항 1
다수의 공이 떨어지게 만들기 위해
```java
Ball[] balls;
```
를 통해 배열을 정의해주었고 draw() 메서드에서
```java
for(int i=0;i<100;i++) balls[i].display();
for(int i=0;i<100;i++) balls[i].update();
```
로 각각의 공들을 조작해주었다.

## 지시사항 2
```java
    c = color(random(255), random(255), random(255));
```
로 color 변수를 만들고 fill 함수를 통해 색을 채웠다.

## 지시사항 3,4
```java
balls[i] = new Ball(random(width), random(height), random(20));
```
로 공의 위치와 공의 크기를 랜덤하게 만들어주었다.

## 지시사항 5
speedx 변수를 추가하고, x방향 속도는 매순간 랜덤하게 가속되게 바꾸었다.
```java
speedx = speedx + random(10) - 5;
```

## 지시사항 6
화면의 크기를 500 x 500 크기로 바꿨다.
