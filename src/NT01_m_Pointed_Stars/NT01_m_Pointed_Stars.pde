// By Risou
// https://risoume.github.io/

color[] colors = {#99B898, #FECEA8, #FF847C, #E84A5F, #2A363B};
int d, m, curr, step;

void setup() {
  size(600, 600);
  noLoop();
  init();
}

void init() {
  m = 17;
  curr = 0;
  step = int(random(1, 8));
  //step = 6;
  d = 400;
}

void draw() {
  background(colors[int(random(colors.length))]);
  //background(colors[2]);
  strokeWeight(5);
  star(width/2, height/2, d/2, m);
}

void star(float x, float y, float r, int m) {
  pushMatrix();
  translate(x, y);
  fill(0);
  stroke(colors[2]);
  ellipse(0, 0, 2*r, 2*r);
  fill(colors[int(random(colors.length))]);
  //fill(colors[4]);
  stroke(colors[int(random(colors.length))]);
  //stroke(colors[1]);
  beginShape();
  for (int i = 0; i < m; i++) {
    vertex(r*cos(2*curr*PI/m), r*sin(2*curr*PI/m));
    curr = (curr+step) % m;
  }
  endShape(CLOSE);
  popMatrix();
}

void mouseReleased() {
  init();
  redraw();
}
