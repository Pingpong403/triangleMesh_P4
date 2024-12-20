boolean intersect(Tuple p1, Tuple p2, Tuple p3, Tuple p4, Tuple intersect) {
  double x1 = p1.getX();
  double y1 = p1.getY();
  double x2 = p2.getX();
  double y2 = p2.getY();
  double x3 = p3.getX();
  double y3 = p3.getY();
  double x4 = p4.getX();
  double y4 = p4.getY();
  
  if ((x1 == x2 && y1 == y2) || (x3 == x4 && y3 == y4)) {
    return false;
  }
  
  double denominator = ((y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1));
  
  if (denominator == 0) {
    return false;
  }
  
  double ua = ((x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3)) / denominator;
  //double ub = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3)) / denominator;
  
  double x = x1 + ua * (x2 - x1);
  double y = y1 + ua * (y2 - y1);
  intersect.setX(x);
  intersect.setY(y);
  
  return true;
}
