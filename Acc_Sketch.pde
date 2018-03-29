import gazetrack.*;

GazeTrack gazeTrack;
Enemy[] enemies = {};
 
void setup() {
 size(600, 600);
 background(#2c3e50);
 gazeTrack = new GazeTrack(this); 
 for (int i = 0; i < 3; i++) {
   Enemy newEnemy = new Enemy(200,200);
   enemies = (Enemy[]) append(enemies, newEnemy);
 }
}
 
void draw() {
 background(#2c3e50);
 drawMaze();
 
  for (int i = 0; i < enemies.length; i++) {
   enemies[i].move();
   enemies[i].display();
  }
  if (gazeTrack.gazePresent())
  {
    ellipse(gazeTrack.getGazeX(), gazeTrack.getGazeY(), 40, 40);
    
    // Print the tracker's timestamp for the gaze cursor above
    println("Latest gaze data at: " + gazeTrack.getTimestamp());
  }
}
 
// Enemy class //
 
class Enemy {
 
  float x;
  float y;
 
  PVector location;
  PVector speed;
  int enemySize = 15;
 
  Enemy[] otherEnemies = {};
 
  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
    location = new PVector(random(125), random(125));
    speed = new PVector(3, -3);
  }
 
  void move() { 
    PVector target = new PVector(gazeTrack.getGazeX(), gazeTrack.getGazeY());
    PVector movement = PVector.sub(target, location);
    speed.add(movement);
    speed.limit(1.5);
    //Updating the location of the enemy
    location.add(speed);
  }
 
  void display() {
    fill(255);
    noStroke();
    ellipse(location.x, location.y, enemySize - 16, enemySize - 16);
    noFill();
    stroke(255, 100);
    strokeWeight(2);
    ellipse(location.x, location.y, enemySize - 10, 10);
    noFill();
    stroke(255, 100);
    strokeWeight(1);
    ellipse(location.x, location.y, 20, 20);
    checkBounds();
  }
 
  //Function to invert the velocity vector values
  //So that the ball stays within the frame
  void checkBounds() {
    if ((location.x > width) || (location.x < 0)) {
      speed.x = speed.x * -1;
    }
 
    if ((location.y > height) || (location.y < 0)) {
      speed.y = speed.y * -1;
    }
  }
}

void drawMaze() {
    strokeWeight(2);
 
    line(275, 250, 275, 100);
    line(320, 250, 320, 150);
    line(275, 100, 550, 100);
    line(320, 150, 400, 150);
    line(400, 150, 400, 200);
    line(400, 200, 370, 200);
    line(370, 200, 370, 250);
    line(370, 250, 450, 250);
    line(450, 250, 450, 100);
 
    line(225, 250, 275, 250);
    line(225, 300, 275, 300);
    line(225, 150, 225, 250);
    line(225, 300, 225, 400);
    line(175, 100, 175, 450);
 
    line(175, 100, 275, 100);
    line(175, 450, 275, 450);
    line(275, 450, 275, 350);
    line(275, 350, 450, 350);
    line(275, 300, 500, 300);
    line(500, 150, 500, 450);
    line(450, 350, 450, 400);
    line(500, 450, 350, 450);
    line(450, 400, 325, 400);
 
    line(350, 450, 350, 500);
    line(350, 500, 350, 450);
    line(350, 500, 125, 500);
    line(125, 500, 125, 50);
    line(125, 50, 600, 50);
 
    line(550, 100, 550, 500);
    line(600, 0, 600, 600);
    line(0, 600, 0, 0);
    line(0, 0, 600, 0);
    line(600, 600, 0, 600);
 
    line(550, 500, 400, 500);
    line(400, 500, 400, 550);
    line(400, 550, 75, 550);
    line(75, 550, 75, 100);
 
    line(75, 100, 25, 100);
    line(25, 0, 25, 600);
    line(75, 100, 75, 50);
 
    line(450, 600, 450, 550);
    line(450, 550, 550, 550);
}
