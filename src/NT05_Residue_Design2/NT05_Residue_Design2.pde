// By Risou
// https://risoume.github.io/

color[] colors = {#00A5E3, #8DD7BF, #FF96C5, #FF5768, #FFBF65};

float s;
float mult = 0.95;
int m, n, step;
int d = 500;
int pad = 20;
color c;

void setup() {
  size(600, 600);
  noLoop();
  init();
}

void init() {
  n = 5;
  s = (width-2*pad)/n;
  m = 53;
  //c = int(random(colors.length));
  c = 4;
}

void draw() {
  background(colors[c]);
  strokeWeight(1);
  
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      step = int(random(2, m));
      //step = 26;
      design(pad+j*s+s/2, pad+i*s+s/2, s*mult/2, step);
    }
  }
}

void design(float x, float y, float r, int step) {
  pushMatrix();
  translate(x, y);
  rotate(PI/(m-1));
  noStroke();
  fill(0);
  ellipse(0, 0, 2*r, 2*r);
  
  stroke(colors[c]);
  noFill();
  int k;
  float t = 2*PI/(m-1);
  for (int i = 1; i < m; i++) {
    k = i*step % m;
    line(r*cos((i-1)*t), r*sin((i-1)*t), r*cos((k-1)*t), r*sin((k-1)*t)); 
  }
  popMatrix();
}

void mouseReleased() {
  init();
  redraw();
}
