# [과제 9]
translate(), scale(), rotate() 함수 등은 좌표계를 평행이동하거나, 확대/축소하거나, 회전시키는 등 영향을 미친다.
pushMatrix()와 popMatrix() 메서드는 pushMatrix() 당시의 좌표계를 저장해두었다가 popMatrix()를 통해 다시 불러오는 것으로, 도형을 만들 때 바꾼 좌표계를 직접 되돌릴 필요 없이 사용할 수 있다.
beginShape() 메서드를 호출한 후 vertex(x, y) 함수를 여러 번 호출해주면 호출한 vertex끼리 연결된다. 마지막에 endShape()를 호출해야 한다.
반복문과 수식을 이용한다면 매우 많은 vertex들을 이용해 곡선을 표현해줄 수도 있다.

```processing
for(int i=225;i>=-45;i--)
{
  vertex(25+25*cos(radians(i)), 25-25*sin(radians(i)));
}
```
사람의 머리를 원으로 표현하였다. (0, 50)에서 시작해서 (50, 50)에서 끝나는 호가 270도인 부채꼴이다.

```processing
vertex(50, 50);
vertex(70, 50);
vertex(70, 150);
vertex(55, 150);
//(중략)
vertex(-5, 150);
vertex(-20, 150);
vertex(-20, 50);
vertex(0, 50);
```
사람의 몸통을 직접 vertex로 연결해주었다.
실행화면은 아래와 같이 나온다.
<img width="912" alt="스크린샷 2023-03-15 오후 11 52 59" src="https://user-images.githubusercontent.com/74486197/225348109-53270305-d504-417f-bc65-2b81500c3e03.png">
