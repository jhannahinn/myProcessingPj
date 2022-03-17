class CatChar{
  PImage[] motion;
  float posX, posY;
  int motionIndex;
  int motionIndexCounter;
  int speed;
  int check;
  
  public CatChar() {
    posX = 100;
    posY = 130;
    motion = new PImage[4];
    motionIndexCounter = 0;
    speed = 3;
    check = 1;
    motion[0] = loadImage("kitty1.png");
    motion[1] = loadImage("kitty2.png");
    motion[2] = loadImage("kitty5.png"); 
    motion[3] = loadImage("kitty6.png");
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
} CatChar myKitty;
