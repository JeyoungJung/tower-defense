class Enemy { 
  int i =1;
  PVector pos;
  float size;
  float hp;
  float speed;
  float r, g, b;
  int targetPoint;
  PVector[] tPos;
  color c;
  boolean enemyHp;

  Enemy(float x, float y, float spd, int hp) {
    pos = new PVector(x, y);    
    size = 15;
    this.hp = hp;
    speed = spd;       
    targetPoint = 0;
    r = 50;
    g = 200;
    b = 50;
    tPos = new PVector[30];
    tPos[0] = new PVector(140, 60); 
    tPos[1] = new PVector(140, 140);
    tPos[2] = new PVector(60, 140);
    tPos[3] = new PVector(60, 220);
    tPos[4] = new PVector(220, 220);
    tPos[5] = new PVector(220, 140);
    tPos[6] = new PVector(300, 140);
    tPos[7] = new PVector(300, 260);
    tPos[8] = new PVector(380, 260);
    tPos[9] = new PVector(380, 180);
    tPos[10] = new PVector(460, 180);
    tPos[11] = new PVector(460, 300);
    tPos[12] = new PVector(540, 300);
    tPos[13] = new PVector(540, 60);
    tPos[14] = new PVector(620, 60);
    tPos[15] = new PVector(620, 420);
    tPos[16] = new PVector(540, 420);
    tPos[17] = new PVector(540, 380);
    tPos[18] = new PVector(380, 380);
    tPos[19] = new PVector(380, 500);
    tPos[20] = new PVector(540, 500);
    tPos[21] = new PVector(540, 580);
    tPos[22] = new PVector(300, 580);
    tPos[23] = new PVector(300, 340);
    tPos[24] = new PVector(220, 340);
    tPos[25] = new PVector(220, 460);
    tPos[26] = new PVector(140, 460);
    tPos[27] = new PVector(140, 380);   
    tPos[28] = new PVector(-150, 380);
  } 

  void update() {
    drawEnemy();
    move();
  }

  void drawEnemy() {  
    stroke(70);
    strokeWeight(2);
    fill(r, g, b);
    ellipse(pos.x, pos.y, size, size);
  }

  void move() {
    if (targetPoint < 29) {
      PVector d = PVector.sub(tPos[targetPoint], pos);
      d.normalize();
      d.setMag(speed);
      pos.add(d);     
      if (dist(pos.x, pos.y, tPos[targetPoint].x, tPos[targetPoint].y) < 5) {
        pos = tPos[targetPoint];
        targetPoint += 1;
      }
    }
  }
}
