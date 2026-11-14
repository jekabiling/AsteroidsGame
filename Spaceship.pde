class Spaceship extends Floater
{
  private boolean isAccelerating = false;
  public Spaceship()
  {
    corners = 4;
    xCorners = new int[] {-12, 15, -12, -6};
    yCorners = new int[] {-9, 0, 9, 0};
    myColor = 255;
    myCenterX = width / 2;
    myCenterY = height / 2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  public double getCenterX() { return myCenterX; }
  public double getCenterY() { return myCenterY; }
  public double getXSpeed() { return myXspeed; }
  public double getYSpeed() { return myYspeed; }
  public double getPointDirection() { return myPointDirection; }
  
  public void setAccelerating(boolean accelerating)
  {
    isAccelerating = accelerating;
  }
  
  public void hyperspace()
  {
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    myPointDirection = Math.random() * 360;
  }

  public void show()
  {
    pushMatrix();
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection * Math.PI / 180);
    rotate(dRadians);

    stroke(50);
    strokeWeight(1.2);
    fill(210, 215, 220);
    beginShape();
    vertex(5, -6);
    vertex(-7, -23);
    vertex(-15, -24);
    vertex(-9, -6);
    endShape(CLOSE);

    fill(180, 40, 40);
    noStroke();
    beginShape();
    vertex(-1, -13);
    vertex(-4, -18);
    vertex(-7, -19);
    vertex(-5, -13);
    endShape(CLOSE);

    stroke(50);
    strokeWeight(1.2);
    fill(210, 215, 220);
    beginShape();
    vertex(5, 6);
    vertex(-7, 23);
    vertex(-15, 24);
    vertex(-9, 6);
    endShape(CLOSE);

    fill(180, 40, 40);
    noStroke();
    beginShape();
    vertex(-1, 13);
    vertex(-4, 18);
    vertex(-7, 19);
    vertex(-5, 13);
    endShape(CLOSE);

    fill(140, 145, 155);
    stroke(40);
    strokeWeight(1);

    rect(-16.5, -17.5, 9, 5);
    rect(-16.5, 12.5, 9, 5);
    rect(-10.5, -18.5, 9, 5);
    rect(-10.5, 13.5, 9, 5);

    fill(200, 205, 215);
    stroke(40);
    strokeWeight(1.2);

    beginShape();
    vertex(20, 0);
    vertex(10, -4);
    vertex(-11, -4);
    vertex(-16, 0);
    vertex(-11, 4);
    vertex(10, 4);
    endShape(CLOSE);

    fill(40, 120, 180);
    stroke(20);
    strokeWeight(1);

    beginShape();
    vertex(9, 0);
    vertex(5, -3);
    vertex(-1, -3);
    vertex(-1, 3);
    vertex(5, 3);
    endShape(CLOSE);

    if (isAccelerating)
    {
      noStroke();
      fill(255, 120, 0, 220);
      triangle(-16, -15, -27, -15, -16, -13);
      triangle(-16, 15, -27, 15, -16, 13);
      triangle(-10, -16, -21, -16, -10, -14);
      triangle(-10, 16, -21, 16, -10, 14);

      fill(255, 240, 100);
      triangle(-16, -14, -22, -15, -16, -13);
      triangle(-16, 14, -22, 15, -16, 13);
      triangle(-10, -15, -16, -16, -10, -14);
      triangle(-10, 15, -16, 16, -10, 14);
    }
    popMatrix();
  }
}
