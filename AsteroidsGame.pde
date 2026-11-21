Spaceship bob;
Star[] stars;
ArrayList<Asteroid> asteroids;

boolean leftPressed = false;
boolean rightPressed = false;
boolean upPressed = false;
boolean downPressed = false;

public void setup(){
  size(600, 600);
  bob = new Spaceship();
  stars = new Star[300];

  for (int i = 0; i < stars.length; i++){
    stars[i] = new Star();
  }

  asteroids = new ArrayList<Asteroid>();

  for (int i = 0; i < 12; i++){
    asteroids.add(new Asteroid());
  }
}

public void draw(){
  background(0);

  if (leftPressed){
    bob.turn(-4);
  }

  if (rightPressed){
    bob.turn(4);
  }

  if (upPressed){
    bob.accelerate(0.1);
  }

  if (downPressed){
    bob.accelerate(-0.1);
  }

  bob.setAccelerating(upPressed || downPressed);

  for (int i = 0; i < stars.length; i++){
    stars[i].move();
    stars[i].show();
  }

  bob.move();
  bob.show();
  for (int i = asteroids.size() - 1; i >= 0; i--){
    Asteroid a = asteroids.get(i);
    double distance = dist(
      (float)bob.getCenterX(),
      (float)bob.getCenterY(),
      (float)a.getCenterX(),
      (float)a.getCenterY()
    );

    if (distance < 35){
      asteroids.remove(i);
    }
    else{
      a.move();
      a.show();
    }
  }

  while (asteroids.size() < 12){
    Asteroid newAsteroid = new Asteroid(true);
    double spawnDist = dist(
      (float)bob.getCenterX(),
      (float)bob.getCenterY(),
      (float)newAsteroid.getCenterX(),
      (float)newAsteroid.getCenterY()
    );

    if (spawnDist > 100){
      asteroids.add(newAsteroid);
    }
  }
}

public void keyPressed(){
  if (key == 'a' || key == 'A'){
    leftPressed = true;
  }
  else if (key == 'd' || key == 'D'){
    rightPressed = true;
  }
  else if (key == 'w' || key == 'W'){
    upPressed = true;
  }
  else if (key == 's' || key == 'S'){
    downPressed = true;
  }
  else if (key == 'h' || key == 'H'){
    bob.hyperspace();
  }
}

public void keyReleased(){
  if (key == 'a' || key == 'A'){
    leftPressed = false;
  }
  else if (key == 'd' || key == 'D'){
    rightPressed = false;
  }
  else if (key == 'w' || key == 'W'){
    upPressed = false;
  }
  else if (key == 's' || key == 'S'){
    downPressed = false;
  }
}
