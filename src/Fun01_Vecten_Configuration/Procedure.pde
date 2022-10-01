
void vecten(float x, float y) {
  getPoint();
  pushMatrix();
  translate(x, y);
  strokeWeight(2);
  stroke(0);
  //stroke(255);
  noFill();
  rect(0, 0, s, s);
  scale(scl);
  strokeWeight(6);
  fill(colors[int(random(colors.length))]);
  triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  triangle(p1.x, p1.y, p1.x-d3*sin(-t3), p1.y-d3*cos(t3), p1.x, p1.y+d1);
  triangle(p2.x, p2.y, p2.x, p2.y+d1, p2.x+d2*sin(t2), p2.y-d2*cos(t2));
  triangle(p3.x, p3.y, p3.x-d3*sin(-t3), p3.y-d3*cos(t3), p3.x+d2*sin(t2), p3.y-d2*cos(t2));
  popMatrix();
}

void getPoint() {
  p1 = new PVector(200+int(random(-25, 25)), 350);
  p2 = new PVector(400+int(random(-25, 25)), 350);
  p3 = new PVector(300+int(random(-50, 50)), 200+int(random(-25, 25)));

  d1 = PVector.dist(p1, p2);
  d2 = PVector.dist(p2, p3);
  d3 = PVector.dist(p1, p3);

  t1 = PVector.sub(p1, p2).heading();
  t2 = PVector.sub(p2, p3).heading();
  t3 = PVector.sub(p3, p1).heading();
}
