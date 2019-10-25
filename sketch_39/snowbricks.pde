//Jonas Thers
//Assignment 39

class Bricksnow
{
  int x=0;
  int y=700;
  int w=55;
  int h=55;
  //color brickc = (255,255,0);
  PImage platform;

  Bricksnow()
  {
  }

  void display()
  {
    platform = loadImage("platformsnow.png");
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
