//Jonas Thers
//Assignment 39

class Brick
{
  int x=0;
  int y=700;
  int w=55;
  int h=55;
  PImage platform;

  Brick()
  {
  }

  void display()
  { 
    platform = loadImage("platform.png");
    image(platform, x, y);
  } 

  void switchOn(int posX, int posY)
  {
    x=posX;
    y=posY;
  }

  int getX()
  {
    return x;
  }

  int getY()
  {
    return y;
  }

  int getH() 
  {
    return h;
  }

  int getW() 
  {
    return w;
  }
}
