int isJump;

void setup() {
  size(640, 360);
  frameRate(30);
  
  myKitty = new CatChar();
  floors = new Floor();
  
  isJump = 0;
}

void draw() {
  background(255, 255, 255);
  noStroke();

  floors.run();
  
  if (keyPressed) {
    if(key == CODED) {
      if (keyCode == UP) {
        isJump = 1;
      }
    }
  }
  
  if (isJump == 0) myKitty.run();
  else {
    if (myKitty.check == 0) {
      isJump = 0;
      myKitty.check = 1;
      myKitty.run();
    } // terminate jump action
    else myKitty.jump();
  }
}
