class Circumcircle {
  private double radius;
  private Tuple center;
  
  public Circumcircle() {
    radius = 0.0;
    center = new Tuple(0.0, 0.0);
  }
  
  public Circumcircle(Vertex v1, Vertex v2, Vertex v3) {
    radius = 0.0;
    center = new Tuple(0.0, 0.0);
    calculateCircumcircle(v1, v2, v3);
  }
  
  public double getRadius() { return radius; }
  public Tuple getCenter() { return center; }
  public double getX() { return center.getX(); }
  public double getY() { return center.getY(); }
  
  public void calculateCircumcircle(Vertex v1, Vertex v2, Vertex v3) {
    double D = 2.0 * (
      v1.getX() * (v2.getY() - v3.getY()) + 
      v2.getX() * (v3.getY() - v1.getY()) + 
      v3.getX() * (v1.getY() - v2.getY())
    );
    
    double Ux = (1 / D) * (
      (v1.getX() * v1.getX() + v1.getY() * v1.getY()) * (v2.getY() - v3.getY()) + 
      (v2.getX() * v2.getX() + v2.getY() * v2.getY()) * (v3.getY() - v1.getY()) + 
      (v3.getX() * v3.getX() + v3.getY() * v3.getY()) * (v1.getY() - v2.getY())
    );
    double Uy = (1 / D) * (
      (v1.getX() * v1.getX() + v1.getY() * v1.getY()) * (v3.getX() - v2.getX()) + 
      (v2.getX() * v2.getX() + v2.getY() * v2.getY()) * (v1.getX() - v3.getX()) + 
      (v3.getX() * v3.getX() + v3.getY() * v3.getY()) * (v2.getX() - v1.getX())
    );
    center = new Tuple(Ux, Uy);
    
    double calcRadius = center.getDistance(v1);
    if (center.getDistance(v2) > calcRadius) {
      calcRadius = center.getDistance(v2);
    }
    if (center.getDistance(v3) > calcRadius) {
      calcRadius = center.getDistance(v3);
    }
    
    radius = calcRadius;
  }
  
  // debug
  public void drawCircumcircle() {
    strokeWeight(2);
    stroke(255, 0, 0);
    noFill();
    circle((float)center.getX(), (float)center.getY(), (float)radius * 2);
  }
}
