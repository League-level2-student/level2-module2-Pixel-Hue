//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;

// Add a constructor with parameters to initialize each variable
public Segment(int x, int y) {
 this.x = x;
 this.y = y;
}


}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment head;
Segment tail;
int foodx;
int foody;
int sDirection = DOWN;
int foodEaten;
ArrayList<Segment> segments = new ArrayList<Segment>();


//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
head = new Segment(1,1);
tail = new Segment(head.x, head.y);
frameRate(20);
//head.x
dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodx = ((int)random(50)*10);
    foody = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(168, 202, 88);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  //Draw the food
  fill(255, 25, 25);
  rect(foodx, foody, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(86, 168, 197);
  rect(head.x, head.y, 10, 10);
  eat();
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
fill(86, 168, 197);
for (int i = 0; i <= foodEaten; i++) {
  rect(-20, -20, 10, 10);
}
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  segments.add(tail);
  segments.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
 //if (head.x <  + 10 && head.x >  - 10 && head.y <  + 10 && head.y >  - 10) {
 //foodEaten = 0;
 //segments.clear();
 //segments.add(tail);
 //}
 
 }



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if (key == CODED) {
    if (keyCode == UP) {
      sDirection = UP;
    }
    if (keyCode == RIGHT) {
      sDirection = RIGHT;
    }
    if (keyCode == LEFT) {
      sDirection = LEFT;
    }
    if (keyCode == DOWN) {
      sDirection = DOWN;
    }
  }
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(sDirection) {
  case UP:
    head.y-=5;
    break;
  case DOWN:
     head.y+=5;
    break;
  case LEFT:
   head.x-=5;
    break;
  case RIGHT:
   head.x+=5;
    break;
  }
  checkBoundaries();
  
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if (head.x < -10) {
   head.x = 500;
 }
 else if (head.x > 500) {
  head.x = 0; 
 }
 else if (head.y < -10) {
  head.y = 500; 
 }
 else if (head.y > 500) {
  head.y = 0; 
 }
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if (head.x < foodx + 10 && head.x > foodx - 10 && head.y < foody + 10 && head.y > foody - 10) {
foodEaten++;
System.out.println("hello");
System.out.println(foodx);
System.out.println(foody);
dropFood();
  }
}
