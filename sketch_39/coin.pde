//Jonas Thers
//Assignment 39

class Coin
{
  int x=0;
  int y=-50;
  int w=44;
  int h=44;
  PImage coinbaby;
  boolean isOn=false;
  int cellsize = 2; 


  Coin()
  {
  }

  void display()
  {
    if (isOn)
    {
      coinbaby = loadImage("coin.png");
      image(coinbaby, x, y);
    }
  }

  void coinswitchOn(int posX, int posY)
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

  void switchOff()
  {
    isOn=false;
  }

  void hitcoin() 
  {
    println("Test");
    isOn=false;
  }
}
