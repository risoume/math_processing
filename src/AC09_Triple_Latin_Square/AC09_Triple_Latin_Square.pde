// By Risou
// https://risoume.github.io/

color[] colors = {#00A5E3, #8DD7BF, #FF96C5, #FF5768, #FFBF65};

int[][] M = new int[5][5];
int[][] N = new int[5][5];
int[][] O = new int[5][5];
int[] A = new int[5]; // temporary for swap
int[][] X, Y, Z; // Rule  for permutations

int n, t, prev, curr;
float s;
float mult = 0.5;
int pad = 60;

PFont f;

void setup() {
  size(600, 600);
  rectMode(RADIUS);
  f = createFont("Courier New", 16);
  textFont(f);
  noLoop();
  init();
}

void init() {
  n = 5;
  s = (width-2*pad)/n;
  t = int(random(3, 7)); // Number of alternating permutation
  X = new int[t][2];
  Y = new int[t][2];
  Z = new int[t][2];
  for (int i= 0; i < t; i++) {
    X[i][0] = int(random(0, 5));
    Y[i][0] = int(random(0, 5));
    Z[i][0] = int(random(0, 5));
    do {
      X[i][1] = int(random(0, 5));
    } while (X[i][1] == X[i][0]);
    do {
      Y[i][1] = int(random(0, 5));
    } while (Y[i][1] == Y[i][0]);
    do {
      Z[i][1] = int(random(0, 5));
    } while (Z[i][1] == Z[i][0]);
  }
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      M[i][j] = (i+j)%5;
      N[i][j] = (i+j)%5;
      O[i][j] = (i+j)%5;
    }
  }
}

void draw() {
  background(#fffbe6);
  stroke(0);
  permute(M, X);
  permute(N, Y);
  permute(O, Z);
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      strokeWeight(1);
      pattern(pad+j*s+s/2, pad+i*s+s/2, s, N[i][j]);
      dots(pad+j*s+s/2, pad+i*s+s/2, s, O[i][j]);
      if (random(1) < 0.5) {  
        circles(pad+j*s+s/2, pad+i*s+s/2, s*mult, M[i][j]);
      } else {
        rects(pad+j*s+s/2, pad+i*s+s/2, s*mult/2, M[i][j]);
      }
    }
  }
  
  noFill();
  stroke(0);
  strokeWeight(40);
  rect(300, 300, 300, 300);
  fill(0);
  textAlign(LEFT);
  String str = "";
  for (int i= 0; i < t; i++) {
    str += X[i][0]+""+X[i][1];
  }
  str += "-";
  for (int i= 0; i < t; i++) {
    str += Y[i][0]+""+Y[i][1];
  }
  str += "-";
  for (int i= 0; i < t; i++) {
    str += Z[i][0]+""+Z[i][1];
  }
  text("Code: "+str, 60, height-35);
}

void mouseReleased() {
  init();
  redraw();
}
