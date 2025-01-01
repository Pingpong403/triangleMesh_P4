import java.util.LinkedList;
import java.util.List;
import java.util.Collections;
import java.util.Random;

Random rand = new Random();

// COLOR PRESETS

// Regular colors
Color BLACK = new Color(0);
Color WHITE = new Color(255);
Color GREY = new Color(128);
Color RED = new Color(255, 0, 0);
Color GREEN = new Color(0, 255, 0);
Color BLUE = new Color(0, 0, 255);
Color YELLOW = new Color(255, 255, 0);
Color MAGENTA = new Color(255, 0, 255);
Color AQUA = new Color(0, 255, 255);

// Custom colors
Color SAND = new Color(194, 178, 128);

// Favorite colors
Color NATHAN = new Color(0, 45, 4);
Color AMMON = new Color(135, 206, 235);
Color JOSH = new Color(0, 0, 128);
Color TANNER = new Color(100, 149, 237);

Color TOP_COLOR = BLUE;
Color BOTTOM_COLOR = RED;

// DOTS PRESETS
int MAX_DOTS = 500;
boolean DRAW_DOTS = true;
boolean DOTS_ARE_WHITE = false;
double DOT_SPEED = 0.5;


LinkedList<Dot> dots = new LinkedList<Dot>();

void setup() {
  size(1000, 700);
  
  for (int i = 0; i < MAX_DOTS; i++) {
    double posX = rand.nextInt(-200, 1200);
    double posY = rand.nextInt(-200, 900);
    Tuple p = new Tuple(posX, posY);
    
    double velX = rand.nextInt(-10000, 10000);
    double velY = rand.nextInt(-10000, 10000);
    Tuple v = new Tuple(velX, velY);
    v.normalize(DOT_SPEED);
    
    dots.add(new Dot(p, v));
  }
  
  // stationary dots
}

void draw() {
  background(255);
  
  Triangle superTriangle = findSuperTriangle(dots);
  LinkedList<Triangle> triangles = triangulate(dots, superTriangle);
  
  for (Triangle triangle : triangles) {
    triangle.drawTriangle();
  }
  
  for (Dot dot : dots) {
    if (DRAW_DOTS) dot.drawDot(DOTS_ARE_WHITE);
    dot.advance();
  }
}

// Handle key presses
void keyPressed() {
  // r and f to cycle rainbow of top and bottom colors, respectively
  if (key == 'r' || key == 'R') {
    if (checkOnRainbowCycle(TOP_COLOR)) { cycleRainbow(TOP_COLOR, 1); }
  }
  if (key == 'f' || key == 'F') {
    if (checkOnRainbowCycle(BOTTOM_COLOR)) { cycleRainbow(BOTTOM_COLOR, 1); }
  }
  // v to cycle both colors
  if (key == 'v' || key == 'V') {
    if (checkOnRainbowCycle(TOP_COLOR)) { cycleRainbow(TOP_COLOR, 1); }
    if (checkOnRainbowCycle(BOTTOM_COLOR)) { cycleRainbow(BOTTOM_COLOR, 1); }
  }
  
  // w and s to toggle white/black and visible dots, respectively
  
  if (key == 'w' || key == 'W') {
    DOTS_ARE_WHITE = !DOTS_ARE_WHITE;
  }
  if (key == 's' || key == 'S') {
    DRAW_DOTS = !DRAW_DOTS;
  }
}
