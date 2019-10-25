//Jonas Thers
//Assignment 39

class Snowflakes {
  ArrayList<Snowstorm> particles;
  PVector origin;

  Snowflakes(PVector position) 
  {
    origin = position.copy();
    particles = new ArrayList<Snowstorm>();
  }

  void addParticle() 
  {
    particles.add(new Snowstorm(origin));
  }

  void run() 
  {
    for (int i = particles.size()-1; i >= 0; i--) 
    {
      Snowstorm p = particles.get(i);
      p.run();
    }
  }
}
