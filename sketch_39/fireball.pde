//Jonas Thers
//Assignment 39

class Fireball
{
  int x=0;
  int y=500;
  int w=44;
  int h=34;
  float ballmovement = 80;
  int iTicksLastUpdate = 0; 
  PImage fire;
  int frame = 0;
  int frameMax = 4;
  int durationOneFrame = 100; 
  int ticksLast = millis();

  Fireball(int xpos, int ypos, int we, int he)
  {
    x = xpos;
    y = ypos;
    w = we;
    h = he;
  }

  void display()
  {  
    fire = loadImage("fireballs.png");
    PImage f = fire.get(1 + (frame * 55), 1, 46, 50);
    image(f, x, y);
    int delta = millis() - ticksLast;

    if (delta >= durationOneFrame)
    {
      frame++;
      if (frame >= frameMax) 
      {
        frame = 0;
        ticksLast = millis(); 
        ticksLast += delta;
      }
    }
  }

  void update() 
  {
    x -= ballmovement * float(millis() - iTicksLastUpdate) * 0.001;
    iTicksLastUpdate = millis();
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
