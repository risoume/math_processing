// By Risou
// https://risoume.github.io/

color[] colors = {#99B898, #FECEA8, #FF847C, #E84A5F, #2A363B};
int d, m, t, curr, step;

void setup() {
  size(600, 600);
  noLoop();
  init();
}

void init() {
  m = 29;
  curr = 0;
  step = int(random(9, 14));
  //step = 20;
  d = 400;
  t = 4;
}

void draw() {
  background(colors[int(random(colors.length))]);
  //background(colors[4]); // 1 3 1 1 3
  strokeWeight(5);
  star(width/2, height/2, d/2, m);
  star2(width/2, height/2, d/2, m);
}

void mouseReleased() {
  init();
  redraw();
}
