//Jonas Thers
//Assignment 39

class Flying
{
  int x=0;
  int y=500;
  int w=44;
  int h=44;
  int velocityup=2;
  boolean isOn=false;
  PImage flyingskull;
  int iTicksLastUpdate = 0;
  int frame = 0;
  int frameMax = 3;
  int durationOneFrame = 100; 
  int ticksLast = millis();

  Flying()
  {
  }

  void display()
  {
    if (isOn)
    {
      flyingskull = loadImage("skull.png");
      PImage f = flyingskull.get(1 + (frame * 54), 5, 46, 50);
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
  }

  void flyswitchOn(int posX, int posY)
  {
    x=posX;
    y=posY;
    isOn=true;
  }

  void move() 
  {
    for (int i=0; i<flys.length; i++)

    {

      if (weAreInLevel==2) 
      {
        y -= velocityup  * float(millis() - iTicksLastUpdate) * 0.001;
        iTicksLastUpdate = millis();

        if (y==300) 
        {
          y = y + (velocityup * 150);
          //println("Stop");
        }
      }
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
}
