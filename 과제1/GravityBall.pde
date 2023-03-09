
Ball[] balls;

// Global gravity variable
float gravity = 0.1;  
void setup() { 
  size(500, 500); 
  smooth();
  
  balls = new Ball[100];
  for(int i=0;i<100;i++) balls[i] = new Ball(random(width), random(height), random(20));
} 

void draw() { 
  background(255); 
  
  for(int i=0;i<100;i++) balls[i].display();
  for(int i=0;i<100;i++) balls[i].update();
  
} 
