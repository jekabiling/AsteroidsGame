Spaceship bob;
Star[] stars;

boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;
boolean downPressed = false;

public void setup() {
  size(600, 600);
  bob = new Spaceship();
  stars = new Star[300];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

public void draw() {
  background(0);
  if (leftPressed) {
    bob.turn(-4); 
  }
  if (rightPressed) {
    bob.turn(4);
  }
  if (upPressed) {
    bob.accelerate(0.1);  
  }
  if (downPressed) {
    bob.accelerate(-0.1); 
  }
  bob.setAccelerating(upPressed || downPressed);
  for (int i = 0; i < stars.length; i++) {
    stars[i].move();
    stars[i].show();
  }
  bob.move();
  bob.show();
}

public void keyPressed() {
  if (key == 'a' || key == 'A') {
    leftPressed = true;
  } else if (key == 'd' || key == 'D') {
    rightPressed = true;
  } else if (key == 'w' || key == 'W') {
    upPressed = true;
  } else if (key == 's' || key == 'S') {
    downPressed = true;
  } else if (key == 'h' || key == 'H') {
    bob.hyperspace();
  }
}

public void keyReleased() {
  if (key == 'a' || key == 'A') {
    leftPressed = false;
  } else if (key == 'd' || key == 'D') {
    rightPressed = false;
  } else if (key == 'w' || key == 'W') {
    upPressed = false;
  } else if (key == 's' || key == 'S') {
    downPressed = false;
  }
}
