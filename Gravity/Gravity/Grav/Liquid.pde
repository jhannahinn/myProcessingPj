class Liquid {
  float x, y, w, h;
  float c;
  
  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  boolean contains(Mover m) {
    PVector l = m.position;
    if(l.x > x && l.x < x + w && l.y > y && l.y < y + h) {
      return true;
    } else {
      return false;
    }
  }
  
  PVector drag(Mover m) {
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;
    
    PVector drag = m.velocity.copy();
    drag.mult(-1);
    
    drag.setMag(dragMagnitude);
    return drag;
  }
  
  
  void display() {
    noStroke();
    fill(127);
    rect(x, y, w, h);
  }
}
