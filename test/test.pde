class Character {
  private PImage[] motion;
  private int motionCnt=0;
  
  private float posX;
  private float posY;
  
  public Character(float posX, float posY) {
    this.posX = posX;
    this.posY = posY;
      
    motion = new PImage[8];
    motion[0] = loadImage("C:\\dev\\res\\1.png");
    motion[1] = loadImage("C:\\dev\\res\\2.png");
    motion[2] = loadImage("C:\\dev\\res\\3.png");
    motion[3] = loadImage("C:\\dev\\res\\4.png");
    motion[4] = loadImage("C:\\dev\\res\\5.png");
    motion[5] = loadImage("C:\\dev\\res\\6.png");
    motion[6] = loadImage("C:\\dev\\res\\7.png");
    motion[7] = loadImage("C:\\dev\\res\\8.png");
    
    motionCnt=0;
  }
  
  void show() {
    image(motion[motionCnt], posX, posY, 50, 50);
    
    motionCnt++;
    if (motionCnt == 8)
      motionCnt = 0;
  }
}

Character me;


void setup(){
  size(640, 360);
  frameRate(30);
  me = new Character(width/2, height/2);
}



void draw(){
  background(255);
  me.show();
}
