//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {
  
  final int PLACING = 0;
  final int PLACED = 1;
  
  float x, y;
  int cooldown, threshold;
  int towerMode;
  
  Tower(float _x, float _y, int c, int th) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    towerMode = PLACING;
  }
  
  void show() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    if (towerMode == PLACED) {
    square(x, y, 40);
    } else if (towerMode == PLACING) {
      square(mouseX, mouseY, 40);
      if (mousePressed) {
        mode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
    
}

void act() {
 cooldown++;
 if (cooldown >= threshold) {
   cooldown = 0;
   bullets.add(new Bullet(x, y, 0, -10)); //UP
   bullets.add(new Bullet(x, y, 0, 10)); //DOWN
   bullets.add(new Bullet(x, y, -10, 0)); //LEFT
   bullets.add(new Bullet(x, y, 10, 0)); //RIGHT
 }
}
}
