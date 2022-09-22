
void star(float x, float y, float r, int m, int step) {
  pushMatrix();
  translate(x, y);
  fill(0);
  stroke(colors[2]);
  ellipse(0, 0, 2*r, 2*r);
  fill(colors[int(random(colors.length))]);
  //fill(colors[0]);
  stroke(colors[int(random(colors.length))]);
  //stroke(colors[4]);
  beginShape();
  for (int i = 0; i < m; i++) {
    vertex(r*cos(2*curr*PI/m), r*sin(2*curr*PI/m));
    curr = (curr+step) % m;
    r += t;
  }
  endShape(CLOSE);
  popMatrix();
}

void star2(float x, float y, float r, int m, int step) {
  pushMatrix();
  translate(x, y);
  noFill();
  stroke(colors[int(random(colors.length))]);
  stroke(colors[4]);
  beginShape();
  for (int i = 0; i < m; i++) {
    vertex(r*cos(2*curr*PI/m), r*sin(2*curr*PI/m));
    curr = (curr+step) % m;
  }
  endShape(CLOSE);
  popMatrix();
}
