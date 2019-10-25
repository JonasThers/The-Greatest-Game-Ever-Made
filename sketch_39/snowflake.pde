//Jonas Thers
//Assignment 39

class Snowstorm {
  PVector position;
  PVector velocity;
  PVector acceleration;

  Snowstorm(PVector l) 
  {
    acceleration = new PVector(0, 0.15);
    velocity = new PVector(random(-1, 19), random(-2, 0));
    position = l.copy();
  }

  void run() 
  {
    update();

    if (weAreInLevel==1) 
    { //So the storm has already started when the player reaches the given leverl. Otherwise the storm would only start when the player reaches it. Now the storm is always running, but only displayed in the given level
      display();
    }
  }


  void update() 
  {
    velocity.add(acceleration);
    position.add(velocity);
  }


  void display() 
  {
    stroke(255);
    fill(255);
    ellipse(position.x, position.y, 20, 8);
  }
}
