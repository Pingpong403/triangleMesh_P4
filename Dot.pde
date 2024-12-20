class Dot {
  private Tuple pos;
  private Tuple vel;
  private int size;
  private boolean stationary;
  
  public Dot() {
    pos = new Tuple();
    vel = new Tuple();
    size = 0;
    stationary = true;
  }
  
  public Dot(Tuple position, boolean stationary) {
    pos = position;
    vel = new Tuple();
    size = rand.nextInt(3, 7);
    this.stationary = stationary;
  }
  
  public Dot(Tuple position, Tuple velocity) {
    pos = position;
    vel = velocity;
    size = rand.nextInt(3, 7);
    stationary = false;
  }
  
  public Dot(double x, double y, double velX, double velY) {
    pos = new Tuple(x, y);
    vel = new Tuple(velX, velY);
    stationary = false;
  }
  
  public Tuple getPos() { return pos; }
  public double getX() { return pos.getX(); }
  public double getY() { return pos.getY(); }
  
  public void drawDot(boolean white) {
    noStroke();
    fill(white ? 255 : 0);
    circle((float)pos.getX(), (float)pos.getY(), size);
  }
  
  public void advance() {
    if (stationary) { return; }
    pos.add(vel);
    if (pos.getX() > 1200) { pos.addX(-1400); }
    if (pos.getY() >  900) { pos.addY(-1100); }
    if (pos.getX() < -200) { pos.addX( 1400); }
    if (pos.getY() < -200) { pos.addY( 1100); }
  }
}
