class Tuple {
  private double x;
  private double y;
  
  public Tuple() {
    x = 0.0;
    y = 0.0;
  }
  
  public Tuple(double x, double y) {
    this.x = x;
    this.y = y;
  }
  
  public double getX() { return x; }
  public double getY() { return y; }
  
  public void setX(double x) { this.x = x; }
  public void setY(double y) { this.y = y; }
  
  public void addX(double x) { this.x += x; }
  public void addY(double y) { this.y += y; }
  public void add(Tuple tuple) {
    addX(tuple.getX());
    addY(tuple.getY());
  }
  
  public Tuple subtract(Tuple other) {
    return new Tuple(x - other.getX(), y - other.getY());
  }
  
  public void normalize(double magnitude) {
    double currentMag = sqrt((float)(x * x) + (float)(y * y));
    double ratio = magnitude / currentMag;
    x *= ratio;
    y *= ratio;
  }
  
  public double getDistance(Tuple other) {
    double diffX = x - other.getX();
    double diffY = y - other.getY();
    return sqrt((float)(diffX * diffX) + (float)(diffY * diffY));
  }
  
  public double getDistance(Vertex other) {
    double diffX = x - other.getX();
    double diffY = y - other.getY();
    return sqrt((float)(diffX * diffX) + (float)(diffY * diffY));
  }
  
  public double cross(Tuple other) {
    return x * other.getY() - y * other.getX();
  }
}
