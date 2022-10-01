
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
  
  int k = int(random(colors.length));
  fill(colors[k]);
  triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
  
  fill(colors[(k+1)%colors.length]);
  pushMatrix();
  translate(p1.x, p1.y);
  rotate(-PI/2);
  triangle(0, 0, -d3*sin(-t3), -d3*cos(t3), 0, d1);
  popMatrix();
  
  fill(colors[(k+2)%colors.length]);
  pushMatrix();
  translate(p2.x, p2.y);
  rotate(-PI/2);
  triangle(0, 0, 0, d1, d2*sin(t2), -d2*cos(t2));
  popMatrix();

  fill(colors[(k+3)%colors.length]);
  pushMatrix();
  translate(p3.x, p3.y);
  rotate(-PI/2);
  triangle(0, 0, -d3*sin(-t3), -d3*cos(t3), d2*sin(t2), -d2*cos(t2));
  popMatrix();
  popMatrix();
}

void getPoint() {
  p1 = new PVector(200+int(random(-25, 25)), 350);
  p2 = new PVector(400+int(random(-25, 25)), 350);
  p3 = new PVector(300+int(random(-59, 50)), 200+int(random(-25, 25)));

  d1 = PVector.dist(p1, p2);
  d2 = PVector.dist(p2, p3);
  d3 = PVector.dist(p1, p3);

  t1 = PVector.sub(p1, p2).heading();
  t2 = PVector.sub(p2, p3).heading();
  t3 = PVector.sub(p3, p1).heading();
}
