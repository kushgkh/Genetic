class Drawer
{
  float size = 50;
  
  void board()
  {
    stroke(0);
    strokeWeight(10);
    line(400, 200 , 400 , 800);
    line(600, 200 , 600 , 800);
    line(200, 400 , 800 , 400);
    line(200, 600 , 800 , 600);
  }
  
  void cross(int x , int y)
  {
    stroke(0);
    strokeWeight(5);
    line(x-size , y-size , x + size , y + size);
    line(x-size , y+size , x + size , y - size);    
  }
  
  void circle(int x , int y)
  {
    stroke(0);
    strokeWeight(5);
    noFill();
    float rad = sqrt(size  * size * 7.0);
    ellipse(x,y , rad , rad);
  }
  void drawBox(int x , int y , float value)
  {
    noStroke();
    fill( 0, value * 255,0 , 150);
    rect(210 + 200 * x, 210 + 200 * y, 180, 180, 7);
  }
  
  void move(int sq , int val)
  {
     
    int x = sq % 3;
    int y = sq / 3;
    if(val == 0)
    {
      cross(300 + 200 * x , 300 + 200 * y);
    }
    else if(val != -1)
    {
       circle(300 + 200 * x , 300 + 200 * y);
    }   
    
  }   
}
