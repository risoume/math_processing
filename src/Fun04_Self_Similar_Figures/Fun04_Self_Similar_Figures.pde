// By Risou
// https://risoume.github.io/

color[] colors = {#00A5E3, #8DD7BF, #FF96C5, #FF5768, #FFBF65};
float b, h;
int pad = 20;

void setup() {
  size(600, 600);
  noLoop();
  init();
}

void init() {
  b = width-2*pad;
  h = b;
}

void draw() {
  background(#fffbe6);
  strokeWeight(1);

  pushMatrix();
  translate(pad, pad);
  triangles(0, 0, b, h);
  translate(b, h);
  rotate(-PI);
  triangles(0, 0, b, h);
  popMatrix();
}

void triangles(float x, float y, float b, float h) {
  fill(colors[int(random(colors.length))]);
  triangle(x, y, x, y+h, x+b, y+h);
  for (int i = 0; i < 10; i++) {
    line(x+(i+1)*b/10, y, x+(i+1)*b/10, y+h);
  }
  if (b < 20) return;
  triangles(x, y, b/2, h/2);
  triangles(x+b/2, y+h/2, b/2, h/2);
}

void mouseReleased() {
  init();
  redraw();
}
