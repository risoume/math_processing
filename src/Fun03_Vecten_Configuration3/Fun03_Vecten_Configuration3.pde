// By Risou
// https://risoume.github.io/

color[] colors = {#FC354C , #29221F , #13747D , #0ABFBC , #FCF7C5};

PVector p1, p2, p3;
float d1, d2, d3, t1, t2, t3, s, scl;
int n;
int pad = 20;

void setup() {
  size(600, 600);
  noLoop();
  init();
}

void init() {
  n = 4;
  s = (width-2*pad)/n;
  scl = s/width;
}

void draw() {
  //background(colors[int(random(colors.length))]);
  background(colors[1]);

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      vecten(pad+j*s, pad+i*s);
    }
  }
}

void mouseReleased() {
  init();
  redraw();
}
