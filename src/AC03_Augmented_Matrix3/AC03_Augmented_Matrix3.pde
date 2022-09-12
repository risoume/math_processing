// By Risou
// https://risoume.github.io/

color[] colors = {#1C0113 , #6B0103 , #A30006 , #C21A01 , #F03C02};
//color[] colors = {#FC354C , #29221F , #13747D , #0ABFBC , #FCF7C5};

int[][] A, B;
int[] b, b2;
int m, n;
int max = 20;
float s = 40; // size of grids
float off = 5;
color c;

PFont f;

void setup() {
  size(600, 600);
  colorMode(HSB);
  f = createFont("Courier New", 15);
  textFont(f);
  noLoop();
  init();
}

void init() {
  m = int(random(2, 5));
  n = int(random(2, 5));
  A = new int[m][n];
  b = new int[m];
  m = int(random(2, 5));
  n = int(random(2, 5));
  B = new int[m][n];
  b2 = new int[m];
  getAugMatrix(A, b);
  getAugMatrix(B, b2);
  c = colors[int(random(colors.length))];
  //c = colors[1];
}

void draw() {
  background(c);
  stroke(255);
  strokeWeight(20);
  line(0, 300, 600, 300);
  
  showGrid(A, b);
  translate(width, height);
  rotate(PI);
  showGrid(B, b2);
  frame(40, 255);
}

void mouseReleased() {
  init();
  redraw();
}
