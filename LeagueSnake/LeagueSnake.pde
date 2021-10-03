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
int foodx;
int foody;
int sDirection = DOWN;
int foodEaten;



//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500, 500);
head = new Segment(1,1);
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
  background(75, 185, 25);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  //Draw the food
  fill(185, 25, 25);
  rect(foodx, foody, 10, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(25, 255, 25);
  rect(head.x, head.y, 10, 10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 

}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  
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
 
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
foodEaten++;

}
