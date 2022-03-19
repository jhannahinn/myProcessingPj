int isJump;
int objSpeed;

void setup() {
  size(640, 360);
  frameRate(30);
  
  objSpeed = 8;
  
  myKitty = new CatChar();
  floors = new Floor(objSpeed);
  flowers = new Flower(objSpeed);
  
  isJump = 0;
}

void draw() {
  background(255, 255, 255);
  noStroke();

  floors.run();
  flowers.run();
  
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
  
  myKitty.showCollisionBox();
}
