int rad = 60;

PVector position;
PVector speed;

void setup()
{
  size(640, 360);
  noStroke();;
  frameRate(30);
  ellipseMode(RADIUS);
  position = new PVector(width/2, height/2);
  speed = new PVector(2.8, 2.2);
}

void draw()
{
  background(102);
  
  position.x = position.x + speed.x;
  position.y = position.y + speed.y;
  
  if (position.x > width-rad || position.x < rad) {
    speed.x *= -1;
  }
  if (position.y > height-rad || position.y < rad) {
    speed.y *= -1;
  }
  
  ellipse(position.x, position.y, rad, rad);
}
