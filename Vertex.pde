class Vertex {
  private Tuple pos;
  
  public Vertex(Tuple pos) {
    this.pos = pos;
  }
  
  public Tuple getPos() { return pos; }
  public double getX() { return pos.getX(); }
  public double getY() { return pos.getY(); }
  
  public boolean equals(Vertex other) {
    return other.getPos().getX() == pos.getX() && other.getPos().getY() == pos.getY();
  }
  
  public double distance(Vertex other) {
    double diffX = pos.getX() - other.getX();
    double diffY = pos.getY() - other.getY();
    return sqrt((float)(diffX * diffX) + (float)(diffY * diffY));
  }
}
