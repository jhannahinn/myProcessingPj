class Flower{
  PImage[] diversity;
  // int[] colLengthX, colLengthY;
  PImage[] motion;
  float posX, posY;
  float defX = 200;
  int speed;
  int check;
  
  public Flower(int _speed) {
    posX = defX;
    posY = 170;
    diversity = new PImage[2];
    // colLengthX = new int[2];
    // colLengthY = new int[2];
    speed = _speed;
    check = 0;
    diversity[0] = loadImage("empty.png");
    diversity[1] = loadImage("obstacle1.png");
    // colLengthX[0] = 0;
    // colLengthX[1] = 10;
    // colLengthY[0] = 0;
    // colLengthY[1] = 10;
  }
  
  void run() {
    if (check == 0) {
      motion = new PImage[7];
      for (int i = 0; i < 4; i++) {
        motion[i] = diversity[0];
      }
      for (int i = 4; i < 7; i++) {
        motion[i] = diversity[(int)random(2)];
      }
      check = 1;
    }
    else if (check == 1) {
      posX -= speed;
      if (posX == 0) check = 2;
    }
    else if (check == 2) {
      for (int i = 0; i < 6; i++) {
        motion[i] = motion[i + 1];
      }
      motion[6] = diversity[(int)random(2)];
      posX = defX;
      check = 1;
    }
    
    image(motion[0], posX + (0 - 1) * defX, posY, 90, 90);
    image(motion[1], posX + (1 - 1) * defX, posY, 90, 90);
    image(motion[2], posX + (2 - 1) * defX, posY, 90, 90);
    image(motion[3], posX + (3 - 1) * defX, posY, 90, 90);
    image(motion[4], posX + (4 - 1) * defX, posY, 90, 90);
    image(motion[5], posX + (5 - 1) * defX, posY, 90, 90);
    image(motion[6], posX + (6 - 1) * defX, posY, 90, 90);
  }
} Flower flowers;
