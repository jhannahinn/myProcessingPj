void setup() {
  size(640, 360);
  frameRate(30);
  
  myKitty = new CatChar();
}

void draw() {
  background(255, 255, 255);
  noStroke();

  myKitty.run();
}
