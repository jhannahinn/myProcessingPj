ParticleSystem ps;

void setup() {
  size(640, 360);
  ps = new ParticleSystem(new PVector(width/2, height/2));
  frameRate(60);
}

void draw() {
  background(0);
  ps.addParticle();
  ps.run();
}
