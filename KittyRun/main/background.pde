class Floor{
  PImage[] diversity;
  PImage[] motion;
  float posX, posY;
  int speed;
  int check;
  
  public Floor(int _speed) {
    posX = 120;
    posY = 220;
    diversity = new PImage[3];
    speed = _speed;
    check = 0;
    diversity[0] = loadImage("floor1.png");
    diversity[1] = loadImage("floor2.png");
    diversity[2] = loadImage("floor3.png");
  }
  
  void run() {
    if (check == 0) {
      motion = new PImage[7];
      for (int i = 0; i < 7; i++) {
        motion[i] = diversity[(int)random(3)];
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
      motion[6] = diversity[(int)random(3)];
      posX = 120;
      check = 1;
    }
    image(motion[0], posX + (0 - 1) * 120, posY, 120, 120);
    image(motion[1], posX + (1 - 1) * 120, posY, 120, 120);
    image(motion[2], posX + (2 - 1) * 120, posY, 120, 120);
    image(motion[3], posX + (3 - 1) * 120, posY, 120, 120);
    image(motion[4], posX + (4 - 1) * 120, posY, 120, 120);
    image(motion[5], posX + (5 - 1) * 120, posY, 120, 120);
    image(motion[6], posX + (6 - 1) * 120, posY, 120, 120);
  }
} Floor floors;
