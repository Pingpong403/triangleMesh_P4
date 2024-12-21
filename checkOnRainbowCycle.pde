boolean checkOnRainbowCycle(Color c) {
  // to be classified as on the rainbow cycle, a color's values must add up to 255 and at least one color must be 0
  boolean addUp = c.getR() + c.getG() + c.getB() == 255;
  boolean oneZero = c.getR() == 0 || c.getG() == 0 || c.getB() == 0;
  return addUp && oneZero;
}
