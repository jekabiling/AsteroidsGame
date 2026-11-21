class Asteroid extends Floater {
  private double rotationSpeed;
  public Asteroid() {
    corners = 10;
    xCorners = new int[] {-20, -10, 5, 18, 22, 15, 5, -10, -22, -25};
    yCorners = new int[] {-10, -22, -20, -12, 5, 18, 23, 18, 8, -3};
    myColor = color(130, 130, 130);
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myXspeed = Math.random() * 2 - 1;
    myYspeed = Math.random() * 2 - 1;
    myPointDirection = Math.random() * 360;
    rotationSpeed = Math.random() * 2 - 1;
  }

  public Asteroid(boolean spawnAtEdge) {
    this();
    if (spawnAtEdge) {
      int edge = (int)(Math.random() * 4);

      if (edge == 0) {
        myCenterX = Math.random() * width;
        myCenterY = 0;
        myYspeed = Math.random() * 1.5 + 0.3;
      } else if (edge == 1) {
        myCenterX = Math.random() * width;
        myCenterY = height;
        myYspeed = -(Math.random() * 1.5 + 0.3);
      } else if (edge == 2) {
        myCenterX = 0;
        myCenterY = Math.random() * height;
        myXspeed = Math.random() * 1.5 + 0.3;
      } else {
        myCenterX = width;
        myCenterY = Math.random() * height;
        myXspeed = -(Math.random() * 1.5 + 0.3);
      }
    }
  }

  public void move() {
    super.move();
    turn(rotationSpeed);
  }

  public void show() {
    fill(130, 130, 130);
    stroke(220, 220, 220);
    strokeWeight(2);
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection * (Math.PI / 180));
    rotate(dRadians);
    beginShape();
    for (int i = 0; i < corners; i++) {
      vertex(xCorners[i], yCorners[i]);
    }
    endShape(CLOSE);
    rotate(-dRadians);
    translate(-(float)myCenterX, -(float)myCenterY);
    strokeWeight(1);
  }

  public double getCenterX() {
    return myCenterX;
  }

  public double getCenterY() {
    return myCenterY;
  }
}
