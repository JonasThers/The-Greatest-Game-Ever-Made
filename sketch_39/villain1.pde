//Jonas Thers
//Assignment 39

class Villain {
  int villainypos;
  PImage villainsprite;
  int villainxpos;
  int villainwidth;
  int villainheight;
  color villaincolor;
  int villainvelocity = 7;
  PImage topvillain;
  int villainspritex = 35;
  int villainspritey = 70;
  int frame = 0;
  int frameMax = 2;
  int durationOneFrame = 100; 
  int ticksLast = millis(); 

  Villain(int vypos, int vxpos, int vw, int vh, color vc) 
  {
    villainypos = vypos;
    villainxpos = vxpos;
    villainwidth = vw;
    villainheight = vh;
    villaincolor = vc;
  }

  void display() 
  {
    stroke(1);
    textSize(15); 
    topvillain = loadImage("topvillain.png");
    PImage f = topvillain.get(1 + (frame * 35), 5, 35, 70);
    image(f, villainxpos, villainypos);  
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

    fill(255, 255, 255);
  }


  void move() 
  {
    villainxpos = hero1.xpos;
  }

  void message() 
  {
    if (hero1.xpos <600) 
    {
      text("Hahaha," + "\n"  + "you will never make it!", villainxpos + 40, villainypos);
    } else if (hero1.xpos >= 600) 
    {
      text("Stop while you still can!", villainxpos + 40, villainypos);
    }
  }
}
