LinkedList<Triangle> triangulate(LinkedList<Dot> dots, Triangle st) {
  LinkedList<Triangle> triangles = new LinkedList<Triangle>();
  triangles.add(st);
  
  for (Dot dot : dots) {
    addVertex(dot, triangles);
  }
  
  LinkedList<Triangle> tRemove = new LinkedList<Triangle>();
  for (Triangle triangle : triangles) {
    if (
      triangle.getV1() == st.getV1() || triangle.getV1() == st.getV2() || triangle.getV1() == st.getV3() ||
      triangle.getV2() == st.getV1() || triangle.getV2() == st.getV2() || triangle.getV2() == st.getV3() ||
      triangle.getV3() == st.getV1() || triangle.getV3() == st.getV2() || triangle.getV3() == st.getV3()
    ) {
      tRemove.push(triangle);
    }
  }
  
  for (Triangle t : tRemove) {
    triangles.remove(t);
  }
  
  return triangles;
}

// Return same list of triangles? Make a new one? Keep?
void addVertex(Dot dot, LinkedList<Triangle> triangles) {
  LinkedList<Edge> edges = new LinkedList<Edge>();
  
  LinkedList<Triangle> tRemove = new LinkedList<Triangle>();
  for (Triangle t : triangles) {
    if (t.inCircumcircle(new Vertex(dot.getPos()))) {
      edges.push(new Edge(t.getV1(), t.getV2()));
      edges.push(new Edge(t.getV2(), t.getV3()));
      edges.push(new Edge(t.getV3(), t.getV1()));
      tRemove.push(t);
    }
  }
  
  for (Triangle t : tRemove) {
    triangles.remove(t);
  }
  
  edges = uniqueEdges(edges);
  
  for (Edge edge : edges) {
    triangles.push(new Triangle(edge.getV1(), edge.getV2(), new Vertex(dot.getPos())));
  }
}

LinkedList<Edge> uniqueEdges(LinkedList<Edge> edges) {
  LinkedList<Edge> uniqueEdges = new LinkedList<Edge>();
  boolean isUnique = true;
  for (int i = 0; i < edges.size(); i++) {
    isUnique = true;
    
    for (int j = 0; j < edges.size(); j++) {
      if (i != j && edges.get(i).equals(edges.get(j))) {
        isUnique = false;
        break;
      }
    }
    if (isUnique) {
      uniqueEdges.push(edges.get(i));
    }
  }
  return uniqueEdges;
}
