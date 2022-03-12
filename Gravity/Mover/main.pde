Mover[] movers = new Mover[10];

Liquid liquid;

void setup() {
  size(640, 360);
  reset();
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(0);
  
  liquid.display();
  
  for (Mover mover : movers) {
    if (liquid.contains(mover)) {
      PVector drag = liquid.drag(mover);
      mover.applyForce(drag);
    }
    
    PVector gravity = new PVector(0, 0.1 * mover.mass);
    mover.applyForce(gravity);
    
    mover.update();
    mover.display();
    mover.checkEdges();
  }
  
  fill(255);
  text("click mouse to reset", 10, 30);
}

void mousePresssed() {
  reset();
}

void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 3), 40 + i*70, 0);
  }
}
