Segment head;
int foodEaten;
float foodX = random(500);
float foodY = random(500);
String direction = "up";

class Segment {
  int x = 0;
  int y = 0;
  
  public Segment(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public int getX() {
    return x;
  }  
  public int getY() {
    return y;
  }
  public void setX(int x) {
    this.x = x;
  } 
  public void setY(int y) {
    this.y = y;
  }  
}

void setup() {
    size(500, 500);
    head = new Segment(50, 50);
    frameRate(20);
}
void draw() {
  background(0);
  drawFood();
  drawSnake();
  move();
}
void drawFood() {
  fill(255, 0, 0);
  rect(foodX, foodY, 10, 10);
}
void drawSnake() {
  fill(0, 255, 0);
  rect(head.getX(), head.getY(), 10, 10);
}
void keyPressed() {
  if(keyCode == UP) {
    direction = "up";
  }
  if(keyCode == LEFT) {
    direction = "left"; 
  }
  if(keyCode == DOWN) {
    direction = "down"; 
  }
  if(keyCode == RIGHT) {
    direction = "right"; 
  }
}
void move() {
  switch(direction) {
    case "up":
      head = new Segment(head.getX(), head.getY()-10);
      break;
    case "left":
      head = new Segment(head.getX()-10, head.getY());
      break;
    case "down":
      head = new Segment(head.getX(), head.getY()+10);
      break;
    case "right":
      head = new Segment(head.getX()+10, head.getY());
      break;
  } 
}