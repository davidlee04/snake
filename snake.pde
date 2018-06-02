Segment head;
int foodEaten = 0;
float foodX = Math.round(random(500)/10.0)*10;
float foodY = Math.round(random(500)/10.0)*10;
String direction = "up";
ArrayList<Segment> snakeSegments = new ArrayList<Segment>();

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
  drawTail();
  move();
  collision();
  bodyCollision();
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
  if(keyCode == UP && direction != "down") {
    direction = "up";
  }
  if(keyCode == LEFT && direction != "right") {
    direction = "left"; 
  }
  if(keyCode == DOWN && direction != "up") {
    direction = "down"; 
  }
  if(keyCode == RIGHT && direction != "left") {
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
  checkBoundaries();
}
void collision() {
  if(head.getX() == foodX && head.getY() == foodY) {
    foodEaten++;
    foodX = Math.round(random(500)/10.0)*10;
    foodY = Math.round(random(500)/10.0)*10;
  }
}
void checkBoundaries() {
  if(head.getX() < 0) {
    head = new Segment(width-10, head.getY());
  }
  if(head.getX() > 490) {
    head = new Segment(0, head.getY());
  }
  if(head.getY() < 0) {
    head = new Segment(head.getX(), height-10);
  }
  if(head.getY() > 490) {
    head = new Segment(head.getX(), 0);
  }
}
void drawTail() {
  snakeSegments.add(head);
  for(Segment snake : snakeSegments) {
    fill(0, 255, 0);
    rect(snake.getX(), snake.getY(), 10, 10);
  }
  while(snakeSegments.size() > foodEaten) {
    snakeSegments.remove(0);
  }
}
void bodyCollision() {
  for(int i = 0; i < snakeSegments.size(); i++) {
    for(int j = 0; j < snakeSegments.size(); j++) {
      if(snakeSegments.get(i).getX() == snakeSegments.get(j).getX() && snakeSegments.get(i).getY() == snakeSegments.get(j).getY() && i != j) {
        foodEaten = 1;
      }
    }
  }
}
