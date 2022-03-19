class Obj{
  PImage[] diversity;
  float posX, posY;
  
}

class CatChar{
  PImage[] motion;
  float posX, posY;
  float defX, defY;
  int motionIndex;
  int motionIndexCounter;
  int speed;
  int check;
  int jumpingHeight;
  PImage jumpingMotion;
  
  public CatChar() {
    posX = 80; defX = 80;
    posY = 150; defY = 150;
    motion = new PImage[4];
    motionIndexCounter = 0;
    speed = 3;
    check = 1;
    jumpingHeight = 150;
    motion[0] = loadImage("kitty1.png");
    motion[1] = loadImage("kitty2.png");
    motion[2] = loadImage("kitty5.png"); 
    motion[3] = loadImage("kitty6.png");
    jumpingMotion = loadImage("kittyJump.png");
  }
  
  void run() {
    if (check == 1) {
      if (motionIndexCounter < 4 * speed -1) motionIndexCounter++;
      else check = 0;
    }
    if (check == 0) {
      check = 1;
      motionIndexCounter = 0;
    }
    motionIndex = motionIndexCounter / speed;
    image(motion[motionIndex], posX, posY, 120, 120);
  }
  
  void jump() {
    if (check == 1) {
      check = 2; // go up
    }
    if (check == 2) { // upside
      posY -= 10;
      if (posY <= defY - jumpingHeight) {
        check = 3; // go down
      }
    }
    if (check == 3) { // downside
      posY += 10;
      if (posY >= defY) {
        check = 0;
      }
    }
    image(jumpingMotion, posX, posY, 120, 120);
  }
} CatChar myKitty;
