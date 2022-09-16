// By Risou
// https://risoume.github.io/

color[] colors = {#F0D8A8, #3D1C00, #86B8B1, #F2D694, #FA2A00};

int[][][] U;
int n;
int p = 5;
float s = 60; // size of grids
float off = 10;
float pad = 20;
float wFrame, hFrame, gridSize, entrySize;
color c;
String str;
PFont f;

void setup() {
  size(600, 600);
  f = createFont("Courier New", 20);
  textFont(f);
  noLoop();
  init();
}

void init() {
  //n = int(random(2, 6));
  n = 6;
  wFrame = width-2*pad;
  hFrame = 2*wFrame/3;
  gridSize = wFrame/3;
  entrySize = gridSize/(n+1);
  
  U = new int[3][n][n];
  getAugMatrix(U[0]);
  getAugMatrix(U[1]);
  multiplyModn(U[0], U[1], U[2]);

  //c = colors[int(random(colors.length))];
  c = colors[2];
}

void draw() {
  background(colors[3]);
  stroke(0);
  strokeWeight(10);
  fill(c);
  rect(pad, (height-hFrame)/2, wFrame, hFrame);
  line(pad, 300, width-pad, 300);
  line(pad+2*gridSize, (height-hFrame)/2, pad+2*gridSize, (height+hFrame)/2);
  for (int i = 0; i < 3; i++) {
    pushMatrix();
    translate(pad+i*gridSize, (height)/2);
    scale(gridSize/width);
    showGrid(U[i]);
    popMatrix();
    
    pushMatrix();
    translate(pad+i*gridSize, (height-hFrame)/2);
    showMatrix(U[i]);
    popMatrix();
  }
  fill(0);
  textAlign(LEFT);
  text("A little story about GL("+n+",Z_"+p+")", pad, (height+hFrame)/2+40);
}

void mouseReleased() {
  init();
  redraw();
}
