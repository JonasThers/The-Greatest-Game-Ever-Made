//Jonas Thers
//Assignment 39

class Level
{
  int id=-1;
  int iTicksLastUpdate = 0; 
  float countdownspeed = 1;
  Brick[] bricks = new Brick[100];
  Bricksnow[] brickssnows = new Bricksnow[100];
  Coin[] coins = new Coin[100];
  Flying[] flys = new Flying[100];
  Hero hero1;

  Level(int l)
  {
    id=l;
    String[] lines = loadStrings("level"+id+".txt"); //Loads the strings of the text-files in the data folder

    for (int i=0; i<bricks.length; i++)
    {
      bricks[i] = new Brick();
    }
    for (int i=0; i<brickssnows.length; i++)
    {
      brickssnows[i] = new Bricksnow();
    }
    for (int i=0; i<coins.length; i++)
    {
      coins[i] = new Coin();
    }
    for (int i=0; i<flys.length; i++)
    {
      flys[i] = new Flying();
    }

    //hero1 = new Hero(color(255,0,0), 20, 300, 50, 50);
    int currentBrick=0;
    int currentCoin=0;
    int currentFlying=0;
    int currentSnow=0;

    for (int i=0; i<lines.length; i++)  //Now we go through the lines of the given text-files
    {
      for (int j=0; j<lines[i].length(); j++)  //Now we go through the rows of the given text-files
      {
        if (lines[i].charAt(j)=='1') //When the program finds a 1, a brick is to be set to displayed
        {
          bricks[currentBrick].switchOn(j*40, i*60);
          currentBrick++;
        } else if (lines[i].charAt(j)=='2') //When the program finds a 2, a coin is displayed
        {
          coins[currentCoin].coinswitchOn(j*40, i*60);
          currentCoin++;
        } else if (lines[i].charAt(j)=='3') //When the program finds a 3, a flying skull is displayed
        {
          flys[currentFlying].flyswitchOn(j*40, i*60);
          currentFlying++;
        } else if (lines[i].charAt(j)=='4') //When the program finds a 4, a snow brick is displayed
        {
          brickssnows[currentSnow].switchOn(j*40, i*60);
          currentSnow++;
        }
      }
    }
  }

  void display()
  {
    fill(255);
    for (int i=0; i<bricks.length; i++)
    {
      bricks[i].display();
    }
    for (int i=0; i<brickssnows.length; i++)
    {
      brickssnows[i].display();
    }
    for (int i=0; i<coins.length; i++)
    {
      coins[i].display();
    }
    if (weAreInLevel == 2) {
      for (int i=0; i<flys.length; i++)
      {
        flys[i].display();
        flys[i].move();
      }
    }
  }

  //Collision detection from the different objects
  void collide(float xpos, float ypos, float herowidth, float heroheight)
  {
    for (int i=0; i<bricks.length; i++)
    {  
      if ((xpos+herowidth>=bricks[i].getX()) &&
        (xpos<bricks[i].getX()+bricks[i].getW()-20) &&
        (ypos+heroheight>=bricks[i].getY()-3) &&
        (ypos<bricks[i].getY()+bricks[i].getH()))
      {
        land=true;
        break;
      } else 
      {
        land=false;
      }
    }
  }

  void collidesnow(float xpos, float ypos, float herowidth, float heroheight)
  {
    for (int i=0; i<brickssnows.length; i++)
    {

      if (weAreInLevel==1 &&(xpos+herowidth>=brickssnows[i].getX()) &&
        (xpos<brickssnows[i].getX()+brickssnows[i].getW()-20) &&
        (ypos+heroheight>=brickssnows[i].getY()-3) &&
        (ypos<brickssnows[i].getY()+brickssnows[i].getH()))
      {
        land=true;
        break;
      } else {
        land=false;
      }
    }
  }

  void coincollide(float xpos, float ypos, float herowidth, float heroheight)
  {
    for (int i=0; i<coins.length; i++)
    {
      if (coins[i].isOn == true && (xpos+herowidth>=coins[i].getX()) &&
        (xpos<coins[i].getX()+coins[i].getW()) &&
        (ypos+heroheight>coins[i].getY()) &&
        (ypos<coins[i].getY()+coins[i].getH()-20))
      {
        highscore1.score = highscore1.score + 50;
        coins[i].isOn = false;
      }
    }

    for (int i=0; i<flys.length; i++)
    {
      if (flys[i].isOn == true && (xpos+herowidth>=flys[i].getX()) &&
        (xpos<flys[i].getX()+flys[i].getW()) &&
        (ypos+heroheight>flys[i].getY()) &&
        (ypos<flys[i].getY()+flys[i].getH()-20))
      {
        endgame=true;
      }
    }
  }

  //Respawing the coins which is used when the game is reset
  void newcoins() {
    //println("Tester");
    for (int i=0; i<coins.length; i++)
    {
      coins[i].isOn = true;
    }
  }

  void countdowntolol() {
    text("Watch out! Countdown!", 390, 170);
    text(countdown, 529, 200);
    countdown -= countdownspeed * float(millis() - iTicksLastUpdate) * 0.001;
    iTicksLastUpdate = millis();  
    if (weAreInLevel ==2 && countdown == 0)
    {
      endgame= true;
    }
  }
}
