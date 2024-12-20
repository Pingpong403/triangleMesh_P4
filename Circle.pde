class Circle {
  private double radius;
  private Tuple center;
  
  public Circle() {
    radius = 0.0;
    center = new Tuple(0.0, 0.0);
  }
  
  public Circle(double radius, Tuple center) {
    this.radius = radius;
    this.center = center;
  }
  
  public double getRadius() { return radius; }
  public Tuple getCenter() { return center; }
  
  public boolean contains(Tuple point) {
    return point.getDistance(center) <= radius * MULTIPLICATIVE_EPSILON;
  }
  
  public boolean contains(LinkedList<Tuple> points) {
    for (Tuple point : points) {
      if (!contains(point)) {
        return false;
      }
    }
    return true;
  }
}

double MULTIPLICATIVE_EPSILON = 1 + 1e-14;
