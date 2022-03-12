class MyCharacter {
  private PImage[] motion;
  float posX, posY;
  private int motionIndex;
  
  public MyCharacter(float _posX, float _posY) {
    posX = _posX;
    posY = _posY;
    motion = new PImage[8];
    motionIndex = 0;
    motion[0] = loadImage("C:\\dev\\res\\1.png");
    motion[1] = loadImage("C:\\dev\\res\\2.png");
    motion[2] = loadImage("C:\\dev\\res\\3.png");
    motion[3] = loadImage("C:\\dev\\res\\4.png");
    motion[4] = loadImage("C:\\dev\\res\\5.png");
    motion[5] = loadImage("C:\\dev\\res\\6.png");
    motion[6] = loadImage("C:\\dev\\res\\7.png");
    motion[7] = loadImage("C:\\dev\\res\\8.png");
  }
  
  public void run() {
    image(motion[motionIndex++], posX, posY, 60.0f, 60.0f);
    if(motionIndex > 7) motionIndex=0;
  }
  
  public void move(float x, float y) {
    posX += x;
    posY += y;
  }
}

MyCharacter mCharacter;
float initX, initY;
boolean isJump = false;
boolean moveUp = false;
float speed = 7;

void setup() {
  size(640, 360);
  frameRate(30);
  initX = width/4;
  initY = height/2;
  
  mCharacter = new MyCharacter(initX, initY);
}

void draw() {
  background(255);
  mCharacter.run();
  
  if(keyPressed) {
    if(key == CODED) {
      if(keyCode == UP) {
        isJump = true;
        moveUp = true;
        mCharacter.posY -= speed;
      }
    }
  }
  
  if(isJump) {
    if(moveUp) {
      mCharacter.posY -= speed;
      if(mCharacter.posY < 50) {
        moveUp = false;
      }
    }
    else {
      mCharacter.posY += speed;
      if(mCharacter.posY >= initY) {
        mCharacter.posY = initY;
        isJump = false;
      }
    }
  }
}
