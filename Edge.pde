class Edge {
  private Vertex v1;
  private Vertex v2;
  
  public Edge(Vertex v1, Vertex v2) {
    this.v1 = v1;
    this.v2 = v2;
  }
  
  public Vertex getV1() { return v1; }
  public Vertex getV2() { return v2; }
  
  public boolean equals(Edge other) {
    return (v1.equals(other.getV1()) && v2.equals(other.getV2())) ||
        (v1.equals(other.getV2()) && v2.equals(other.getV1()));
  }
}
