//Jonas Thers
//Assignment 39

class Hero {
  color c;
  int xpos;
  int ypos;
  float herowidth;
  float heroheight;
  int result;
  int i;
  int velocityY = 10;
  int velocityX = 5;
  int jumpForce = 145;
  PImage herosprite;
  int spritherox = 40;
  int spritheroy = 56;
  int frame = 0;
  int frameMax = 3; 
  int iTicksLastUpdate = 0; 

  //Constructor for the hero
  Hero(color tempc, int tempXpos, int tempYpos, float bwi, float bhe) 
  {
    c = tempc;
    xpos = tempXpos;
    ypos = tempYpos;
    herowidth = bwi;
    heroheight = bhe;
  }

  void display() 
  {
    herosprite = loadImage("herosprite.png");
    PImage f = herosprite.get(1 + (frame * 54), 1, 46, 99);
    image(f, xpos, ypos);

    if (frame >= frameMax) 
    {
      frame = 0;
    }
  }

  void update() 
  {
    ypos += velocityY;

    if (ypos > 580) 
    {
      endgame=true;
      update = true;
      ypos= 300;
      xpos=20;
    }

    levels[weAreInLevel].collide(xpos, ypos, herowidth, heroheight);

    if (weAreInLevel==1) 
    {
      levels[weAreInLevel].collidesnow(xpos, ypos, herowidth, heroheight);
    }

    levels[weAreInLevel].coincollide(xpos, ypos, herowidth, heroheight);
  }

  void nextlevel() 
  {

    if (xpos > 1200) 
    {
      weAreInLevel = weAreInLevel +1;
      xpos = 5;
      ypos = 420;
      levelnumber = levelnumber +1;
    } else if (weAreInLevel ==5) 
    {
      completegame=true;
    }
  }

  void snowlevel() { //To make the hero slip through the snow level

    if (weAreInLevel == 1) 
    {
      xpos = xpos + 1;
    }
  }

  void hop() 
  { 
    if (key == 32) 
    {
      ypos -=  jumpForce;
    }
  }



  void moveright() 
  {
    if (keyCode==RIGHT)
      xpos += velocityX;
  }

  void moveleft() 
  {  
    //if (keyCode == LEFT) {
    xpos -= velocityX;
    //}
  }

  void dontgoleft() 
  {
    if (xpos < 1) 
    { 
      xpos = 1;
    }
  }

  void collidewithtrap() 
  {
    if ((xpos+herowidth>=trap1.getX()) &&
      (xpos<trap1.getX()+trap1.getW()) &&
      (ypos+heroheight>=trap1.getY()) &&
      (ypos<trap1.getY()+trap1.getH())) 
    {
      //land=true;
      trap1.movetrap();
    }
  }

  void collidewithboss() 
  {
    if (weAreInLevel==4) 
    {
      if ((xpos+herowidth>=boss1.getX()) &&
        (xpos<boss1.getX()+boss1.getW()) &&
        (ypos+heroheight>=boss1.getY()) &&
        (ypos<boss1.getY()+boss1.getH())) 
      {
        endgame=true;
      }
    }
  }

  void collidewithpowerup() 
  {
    if (weAreInLevel==0) 
    {
      if ((xpos+herowidth>=powerup1.getX()) &&
        (xpos<powerup1.getX()+powerup1.getW()) &&
        (ypos+heroheight>=powerup1.getY()) &&
        (ypos<powerup1.getY()+powerup1.getH())) 
      {
        powerup1.showing=true;
        powerup1.addpoints=true;
      }
    }
  }

  void collidewithballs() 
  {
    if (weAreInLevel==4) 
    {
      for (int i = 0; i < fireballs.length; i++)
      {
        if ((xpos+herowidth>=fireballs[i].getX()) &&
          (xpos<fireballs[i].getX()+fireballs[i].getW()) &&
          (ypos+heroheight>=fireballs[i].getY()+10) &&
          (ypos<fireballs[i].getY()+fireballs[i].getH())) 
        {
          endgame=true;
        }
      }
    }
  }
}
