class Wave {
  ArrayList<Enemy> eList; 
  Wave(int waveSize, float speed, int enemyHealth) { 
    eList = new ArrayList<Enemy>();
    createWave(waveSize, speed, enemyHealth);
  }

  void update() {
    updateEnemy();
  }

  void updateEnemy() {
    for (int i=0; i<eList.size(); i++)
    {
      Enemy e = eList.get(i);
      e.update();
    }
  }

  void createWave(int size, float speed, int enemyHealth) {
    for (int j=0; j<size; j++)
    {
      Enemy e = new Enemy(-10+(-40*j), 60, speed, enemyHealth);
      eList.add(e);
    }
  }
}
