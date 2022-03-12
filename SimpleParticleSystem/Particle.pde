class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l) {
    acceleration = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    position = l.copy();
    lifespan = 255.0;
  }
  
  void run() {
    update();
    display();
  }
  
  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }
  
  // Method to display
  void display() {
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 8, 8);
  }
  
  // Is the particle still usefull?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
