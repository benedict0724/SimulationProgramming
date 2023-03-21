# [과제 19]
'먼 별'이라는 제목의 문제를 골랐다. 문제를 요약하면
* 별들이 $N$개 주어진다. 별을 $T$일까지 관찰할 것이다.
* 하루가 지나면 별이 $(dx, dy)$만큼 이동한다.
* 가장 멀리 떨어진 별 사이의 거리의 제곱이 가장 작은 날과 그때 거리의 제곱을 구하여라.

먼 별을 풀기 위해는 다음 과정이 필요하다.
* 현재 날짜를 0일부터 $T$일까지 바꾸면서 별들을 이동시킨다.
* 이동시킨 별에 대해 convex hull을 구한다.
* convex hull에서 rotating calipers 알고리즘을 사용해 가장 먼 두 점 사이의 거리의 제곱을 구한다.

이를 구현하기 위해 process라는 변수를 만들었고, process라는 변수를 바꾸면서 draw함수에서 해야 할 일을 정해주었다.

process = 1일 때는 정렬된 배열에서 convex hull을 구한다.
```processing
if(process == 1) {
  if(idx == N) {
    //변수 초기화 후 다음 프로세스로 넘어감
  } else if(idx == 0) {
    convex.add(stars[0]);
    idx++;
  } else {
  
    Line l = new Line(stars[idx].location.x, stars[idx].location.y, convex.get(0).location.x, convex.get(0).location.y);
    l.highlight();
    //현재 보고 있는 정점 표시
    
    if() {
    } else {
    }
    //convex할 경우 stack에 추가, 아니면 stack에서 top을 제거
  }
}
```

process = 2일 때는 convex hull에서 rotating calipers로 가장 먼 두 점을 구한다.
```processing
else if (process == 2) {
  if(idx == convex.size()) {
    //변수 초기화 후 다음 프로세스로 넘어감
  } else {
  
    if(){
    } else {
    }
    //ccw를 이용해 보고 있는 두 정점을 업데이트

  }
}
```

process = 3일 때는 별들의 위치를 바꾼 후 정렬한다.
```processing
else if(process == 3) {
  convex = new ArrayList<Star>();
  if(nowT != -1) for(int i=0;i<N;i++) stars[i].update(); //별들의 위치 업데이트
  
  if(nowT == T) {
    process = 4;
  } else {
    process = 1; //별들의 위치를 바꿔준 후 process를 1부터 다시 시작해야 함
    nowT++;

    Arrays.sort(stars, new Comparator<Star>() {
      @Override
      public int compare(Star s1, Star s2) {
      }
    });
    
    //별들을 x좌표 순서로 정렬

    Star begin = stars[0];

    Arrays.sort(stars, new Comparator<Star>() {
      @Override
      public int compare(Star s1, Star s2) {
      }
    });
    
    //가장 왼쪽에 있는 별들로부터 시계방향 정렬
  }
}
```
process = 4일 때는 결과를 표시하였다.
