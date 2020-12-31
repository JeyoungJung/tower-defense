void startMenu() {
  fill(90);
  rect(0, 0, 800, 300);
  noFill();
  rect(575, 410, 150, 70);
  textSize(24);
  text("Start", 623, 452);
  textSize(200);
  pushMatrix();
  fill(255);
  scale(0.508, 1.95);
  text("T0WER DEFENSE", 8, 149);
  fill(90);
  text("VERSION 1", 8, 304);
  popMatrix();
}

void endMenu(){
  fill(90);
  rect(0, 0, 800, 300);
  stroke(0);
  noFill();
  rect(335, 410, 150, 70);
  textSize(24);
  text("PLAY AGAIN", 340, 452);
  fill(255);
  textSize(200);
  scale(0.508, 1.95);
  text("GOOD GAME", 170, 149);    
}
