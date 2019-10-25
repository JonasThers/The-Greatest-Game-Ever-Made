//Jonas Thers
//Assignment 39

Level[] levels = new Level[6];
Fireball[] fireballs = new Fireball[150];
Flying[] flys = new Flying[3];
Hero hero1;
Highscore highscore1;
Level mainLevel;
Villain villain1;
Trap trap1;
Snowflakes ps;
Boss boss1;
Powerup powerup1;
boolean startgame=true;
boolean endgame=false;
boolean game=false;
boolean land=false;
boolean completegame=false;
boolean update=false;
int weAreInLevel=0;
int i;
int levelnumber = 1;
PImage herosprite;
int counterhero = 1;
int countdown = 700;
import processing.sound.*;
SoundFile jumpsound; 

void setup() {
  size(1200, 600); 
  ps = new Snowflakes(new PVector(30, -10));

  for (int i=0; i<levels.length; i++)
  {
    levels[i] = new Level(i);
  }

  for (int i = 0; i < fireballs.length; i++)
  {
    int x = 1100 + 400 * i; 
    fireballs[i] = new Fireball(x, 430, 34, 30);
  }

  jumpsound = new SoundFile(this, "jump.mp3");
  hero1 = new Hero(color(255, 0, 0), 20, 300, 50, 55);
  mainLevel = new Level(0);
  trap1 = new Trap(250, 480, 30, 30);
  villain1 = new Villain(150, 20, 20, 20, color(200));
  boss1 = new Boss(1100, 430, 30, 30);
  powerup1 = new Powerup(670, 300, 30, 30);
  highscore1 = new Highscore();
}

void draw() {
  //In the following, the screens for startup, game over and complete game are made
  if (startgame) 
  {
    background(0, 0, 0);
    fill(255, 255, 255);
    textSize(30);
    text("GREATEST GAME OF ALL TIME", 400, 100);
    textSize(20);
    text("Jump around on platforms! Good times are ahead!", 350, 230);
    text("Use the arrow keys to move and spacebar to jump!", 350, 300);
    text("First type in your name!" + "\n" + highscore1.highscoreName, 490, 350);
    startbutton();
  }

  if (endgame) 
  {
    if ((endgame == true) && (update == true))
    {
      highscore1.update();
      update = false;
    }
    background(0, 0, 0);
    fill(255, 255, 255);
    textSize(30);
    text("GAME OVER", 530, 30);
    text("Your score: " + highscore1.score, 517, 60);
    highscore1.getHighscore(); 
    highscore1.displayHighscore(); 
    highscore1.update();

    if (highscore1.score  <200) 
    {
      text("You can do better than that, try again!", 450, 100);
    } else if (highscore1.score >=200 && highscore1.score<350) 
    {
      text("Not bad, keep trying!", 540, 100);
    } else if (highscore1.score >=350) 
    {
      text("Wow, you have great potential!", 530, 100);
    }
    startbutton();
  } else if (completegame) 
  {
    if ((completegame == true) && (update == true))
    {
      highscore1.update();
      update = false;
    }
    background(0, 0, 0);
    fill(255, 255, 255);
    textSize(30);
    text("CONGRATULATIONS!", 460, 40);
    textSize(15);
    startbutton();
    highscore1.displayHighscore();
  } else if (game) 
  { //And now the game itself.
    background(0, 0, 0);
    fill(255, 255, 255);
    textSize(30);
    highscore1.getHighscore();
    ps.addParticle();
    ps.run();
    hero1.display();
    hero1.update();
    hero1.dontgoleft();
    hero1.nextlevel();
    hero1.collidewithtrap();
    hero1.collidewithboss();
    hero1.collidewithballs();
    hero1.collidewithpowerup();
    fill(255, 255, 255);
    text("Your score: " + highscore1.score, 20, 35);
    text("Level " + levelnumber, 20, 70);

    if (land) 
    {
      hero1.velocityY=0;
    } else if (land==false) 
    {
      hero1.velocityY= 4;
    }

    if (weAreInLevel == 0) 
    { //Each level are now set. Within each of these statements, the content of the given level are determined, meaning the methods that make up the level
      powerup1.display();
      powerup1.powerupmessage();
      powerup1.addpoints();
      villain1.display();
      villain1.move();
      villain1.message();
    } else if (weAreInLevel == 1) 
    {
      hero1.snowlevel();
    } else if (weAreInLevel == 2) 
    {
      levels[i].countdowntolol();
    } else if (weAreInLevel == 3) 
    {   
      trap1.display();
    } else if (weAreInLevel == 4) 
    {
      boss1.display();
      boss1.bossmessage();

      for (int i = 0; i < fireballs.length; i++)
      {
        fireballs[i].display();
        fireballs[i].update();
      }
    } else if (weAreInLevel == 5) 
    { 
      completegame=true;
      update=true;
    }
    levels[weAreInLevel].display();
  }
}


//Resets everything when the player starts a new game
void resetgame() {
  endgame=false;
  startgame=true;
  completegame=false;
  game=false;
  highscore1.highscoreName = "";
  highscore1.score=0;
  weAreInLevel = 0;
  levelnumber = 1;
  countdown = 700;
  powerup1.showing = false;
  powerup1.addpoints=false;
  trap1.x = 250;
  hero1.xpos = 20;
  hero1.ypos = 300;
  hero1.frame = 0;

  for (int i=0; i<levels.length; i++) //Goes through all the levels to make sure that all the coins respawn
  {
    levels[i].newcoins();
  }
}

void startbutton() {
  fill(0, 0, 0);
  rect(480, 400, 255, 50);
  stroke(255, 255, 255);
  fill(255, 255, 255);
  textSize(20);
  text("Click here to start", 520, 430);
}

void mousePressed() {
  if ( game==false && highscore1.highscoreName != "" /*The player has to input the username to continue*/ && endgame==false && (mouseX > 480) && (mouseX < 480+255) && (mouseY > 400) && (mouseY < 400+50)) 
  {
    game=true;
  }

  if (game==false && highscore1.highscoreName == "" && endgame==false && (mouseX > 480) && (mouseX < 480+255) && (mouseY > 400) && (mouseY < 400+50)) 
  {
    text("Type in your name first!", 50, 50);
  } else if (endgame==true && (mouseX > 480) && (mouseX < 480+255) && (mouseY > 400) && (mouseY < 400+50)) 
  {
    resetgame();
  } else if (completegame==true && (mouseX > 480) && (mouseX < 480+255) && (mouseY > 400) && (mouseY < 400+50)) 
  {
    resetgame();
  }
}

void keyPressed() 
{
  if (game == true && endgame== false && keyCode==RIGHT) 
  {
    hero1.moveright();
    hero1.frame = hero1.frame + 1; //Making the player animate when moving
  } else if (game==true && endgame== false && keyCode==LEFT) 
  {
    hero1.moveleft();
    hero1.frame = hero1.frame + 1;
  } else if (game==true && land==true /*so it can only jump when standing on platform*/ && completegame == false && keyCode==32) 
  {
    hero1.hop();
    land=false;
    jumpsound.play();
  } else if (game==true && land==true && keyCode==32 && keyCode==LEFT) 
  {
  } else 
  {
    hero1.frame = 0;
  }

  if (startgame == true && (keyCode==RETURN) || (keyCode==ENTER)) 
  {
  } else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) 
  {
    highscore1.highscoreName +=key;
  }
}
