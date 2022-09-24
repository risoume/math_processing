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
  m = 151;
  step = int(random(2, m));
  //step = 53; // 39, 53, 9, 50
  //c = int(random(colors.length));
  c = 2;
}

void draw() {
  background(colors[c]);
  strokeWeight(1);
  design(width/2, height/2, d/2);
}

void design(float x, float y, float r) {
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
