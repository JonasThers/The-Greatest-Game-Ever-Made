//Jonas Thers
//Assignment 39

class Trap
{
  int x=0;
  int y=500;
  int w=50;
  int h=50;
  //color brickc = (255,255,0);
  PImage platform;
  boolean isOn=false;

  Trap(int xpos, int ypos, int wid, int he)
  {
    x = xpos;
    y = ypos;
    w = wid;
    h = he;
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
    isOn=true;
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

  void movetrap() 
  {
    x = x+2;
    land = true;

    if (x>=920) 
    {
      y = y +25; //Causing the platform to drop all of a sudden
      text("WATCH OUT", 900, 300);
    }
  }
}
