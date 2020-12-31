class Map {
  int[][] grid = 
    {
 //  0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, //0
    {2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2}, //1
    {0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 2}, //2
    {0, 2, 2, 2, 0, 2, 2, 2, 0, 0, 0, 0, 0, 2, 0, 2}, //3
    {0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 2, 2, 0, 2, 0, 2}, //4
    {0, 2, 2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2}, //5
    {0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 2, 0, 2, 0, 2}, //6
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 0, 2}, //7
    {0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 2}, //8
    {2, 2, 2, 2, 0, 2, 0, 2, 0, 2, 2, 2, 2, 2, 0, 2}, //9
    {0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 2, 2}, //10
    {0, 0, 0, 2, 2, 2, 0, 2, 0, 2, 0, 0, 0, 0, 0, 0}, //11
    {0, 0, 0, 0, 0, 0, 0, 2, 0, 2, 2, 2, 2, 2, 0, 0}, //12
    {0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0}, //13
    {0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 0, 0}, //14
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, //15
  };

  ArrayList<Tower> tList;
  ArrayList<Tower2> t2List;
  ArrayList<Wave> wList;
  ArrayList<Bullet> bList;
  PVector tPos;
  boolean[] towerSwitch ; 
  boolean tutorialSwitch;
  boolean startSwitch;
  boolean speedSwitch;
  boolean enemySwitch;
  int gold;
  int hp;
  int r;
  int g;
  int towerChosen;
  int waveSize;
  int bulletSpeed;
  int waveNum;
  int enemyHealth = 3;
  float enemySpeed;
  float start;

  Map() {    
    hp = 100;
    gold = 100;
    g = 255;
    r = 0;
    waveSize = 5;
    waveNum = 1;
    bulletSpeed = 5;
    enemySpeed = 1;
    tList = new ArrayList<Tower>();
    t2List = new ArrayList<Tower2>();
    wList = new ArrayList<Wave>();   
    bList = new ArrayList<Bullet>();    
    towerSwitch = new boolean[10];
    tutorialSwitch = true;
    wList.add(new Wave(5, enemySpeed, enemyHealth));   // makes the first wave
  }

  void update() {        
    bulletUpdate();
    spaceCheck();
    checkSpace();    
    waveUpdate();
    towerUpdate();        
    design();  
    words();
    tutorial();
    collisionCheck();
  }

  void tutorial() {   
    if (tutorialSwitch) {
      fill(50, 100);
      rect(-2, -2, 802, 602);
      filter(BLUR, 4);
      textSize(50);
      text("Click to start Game", 180, 310);
    }
  }

  void words() {
    textSize(18);
    fill(87);

    text("Gold : " + gold, 654, 559);
    text("HP : " + hp, 654, 586);
    textSize(24);
    text("Turret", 683, 35);

    if (speedSwitch == false) {
      textSize(18);
      fill(0, 200, 0);
      text("1x Speed", 678, 498);
      frameRate(60);
      noFill();
    } else if (speedSwitch) {
      textSize(18);
      frameRate(120);
      fill(200, 0, 0); 
      text("2x Speed", 678, 498);
      noFill();
    }

    if (wList.get(wList.size()-1).eList.size() == 0) {      
      noFill();      
      stroke( 50, 100, 50);
      fill(50, 255, 50);
      triangle(660, 514, 660, 525, 667, 520);
      fill(87);
      textSize(18);
      text("Start Wave", 680, 527);
    } else {
      fill(87);
      textSize(18);
      text("Wave  " + waveNum, 685, 527);
    }
  }

  void design() {   
    stroke(200, 0);
    strokeWeight(11);
    strokeJoin(ROUND);
    line(0, 0, 800, 0);

    stroke(120);
    strokeWeight(5);
    noFill();
    rect(642, 2, 157, 595, 5); 

    stroke(150);
    strokeWeight(5);
    fill(210);
    rect(645, 5, 150, 590, 5); 

    strokeWeight(6);
    line(645, 534, 795, 534);
    line(720, 50, 720, 475);
    line(645, 50, 795, 50);
    line(645, 505, 795, 505);
    line(645, 475, 795, 475);

    ////////////////////// Tower1 /////////////////////////

    strokeWeight(4);
    stroke(50);
    fill(255);
    rect(660, 68, 25, 25);
    fill(130);
    strokeWeight(2);
    stroke(80); 
    rect(663, 78, 35, 5, 3);  
    fill(200);
    ellipse(673, 81, 15, 15);
    textSize(8);
    fill(90);
    text("50 G  2 DPS", 653, 108);
    text("100 RNG", 653, 118);

    if (mouseX > 648 && mouseX < 717 && mouseY > 53 && mouseY < 121) {
      stroke(0, 130, 0);
      noFill();
      rect(648, 54, 69, 69);
      noStroke();
    }    
    if (towerSwitch[0] == true) {
      stroke(0, 110, 0);
      fill(0, 110, 0, 20);
      rect(648, 54, 69, 69);
    }

    ////////////////////// Tower2 /////////////////////////
    strokeWeight(4);
    stroke(50);
    fill(150);
    triangle(743, 80, 766, 69, 766, 90);  
    fill(90);
    text("100 G  2.2 DPS", 728, 108);
    text("150 RNG", 728, 118);

    strokeWeight(2);
    if (mouseX > 717 && mouseX < 800 && mouseY > 53 && mouseY < 121) {
      stroke(0, 130, 0);
      noFill();
      rect(723, 54, 69, 69);
      noStroke();
    }    
    if (towerSwitch[1] == true) {
      stroke(0, 110, 0);
      fill(0, 110, 0, 20);
      rect(723, 54, 69, 69);
    }
  }

  void waveUpdate() {
    for (int i = 0; i < wList.get(wList.size()-1).eList.size(); i++) { 
      Enemy e = wList.get(wList.size()-1).eList.get(i);    
      if (e.pos.x < 0 && e.pos.y > 379) {            // if the enemies are out of the screen, hp gets deducted by 1 
        wList.get(wList.size()-1).eList.remove(i);
        hp-=1;
        if (hp == 0) {
          state = 2;
        }
      }
    }

    if (wList.get(wList.size()-1).eList.size() == 0 ) {
      rect(280, 295, 200, 50);
      if (startSwitch) {
        if (waveNum % 5 == 0) {
          enemyHealth += 2;
          gold += waveNum * 30;
        }
        waveSize += 5;
        enemySpeed += 0.3;
        waveNum += 1;
        wList.add(new Wave(waveSize, enemySpeed, enemyHealth));  // if there are no more enemies left, it makes a new wave
        startSwitch = false;
      }
    }

    for (Wave w : wList) {
      w.update();
    }
  }

  void towerUpdate() {
    for (Tower t : tList) {
      t.update();
    }
    for (Tower2 t2 : t2List) {
      t2.update();
    }
  }

  void bulletUpdate() {
    for (Bullet b : bList) {
      b.update();
    }
  }

  void spaceCheck() {
    for (int i=0; i<16; i++) {
      for (int j=0; j<16; j++) {
        if (grid[j][i] == 0) {
          noStroke(); 
          fill(0, 110, 0, 110); 
          rect(i*40, j*40, 40, 40, 5);
          noFill();
        }
        if (grid[j][i] == 1 || grid[j][i] == 3) {
          noStroke(); 
          fill(0, 110, 0, 110);     
          rect(i*40, j*40, 40, 40, 5);
          noFill();
        }
        if (grid[j][i] == 2) {
          noStroke(); 
          fill(110, 0, 0, 110); 
          rect(i*40, j*40, 40, 40, 5);
          noFill();
        }
        if (mouseX>i*40 && mouseX<i*40+40 && mouseY>j*40 && mouseY<j*40+40) {                   
          if (grid[j][i] == 0) {
            noStroke(); 
            fill(0, 110, 0, 110); 
            rect(i*40, j*40, 40, 40, 5);
            noFill();
          }
          if (grid[j][i] == 1) {         
            noStroke();
            fill(110, 0, 0, 20); 
            ellipse(i*40+20, j*40+20, 200, 200);
            rect(i*40, j*40, 40, 40, 5);           
            noFill();
          } 
          if (grid[j][i] == 2) {
            noStroke(); 
            fill(110, 0, 0, 110); 
            rect(i*40, j*40, 40, 40, 5);
            noFill();
          }
          if (grid[j][i] == 3) {
            noStroke(); 
            fill(110, 0, 0, 20); 
            ellipse(i*40+20, j*40+20, 300, 300);
            rect(i*40, j*40, 40, 40, 5);
            noFill();
          }
        }
      }
    }
  }

  boolean checkSpace() {
    int i = (int)mouseX/40; 
    int j = (int)mouseY/40; 
    if (mouseY < 600 && mouseX < 640) {
      if (grid[j][i] == 1 || grid[j][i] == 2 || grid[j][i] == 3) {
        return false;
      }
    }
    return true;
  }

  void collisionCheck() {    
    for (int i=0; i<wList.get(wList.size()-1).eList.size(); i++) {
      if (wList.get(wList.size()-1).eList.get(i).hp < 0) {
        wList.get(wList.size()-1).eList.remove(i);
        gold += 5;
      }
    }

    for (int j=0; j<bList.size(); j++) {     
      if (bList.get(j).pos.x > 800 || bList.get(j).pos.y > 600 || bList.get(j).pos.x < 0 || bList.get(j).pos.y < 0) {
        // When the bullet goes out of the screen it gets removed
        bList.remove(j);
      }
    }

    for (int i=0; i<wList.get(wList.size()-1).eList.size(); i++) {                         
      for (int j=0; j<bList.size(); j++) {           
        if (dist(bList.get(j).pos.x, bList.get(j).pos.y, 
          wList.get(wList.size()-1).eList.get(i).pos.x, 
          wList.get(wList.size()-1).eList.get(i).pos.y) < 15) 
        {    
          wList.get(wList.size()-1).eList.get(i).hp -= bList.get(j).dmg;            
          bList.remove(j);
          // When the bullet hits an enemy, enemy's hp deducts by bList.get(j).dmg (which is different between the towers) and the bullet gets removed
        }
      }
    }
  }


  void placeTower() {
    for (int i=0; i<16; i++) {
      for (int j=0; j<16; j++) {        
        if (mouseX>i*40 && mouseX<i*40+40 && mouseY>j*40 && mouseY<j*40+40 && gold >= 50 && towerSwitch[0] == true) {          
          int x = i*40+15; 
          int y = j*40+15; 
          tPos = new PVector(x, y); 
          tList.add(new Tower(tPos));
          grid[j][i] = 1;
          gold -= 50;
        }
        if (mouseX>i*40 && mouseX<i*40+40 && mouseY>j*40 && mouseY<j*40+40 && gold >= 100 && towerSwitch[1] == true) {          
          int x = i*40+15; 
          int y = j*40+15; 
          tPos = new PVector(x, y); 
          t2List.add(new Tower2(tPos));
          grid[j][i] = 3;
          gold -= 100;
        }
      }
    }
  }
}


