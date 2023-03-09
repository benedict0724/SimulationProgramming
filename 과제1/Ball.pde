
class Ball {

  float x;       // x location of square 
  float y;       // y location of square 
  float speedx;
  float speedy; // speed of square 
  float w;       // size
  color c;

  // Ball constuctor
  Ball(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speedx = speedy = 0;
    c = color(random(255), random(255), random(255));
  }


  void display() {
    // Display the square 
    fill(c);
    stroke(0); 
    ellipse(x,y,w,w); 
  }

  void update() {
    // Add speed to location
    x = x + speedx;
    y = y + speedy; 

    // Add gravity to speed
    speedy = speedy + gravity;
    speedx = speedx + random(10) - 5;

    // If square reaches the bottom 
    // Reverse speed 
    if (y < 0 || y > height) { 
      speedy = speedy * -0.95; 
    } 
    if(x > width || x < 0) {
      speedx = speedx * -0.95;
    }
  }
}
