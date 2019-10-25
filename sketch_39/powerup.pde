//Jonas Thers
//Assignment 39

class Powerup
{
  int x=0;
  int y=500;
  int w=44;
  int h=44;
  PImage secret;
  boolean showing = false;
  boolean addpoints = false;


  Powerup(int xpos, int ypos, int we, int he)
  {
    x = xpos;
    y = ypos;
    w = we;
    h = he;
  }

  void display()
  {
    if (showing) {
      secret = loadImage("secret.png");
      image(secret, x, y);
    }
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

  void powerupmessage() 
  {
    if (showing) {
      text("You found a secret!", x, y-50);
    }
  }

  void addpoints() 
  {
    if (addpoints) 
    {
      highscore1.score = 500;
      addpoints =false;
    }
  }
}
