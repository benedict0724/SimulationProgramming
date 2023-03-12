# [과제 5]
```processing
float[] heights; // 높이 배열 선언 

void setup() {

 size(400, 200); // 화면 크기 조절

 smooth(); // 도형의 모서리를 둥글게 만들어 준다.

}

 

void draw() {

 background(255); // 배경의 색깔을 흰색으로 바꾼다.

 float e = 2.71828183; // 자연상수 정의

 float[] heights = new float[width]; // 높이 배열을 화면의 너비와 동일한 크기로 만들어 준다.

 float m = 0;

 float sd = map(mouseX,0,width,0.4,2); // [0, width] 구간에서 mosueX와 [0.4, 2]에서 대응되는 겂을 찾는 함수이다.

 for (int i = 0; i < heights.length; i++) {

   float xcoord = map(i,0,width,-3,3);

   float sq2pi = sqrt(2*PI); //루트 2파이

   float xmsq = -1*(xcoord-m)*(xcoord-m); // x좌표와 m의 차이의 제곱에 -1을 곱한다.

   float sdsq = sd*sd; // sd의 제곱

   heights[i] = (1 / (sd * sq2pi)) * (pow(e, (xmsq/sdsq)));  // i번 위치의 높이를 구하는 공식이다.

 }

 //위 반복문에서는 Bell Curve라는 곡선을 계산하고 값을 넣는다.

 stroke(0); // 테두리를 검은색으로 바꾼다.

 strokeWeight(2); //테두리의 두꼐를 2로 바꾼다.

 noFill(); //채우지 않는다.

 beginShape();

 for (int i = 0; i < heights.length-1; i++) {

   float x = i;

   float y = map(heights[i], 0, 1, height-2, 2);

   vertex(x, y);

 }
 
 //위 반복문에서는 계산된 Bell Curve를 화면에 보여준다.

 endShape();

}
```
