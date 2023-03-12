# [과제 6]
processing에는 현재 몇 번째 프레임인지 알 수 있는 frameCount라는 변수가 있어 직접 변수의 값을 수정해줄 필요가 없다.
```processing
float randX = random(0.03);
float randY = random(0.03); //draw 함수 첫 부분
  
float bright = noise(xoff+randX*sqrt(frameCount),yoff+randY*sqrt(frameCount), 0.01*frameCount)*255; // 반복문 내부
```
Z축은 프레임이 지남에 따라 천천히 증가하게 만들었고, frameCount의 제곱근에 0~0.03의 랜덤한 실수를 곱해줌으로써 시간이 지날수록 세게 흔들리는 노이즈를 만들었다.
랜덤한 실수는 각 픽셀마다 일정한 값으로 곱해주기 위해 매번 계산하는 게 아닌 draw함수를 시작할 때 계산해주었다.
원래는 frameCount의 제곱근이 아닌 frameCount의 값을 사용했으나 짧은 시간 안에 너무 빠르게 움직여서 제곱근을 씌워 증가 속도를 늦추었다.
