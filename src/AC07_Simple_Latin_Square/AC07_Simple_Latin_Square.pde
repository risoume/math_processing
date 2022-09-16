// By Risou
// https://risoume.github.io/

color[] colors = {#00A5E3, #8DD7BF, #FF96C5, #FF5768, #FFBF65};
//color[] colors = {#F0D8A8, #3D1C00, #86B8B1, #F2D694, #FA2A00};
//color[] colors = {#FFEDBF , #F7803C , #F54828 , #2E0D23 , #F8E4C1};

int[][] M = new int[5][5];
int[] A = new int[5]; // temporary for swap
int[][] X; // Rule  for permutations

int n, t, prev, curr;
float s;
float mult = 0.8;

void setup() {
  size(600, 600);
  rectMode(RADIUS);
  noLoop();
  init();
}

void init() {
  n = 5;
  s = width/(n+1);
  t = int(random(3, 7)); // Number of alternating permutation
  //t = 1;
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
  background(#fffbe6);
  stroke(0);
  permute();
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (random(1) < 0.5) {
        circles((j+1)*s, (i+1)*s, s*mult, M[i][j]);
      } else {
        rects((j+1)*s, (i+1)*s, s*mult/2, M[i][j]);
      }
    }
  }
  console();
  noFill();
  stroke(0);
  strokeWeight(40);
  rect(300, 300, 300, 300);
}

void mouseReleased() {
  init();
  redraw();
}
