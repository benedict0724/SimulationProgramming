
void setup() { 
  size(500, 500);
} 

void draw() { 
  for(int i=1;i<=50;i++)
  {
    float xloc = randomGaussian();
    
    float sd = 50;
    float mean = width/2;
    
    xloc = (xloc * sd) + mean;
    if(xloc < 0) xloc = 0;
    if(xloc > width) xloc = width;
    
    float yloc = randomGaussian();
    mean = height/2;
    yloc = (yloc * sd) + mean;
    if(yloc < 0) yloc = 0;
    if(yloc > height) yloc = height;
    
    sd = 100;
    mean = 128;
    int a = int(randomGaussian() * sd + mean);
    int b = int(randomGaussian() * sd + mean);
    int c = int(randomGaussian() * sd + mean);
    fill(max(0, min(255, a)), max(0, min(255, b)), max(0, min(255, c)));
    noStroke();
    rect(xloc, yloc, 2, 2);
  }
} 
