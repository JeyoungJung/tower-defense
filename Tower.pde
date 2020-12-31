class Tower {
  PVector pos, enemyPos;
  int range = 100;
  int bulletDelay = 500;
  int speed = 15;
  int i=0;
  float dmg = 1;
  float start;

  Tower(PVector pos) {
    this.pos = pos;
    enemyPos = new PVector(140, 60);
  }

  void update() {
    display();     
    shoot();
  }

  void display() {
    rectMode(CENTER);         
    strokeWeight(4);
    stroke(50);
    fill(255);
    rect(pos.x+5, pos.y+5, 25, 25);
    pushMatrix();
    float dir = (atan2(enemyPos.x-pos.x, enemyPos.y-pos.y-4))-HALF_PI;
    translate(pos.x+5, pos.y+5);
    rotate(-dir); 
    fill(130);
    strokeWeight(2);
    stroke(80); 
    rect(5, 0.5, 35, 5, 3);     
    popMatrix(); 
    fill(200); 
    stroke(80);
    ellipse(pos.x+5, pos.y+5, 15, 15);
    rectMode(CORNER);
  }

  void shoot() {
    if(map.speedSwitch) bulletDelay = 250;
    if (millis() - start > bulletDelay) {
      for (Enemy e : map.wList.get(map.wList.size()-1).eList) { 
        if (dist(pos.x, pos.y, e.pos.x, e.pos.y) < range) {   
          enemyPos = e.pos;
          map.bList.add(new Bullet(pos, e.pos, speed, dmg)); 
          start = millis();
          break;
        }
      }
    }
  }
}
