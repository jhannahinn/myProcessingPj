PVector base1;
PVector base2;
float baseLength;

PVector[] coords;

PVector position;
PVector velocity;
float r = 6;
float speed = 6.5;

void setup() {
  size(640, 360);
  
  fill(128);
  base1 = new PVector(0, height-150);
  base2 = new PVector(width, height);
  createGround();
  
  position = new PVector(width/2, 0);
  
  velocity = PVector.random2D();
  velocity.mult(speed);
}

void draw() {
  fill(0, 12);
  noStroke();
  rect(0, 0, width, height);
  
  fill(200);
  quad(base1.x, base1.y, base2.x, base2.y, base2.x, height, 0, height);
  
  PVector baseDelta = PVector.sub(base2, base1);
  baseDelta.normalize();
  PVector normal = new PVector(-baseDelta.y, baseDelta.x);
  
  noStroke();
  fill(255);
  ellipse(position.x, position.y, r*2, r*2);
  
  position.add(velocity);
  
  PVector incidence = PVector.mult(velocity, -1);
  incidence.normalize();
  for (int i = 0; i < coords.length; i++) {
    if (PVector.dist(position, coords[i]) < r) {
      
      float dot = incidence.dot(normal);
      
      velocity.set(2 * normal.x * dot - incidence.x, 2 * normal.y * dot - incidence.y, 0);
      velocity.mult(speed);
      
      stroke(255, 128, 0);
      line(position.x, position.y, position.x - normal.x * 100, position.y - normal.y * 100);
    }
  }
  
  if (position.x > width - r) {
    position.x = width - r;
    velocity.x *= -1;
  }
  if (position.x < r) {
    position.x = r;
    velocity.x *= -1;
  }
  if (position.y < r) {
    position.y = r;
    velocity.y *= -1;
    // randomize base top
    base1.y = random(height - 100, height);
    base2.y = random(height - 100, height);
    createGround();
  }
}

void createGround() {
  // calculate length of base top
  baseLength = PVector.dist(base1, base2);
  
  // fill base top coordinate array
  coords = new PVector[ceil(baseLength)];
  for (int i = 0; i < coords.length; i++) {
    coords[i] = new PVector();
    coords[i].x = base1.x + ((base2.x - base1.x) / baseLength) * i;
    coords[i].y = base1.y + ((base2.y - base1.y) / baseLength) * i;
  }
}