void mouseReleased() {
  if (map.checkSpace()) {
    map.placeTower();
  }

  if (mouseX > 335 && mouseX < 485 && mouseY > 410 && mouseY < 480 && state==2) {   
    state=0;
  }

  if (mouseX > 648 && mouseX < 793 && mouseY > 508 && mouseY < 531 && state==1 && map.startSwitch == false && map.wList.get(map.wList.size()-1).eList.size() == 0) {
    map.startSwitch = true;
  }

  if (mouseX > 0 && mouseX < 800 && mouseY > 0 && mouseY < 600 && map.tutorialSwitch==true && state==1) {
    map.tutorialSwitch=false;
  }

  if (mouseX > 580 && mouseX < 730 && mouseY > 410 && mouseY < 560 && state == 0) {
    state = 1;
  }

  if (mouseX > 648 && mouseX < 793 && mouseY > 477 && mouseY < 504 && map.speedSwitch==false && state==1) {
    map.speedSwitch=true;
    frameRate(120);
  } else if (mouseX > 648 && mouseX < 793 && mouseY > 477 && mouseY < 504 && map.speedSwitch && state==1) {
    map.speedSwitch=false;
    frameRate(60);
  }

  if (mouseX > 648 && mouseX < 717 && mouseY > 53 && mouseY < 121 && map.towerSwitch[0] == false) {
    map.towerSwitch[0] = true;
    if (map.towerSwitch[1]) map.towerSwitch[1] = false;
  } else if (mouseX > 648 && mouseX < 717 && mouseY > 53 && mouseY < 121 && map.towerSwitch[0] == true) {
    map.towerSwitch[0] = false;
  }

  if (mouseX > 717 && mouseX < 800 && mouseY > 53 && mouseY < 121 && map.towerSwitch[1] == false) {
    map.towerSwitch[1] = true;
    if (map.towerSwitch[0]) map.towerSwitch[0] = false;
  } else if (mouseX > 717 && mouseX < 800 && mouseY > 53 && mouseY < 121 && map.towerSwitch[1] == true) {
    map.towerSwitch[1] = false;
  }
}