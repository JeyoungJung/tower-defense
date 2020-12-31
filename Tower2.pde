class Tower2 extends Tower {
  Tower2(PVector pos) {
    super(pos);
    bulletDelay = 100;
    range = 150;
    speed = 20;
    dmg = 0.22;
  }
  
  void display() {
    strokeWeight(4);
    stroke(50);
    fill(255);
    pushMatrix();
    float dir = (atan2(enemyPos.x-pos.x, enemyPos.y-pos.y-4))-HALF_PI;
    translate(pos.x+6, pos.y+6);  
    rotate(-dir-300); 
    fill(150);
    triangle(-5, 5, 2, -15, 9,  5.00);   
    popMatrix();
  }

  void shoot() {
    if(map.speedSwitch) bulletDelay = 50;
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
