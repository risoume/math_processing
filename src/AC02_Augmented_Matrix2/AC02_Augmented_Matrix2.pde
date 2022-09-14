// By Risou
// https://risoume.github.io/

color[] colors = {#A92420, #D1913E, #0E3160, #135390};

int[][] A;
int [] b;
int m, n;
int max = 20;
float s; // size of grids
color c;

PFont f;

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, max);
  f = createFont("Courier New", 15);
  textFont(f);
  noLoop();
  init();
}

void init() {
  s = 80;
  m = int(random(2, 5));
  n = int(random(2, 5));
  //m = 4;
  //n = 3;
  A = new int[m][n];
  b = new int[m];
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      A[i][j] = int(random(-max-1, max+1));
    }
  }
  for (int i = 0; i < m; i++) {
    b[i] = int(random(-max-1, max+1));
  }
  c = colors[int(random(colors.length))];
  //c = colors[0];
}

void draw() {
  background(c);
  fill(0);
  fill(360); // For dark background
  for (int i = 0; i < m; i++) {
    String str = "";
    for (int j = 0; j < n-1; j++) {
      str += A[i][j] + "x_" + (j+1) + " + ";
    }
    str += A[i][n-1] + "x_" + n + " = " + b[i];
    text(str, 30, 40+i*20);
  }
 
  noStroke(); 
  pushMatrix();
  translate(width/2-s*(n+1)/2, height/2-s*m/2);
  float off = 8;
  
  fill(360);
  rect(0-off, 0-off, s*(n+1)+5*off/2, s*m+2*off);
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (A[i][j] >= 0) fill(hue(c), saturation(c), A[i][j]);
      else fill((180+hue(c))%360, saturation(c), -A[i][j]);
      rect(j*s, i*s, s, s);
    }
  }
  for (int i = 0; i < m; i++) {
    if (b[i] >= 0) fill(hue(c), saturation(c), b[i]);
    else fill((180+hue(c))%360, saturation(c), -b[i]);
    rect(n*s+off/2, i*s, s, s);
  }
  popMatrix();
  frame(40, 360);
}

void frame(float b, float cb) {
  noFill();
  stroke(cb);
  strokeWeight(b);
  rect(0, 0, width, height);
}

void mouseReleased() {
  init();
  redraw();
}
