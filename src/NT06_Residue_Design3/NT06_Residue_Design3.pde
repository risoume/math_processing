// By Risou
// https://risoume.github.io/

color[] colors = {#00A5E3, #8DD7BF, #FF96C5, #FF5768, #FFBF65};

int d = 500;
int m, step;
color c;

void setup() {
  size(600, 600);
  noLoop();
  init();
}

void init() {
  m = 53;
  step = 35; // 14 48 3 35
  //c = int(random(colors.length));
  c = 0;
}

void draw() {
  background(colors[c]);
  noStroke();
  design(width/2, height/2, d/2);
}

void design(float x, float y, float r) {
  pushMatrix();
  translate(x, y);
  rotate(PI/(m-1));
  fill(0);
  ellipse(0, 0, 2*r, 2*r);
  fill(colors[c]);
  
  int k = step;
  float t = 2*PI/(m-1);
  beginShape();
  for (int i = 0; i < m-1; i++) {
    vertex(r*cos((k-1)*t), r*sin((k-1)*t));
    k = k*step % m;
  }
  endShape(CLOSE);
  popMatrix();
}

void mouseReleased() {
  init();
  redraw();
}
