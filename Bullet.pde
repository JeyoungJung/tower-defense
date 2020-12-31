class Bullet {
  PVector pos;
  PVector dir;
  PVector target;
  int size;
  float dmg;
  float speed;  

  Bullet(PVector pos, PVector target, float speed, float dmg) {      
    this.dmg = dmg;
    this.pos = new PVector(pos.x+5, pos.y+5);    
    this.speed = speed;    
    size = 1;
    dir = PVector.sub(target, this.pos);
    dir.normalize();
    dir.setMag(speed);
  }

  void update() {
    display();
    move();
  }

  void display() {    
    ellipse(pos.x, pos.y, size, size);
  }

  void move() {
    pos.add(dir);
  }
}
