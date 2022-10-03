// By Risou
// https://risoume.github.io/

color[] colors = {#F0D8A8, #3D1C00, #86B8B1, #F2D694, #FA2A00}; 
float s;
int pad = 20;
color c, c2;

void setup() {
  size(600, 600);
  noLoop();
  init();
}

void init() {
  s = width-2*pad;
}

void draw() {
  background(#fffbe6);
  strokeWeight(2);
  pushMatrix();
  translate(pad, pad);
  fill(#fffbe6);
  rect(0, 0, s, s);
  geometric(0, 0, s/2, 0);
  geometric(s/2, 0, s/2, 0);
  geometric(s/2, s/2, s/2, width/2-pad);
  geometric(0, s/2, s/2, width/2-pad);
  popMatrix();
}

void geometric(float x, float y, float s, float offY) {
  c = colors[int(random(colors.length))];
  fill(c);
  strokeWeight(2);
  rect(x, y, s/2, s);
  strokeWeight(1);
  float t = s/2;
  rectMode(RADIUS);
  while(t > s/15) {
    t *= 0.8;
    rect(x+s/4, y+s/2, t/2, t);
  }
  rectMode(CORNER);
  
  c2 = colors[int(random(colors.length))];
  while (c == c2) {
    c2 = colors[int(random(colors.length))];
  }
  fill(c2);
  strokeWeight(2);
  rect(x+s/2, y+s/2, s/2, s/2);
  strokeWeight(1);
  t = s/2;
  rectMode(RADIUS);
  while(t > s/15) {
    t *= 0.8;
    rect(x+3*s/4, y+3*s/4, t/2, t/2);
  }
  rectMode(CORNER);
  
  if (s < 50) return;
  geometric(x+s/2, offY, s/2, offY);
}

void mouseReleased() {
  init();
  redraw();
}
