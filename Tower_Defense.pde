int state=0;
Map map;

void setup() {
  size(801, 600);  
  map = new Map();
}

void draw() {
  background(255);
  if (state == 0) {
    startMenu();
  }
  if (state == 1) {
    map.update();
  }
  if (state ==2){
    endMenu(); 
  }
}
