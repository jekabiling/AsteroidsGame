class Star {
  private float myX, myY;
  private float myXspeed, myYspeed;
  private int myColor;
  public Star() {
    myX = (float)(Math.random() * width);
    myY = (float)(Math.random() * height);
    myXspeed = (float)(Math.random() * 0.4) - 0.2;
    myYspeed = (float)(Math.random() * 0.4) - 0.2;
    myColor = color((int)(Math.random() * 155) + 100);
  }
  
  public void move() {
    myX += myXspeed;
    myY += myYspeed;
    if (myX > width) { myX = 0; }
    else if (myX < 0) { myX = width; }
    if (myY > height) { myY = 0; }
    else if (myY < 0) { myY = height; }
  }
  
  public void show() {
    fill(myColor);
    noStroke();
    ellipse(myX, myY, 2, 2);
  }
}
