// By Risou
// https://risoume.github.io/

color[] colors = {#F0D8A8, #86B8B1, #F2D694, #FA2A00};
int[][] M = new int[4][4];
int[] A = new int[4]; // temporary for swap
int[][] X; // Rule  for permutations

int n = 5;
int k;
float s, t;
int pad = 20;

void setup() {
  size(600, 600);
  noLoop();
  init();
}

void init() {
  s = width-2*pad;
  t = 2*PI/(n-1);
  
  k = int(random(3, 7)); // Number of alternating permutation
  X = new int[k][2];
  for (int i= 0; i < k; i++) {
    X[i][0] = int(random(0, 4));
    do {
      X[i][1] = int(random(0, 4));
    } while (X[i][1] == X[i][0]);
  }
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      M[i][j] = (i+j)%4;
    }
  }
}

void draw() {
  background(#fffbe6);
  background(0);
  strokeWeight(2);
  permute();
  pushMatrix();
  translate(300, 300);
  rotate(-(n-5)*t/4);
  geometricN(s/2, 0);
  popMatrix();
}

void geometricN(float s, int j) {
  for (int i = 0; i < n-1; i++) {
    fill(colors[M[j][i]]);
    triangle(0, 0, s*cos(i*t), s*sin(i*t), s*cos((i+1)*t), s*sin((i+1)*t));
  }
  if (s < 40) return;
  geometricN(s/sqrt(n), ++j);
}

void permute() {
  int a, b;
  int sign = 1;
  for (int i = 0; i < k; i++) {
    a = X[i][0];
    b = X[i][1];
    if (sign == 1) { // permute column a and b
      for (int j = 0; j < 4; j++) {
        A[j] = M[a][j];
        M[a][j] = M[b][j];
        M[b][j] = A[j];
      }
    } else { // permute row a and b
      for (int j = 0; j < 4; j++) {
        A[j] = M[j][a];
        M[j][a] = M[j][b];
        M[j][b] = A[j];
      }
    }
    sign *= -1;
  }
}

void mouseReleased() {
  init();
  redraw();
}
