// By Risou
// https://risoume.github.io/

color[] colors = {#99B898, #FECEA8, #FF847C, #E84A5F, #2A363B};
float s, t;
float mult = 0.75;
int d, n, m, curr;
int pad = 40;

PFont f;

void setup() {
  size(600, 600);
  f = createFont("Courier New", 16);
  textFont(f);
  noLoop();
  init();
}

void init() {
  n = 4;
  s = (width-2*pad)/n;
  m = 41;
  curr = 0;
  d = 200;
  t = 0.9;
}

void draw() {
  background(colors[int(random(colors.length))]);
  background(colors[1]);
  strokeWeight(2);
  
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      int k = int(random(13, 19));
      star(pad+j*s+s/2, pad+i*s+s/2, s*mult/2, m, k);
      star2(pad+j*s+s/2, pad+i*s+s/2, s*mult/2, m, k);
    }
  }
}

void mouseReleased() {
  init();
  redraw();
}
