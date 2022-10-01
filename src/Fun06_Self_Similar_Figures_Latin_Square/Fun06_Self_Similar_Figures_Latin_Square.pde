// By Risou
// https://risoume.github.io/

color[] colors = {#00A5E3, #8DD7BF, #FF96C5, #FF5768, #FFBF65};

int[][] M = new int[5][5];
int[] A = new int[5]; // temporary for swap
int[][] X; // Rule  for permutations

int n, t, prev, curr;
float s;
float mult = 0.8;

float b, h;
int pad = 20;

void setup() {
  size(600, 600);
  rectMode(RADIUS);
  noLoop();
  init();
}

void init() {
  b = width-2*pad;
  h = b;
  
  n = 5;
  t = int(random(3, 7)); // Number of alternating permutation
  X = new int[t][2];
  for (int i= 0; i < t; i++) {
    X[i][0] = int(random(0, 5));
    do {
      X[i][1] = int(random(0, 5));
    } while (X[i][1] == X[i][0]);
  }
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      M[i][j] = (i+j)%5;
    }
  }
}

void draw() {
  background(0);
  pushMatrix();
  translate(pad, pad);
  triangles(0, 0, b, h);
  translate(b, h);
  rotate(-PI);
  triangles(0, 0, b, h);
  popMatrix();
}

void triangles(float x, float y, float b, float h) {
  strokeWeight(2);
  fill(colors[int(random(colors.length))]);
  triangle(x, y, x, y+h, x+b, y+h);
  s = b/(2*(n+1));
  permute();
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (random(1) < 0.5) {
        circles(x+(j+1)*s, y+h/2+(i+1)*s, s*mult, M[i][j]);
      } else {
        rects(x+(j+1)*s, y+h/2+(i+1)*s, s*mult/2, M[i][j]);
      }
    }
  }
  if (b < 50) return;
  triangles(x, y, b/2, h/2);
  triangles(x+b/2, y+h/2, b/2, h/2);
}

void mouseReleased() {
  init();
  redraw();
}
