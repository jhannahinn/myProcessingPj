float posX, posY;
float buttonW, buttonH;
int on;

void setup() {
  size(640, 360);
  noStroke();
  posX=width/2;
  posY=height/2;
  buttonW = 60.0f;
  buttonH = 40.0f;
  on = 0;
  frameRate(60);
}

void draw() {
  if(on == 0) {
    background(51);
    fill(255);
  }
  else {
    background(255);
    fill(51);
  }
  
  rect(posX - buttonW * 0.5f, posY - buttonH * 0.5f, buttonW, buttonH);
}

void mouseClicked() {
  if(mouseButton == LEFT){
    if(mouseX > (posX - buttonW * 0.5f) && mouseX < (posX + buttonW * 0.5f) && mouseY > (posY - buttonH * 0.5f) && mouseY < (posY + buttonH * 0.5f)) {
      if(on == 0) on = 1;
      else on = 0;
    }
  }
}
