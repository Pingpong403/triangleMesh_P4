Triangle findSuperTriangle(LinkedList<Dot> allDots) {  
  LinkedList<Dot> shuffled = new LinkedList<Dot>(allDots);
  Collections.shuffle(shuffled, new Random());
  
  Circle c = null;
  for (int i = 0; i < shuffled.size(); i++) {
    Dot d = shuffled.get(i);
    if (c == null || !c.contains(d.getPos())) {
      c = makeCircleOnePoint(shuffled.subList(0, i + 1), d);
    }
  }
  
  // r, x, and y are known.
  double r = c.getRadius();
  double x = c.getCenter().getX();
  double y = c.getCenter().getY();
  
  // l is the side length of the super triangle (we are making it an equilateral)
  // h is the height of the triangle (the triangle will be flat at the bottom)
  double l = (9 * r) / sqrt(2);
  double h = sqrt((float)((l * l) - ((l * l) / 4)));
  
  // V1 = (x, y - h - r)
  // V2 = (x - l/2, y + r)
  // V3 = (x + l/2, y + r)
  Tuple t1 = new Tuple(x, y - (h - r));
  Tuple t2 = new Tuple(x - (l / 2), y + r);
  Tuple t3 = new Tuple(x + (l / 2), y + r);
  
  return new Triangle(new Vertex(t1), new Vertex(t2), new Vertex(t3));
}

// One boundary point known
Circle makeCircleOnePoint(List<Dot> dots, Dot dot) {
  Circle c = new Circle(0, dot.getPos());
  for (int i = 0; i < dots.size(); i++) {
    Dot d = dots.get(i);
    if (!c.contains(d.getPos())) {
      if (c.getRadius() == 0) {
        c = makeDiameter(dot.getPos(), d.getPos());
      }
      else {
        c = makeCircleTwoPoints(dots.subList(0, i + 1), dot, d);
      }
    }
  }
  return c;
}

// Two boundary points known
Circle makeCircleTwoPoints(List<Dot> dots, Dot d1, Dot d2) {
  Circle c = makeDiameter(d1.getPos(), d2.getPos());
  Circle left  = null;
  Circle right = null;
  
  Tuple d12 = new Tuple(d2.getX() - d1.getX(), d2.getY() - d1.getY());
  for (Dot dot : dots) {
    if (c.contains(dot.getPos())) {
      continue;
    }
    double cross = d12.cross(new Tuple(dot.getX() - d1.getX(), dot.getY() - d1.getY()));
    Circumcircle cc = new Circumcircle(new Vertex(d1.getPos()), new Vertex(d2.getPos()), new Vertex(dot.getPos()));
    Circle ccc = new Circle(cc.getRadius(), cc.getCenter());
    if (ccc == null) {
      continue;
    }
    else if (cross > 0 && (left == null || d12.cross(ccc.getCenter().subtract(d1.getPos())) > d12.cross(left.getCenter().subtract(d1.getPos())))) {
      left = ccc;
    }
    else if (cross < 0 && (right == null || d12.cross(ccc.getCenter().subtract(d1.getPos())) < d12.cross(right.getCenter().subtract(d1.getPos())))) {
      right = ccc;
    }
  }
  
  if (left == null && right == null) {
    return c;
  }
  else if (left == null) {
    return right;
  }
  else if (right == null) {
    return left;
  }
  else {
    return left.getRadius() <= right.getRadius() ? left : right;
  }
}

Circle makeDiameter(Tuple a, Tuple b) {
  Tuple c = new Tuple( (a.getX() + b.getX()) / 2, (a.getY() + b.getY()) / 2 );
  return new Circle(Math.max(c.getDistance(a), c.getDistance(b)), c);
}
