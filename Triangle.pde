class Triangle {
  private Vertex v1;
  private Vertex v2;
  private Vertex v3;
  private Circumcircle cc;
  
  public Triangle(Vertex v1, Vertex v2, Vertex v3) {
    this.v1 = v1;
    this.v2 = v2;
    this.v3 = v3;
    cc = new Circumcircle(v1, v2, v3);
  }
  
  public Vertex getV1() { return v1; }
  public Vertex getV2() { return v2; }
  public Vertex getV3() { return v3; }
  
  public boolean inCircumcircle(Vertex v) {
    double diffX = cc.getX() - v.getX();
    double diffY = cc.getY() - v.getY();
    return (double)sqrt((float)(diffX * diffX) + (float)(diffY * diffY)) <= cc.getRadius();
  }
  
  private double getCenterY() {
    double mid12 = (double)(v1.getY() + v2.getY()) / 2;
    return (mid12 + (double)(v3.getY())) / 2;
  }
  
  private Color colorByYCoord(double yCoord) {
    double screenHeight = 700;
    double ratio = yCoord / screenHeight;
    Color newColor = TOP_COLOR.interpolate(BOTTOM_COLOR, ratio);
    if (ratio < 0) { return TOP_COLOR; }
    return newColor;
  }
  
  public void drawTriangle() {
    Color c = colorByYCoord(getCenterY());
    stroke(c.getR(), c.getG(), c.getB());
    strokeWeight(1.5);
    
    //noStroke();
    fill(c.getR(), c.getG(), c.getB());
    triangle((float)v1.getX(), (float)v1.getY(), (float)v2.getX(), (float)v2.getY(), (float)v3.getX(), (float)v3.getY());
  }
  
  public void drawTriangle(boolean debug) {
    Color c = colorByYCoord(getCenterY());
    stroke(c.getR(), c.getG(), c.getB());
    strokeWeight(2);
    
    //noStroke();
    fill(c.getR(), c.getG(), c.getB());
    triangle((float)v1.getX(), (float)v1.getY(), (float)v2.getX(), (float)v2.getY(), (float)v3.getX(), (float)v3.getY());
    if (debug) {
      cc.drawCircumcircle();
    }
  }
  
  //debug
  public void update() {
    v1 = new Vertex(new Tuple(mouseX, mouseY));
    v2 = new Vertex(new Tuple(v1.getX() - 40, v1.getY() + 70));
    v3 = new Vertex(new Tuple(v1.getX() + 40, v1.getY() + 70));
    cc = new Circumcircle(v1, v2, v3);
  }
}
