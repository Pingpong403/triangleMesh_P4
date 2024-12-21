class Color {
  private int r;
  private int g;
  private int b;
  
  public Color() {
    r = rand.nextInt(0, 255);
    g = rand.nextInt(0, 255);
    b = rand.nextInt(0, 255);
  }
  
  public Color(Color c) {
    this.r = c.getR();
    this.g = c.getG();
    this.b = c.getB();
  }
  
  public Color(int value) {
    r = value;
    g = value;
    b = value;
  }
  
  public Color(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  public int getR() { return r; }
  public int getG() { return g; }
  public int getB() { return b; }
  public int getValue() {
    return (int)((double)(r + g + b) / 3.0);
  }
  
  public void setR(int r) { this.r = r; }
  public void setG(int g) { this.g = g; }
  public void setB(int b) { this.b = b; }
  public void setValue(int value) {
    r = g = b = value;
  }
  
  public Color interpolate(Color other, double ratio) {
    double diffR = other.getR() - r;
    double diffG = other.getG() - g;
    double diffB = other.getB() - b;
    
    return new Color((int)(r + diffR * ratio), (int)(g + diffG * ratio), (int)(b + diffB * ratio));
  }
  
  public void upR(int amount) { r += amount; }
  public void upG(int amount) { g += amount; }
  public void upB(int amount) { b += amount; }
  public void downR(int amount) { r -= amount; }
  public void downG(int amount) { g -= amount; }
  public void downB(int amount) { b -= amount; }
}
