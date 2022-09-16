// By Risou
// https://risoume.github.io/

int[][][] U = {
  {{1,0}, {0,1}},
  {{1,0}, {1,1}},
  {{1,1}, {0,1}},
  {{1,1}, {1,0}},
  {{0,1}, {1,1}},
  {{0,1}, {1,0}}
};

int n = 2;
int p = 2;
int t = 7;
float s = 60; // size of grids
float off = 10;
float pad = 60;
float wFrame, hFrame, gridSize, entrySize;
color c = #29221F;
color c2 = #7DFFFF;
PFont f;

void setup() {
  size(600, 600);
  f = createFont("Courier New", 20);
  textFont(f);
  noLoop();
  init();
}

void init() {
  n = 2;
  wFrame = width-2*pad;
  hFrame = wFrame;
  gridSize = wFrame/t;
  entrySize = gridSize/(n+1);
}

void draw() {
  background(c);
  strokeWeight(1);
  stroke(255);
  fill(c);
  line(pad+gridSize, 0, pad+gridSize, height);
  line(0, pad+gridSize, width, pad+gridSize);
  
  for (int i = 1; i < t; i++) {
    noFill();
    strokeWeight(2);
    pushMatrix();
    translate(pad+i*gridSize, pad);
    scale(gridSize/width);
    showGrid(U[i-1]);
    popMatrix();
  }
  
  for (int i = 1; i < t; i++) {
    noFill();
    strokeWeight(2);
    pushMatrix();
    translate(pad, pad+i*gridSize);
    scale(gridSize/width);
    showGrid(U[i-1]);
    popMatrix();
  }
  
  for (int i = 1; i < t; i++) {
    for (int j = 1; j < t; j++) {
      noFill();
      strokeWeight(2);
      pushMatrix();
      translate(pad+j*gridSize, pad+i*gridSize);
      scale(gridSize/width);
      showGrid(multiplyModn(U[i-1], U[j-1]));
      popMatrix();
    }
  }
}
