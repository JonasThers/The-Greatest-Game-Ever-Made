//Jonas Thers
//Assignment 39

class Boss
{

  int x=0;
  int y=500;
  int w=44;
  int h=44;
  PImage boss;

  Boss(int xpos, int ypos, int we, int he) 
  {
    x = xpos;
    y = ypos;
    w = we;
    h = he;
  }

  void display()
  {
    boss = loadImage("boss.png");
    image(boss, x, y);
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  int getH() {
    return h;
  }

  int getW() {
    return w;
  }

  void bossmessage() {
    text("I'M THE MIGHTY BOSS!! THOU SHALL NOT PASS!!", 250, 200);
  }
}
