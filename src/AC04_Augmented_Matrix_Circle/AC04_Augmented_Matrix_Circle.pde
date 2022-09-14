// By Risou
// https://risoume.github.io/

color[] colors = {#99B898, #FECEA8, #FF847C, #E84A5F, #2A363B};
//color[] colors = {#FC354C , #29221F , #13747D , #0ABFBC , #FCF7C5};

int[][] A, B;
int[] b, b2;
int m, n;
int max = 20;
float s = 60; // size of grids
float off = 10;
color c, cBox;

PFont f;

void setup() {
  size(600, 600);
  //colorMode(HSB, 360, 100, max);
  colorMode(HSB, 360, max, 100);
  f = createFont("Courier New", 15);
  textFont(f);
  noLoop();
  init();
}

void init() {
  m = int(random(2, 5));
  n = int(random(2, 5));
  //m = 3;
  //n = 5;
  A = new int[m][n];
  b = new int[m];
  getAugMatrix(A, b);
  c = colors[int(random(colors.length))];
  //c = colors[4];
  cBox = 0;
  //cBox = 255;
}

void draw() {
  background(c);
  stroke(255);
  stroke(cBox);
  strokeWeight(20);
  line(0, 300, 600, 300);
  showGrid(A, b);
  frame(40);
}

void mouseReleased() {
  init();
  redraw();
}
