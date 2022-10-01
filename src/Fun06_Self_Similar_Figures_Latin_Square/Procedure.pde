
void circles(float x, float y, float size, int prev) {
  pushMatrix();
  translate(x, y);
  fill(colors[prev]);
  strokeWeight(1);
  ellipse(0, 0, size, size);
  
  float angle = random(-PI, PI); 
  rotate(angle);
  curr = int(random(colors.length));
  while (curr == prev) {
    curr = int(random(colors.length));
  }
  fill(colors[curr]);
  ellipse(size/4, 0, size/2, size/2);
  popMatrix();
}

void rects(float x, float y, float size, int prev) {
  pushMatrix();
  translate(x, y);
  fill(colors[prev]);
  strokeWeight(1);
  rect(0, 0, size, size);
  float[][] coor = {{0, 0}, {size/2, 0}, {0, size/2}, {-size/2, 0}, {0, -size/2}};
  
  int q = int(random(coor.length));
  translate(coor[q][0], coor[q][1]);
  curr = int(random(colors.length));
  while (curr == prev) {
    curr = int(random(colors.length));
  }
  fill(colors[curr]);
  rect(0, 0, size/2, size/2);
  popMatrix();
}

void permute() {
  int a, b;
  int sign = 1;
  for (int i = 0; i < t; i++) {
    a = X[i][0];
    b = X[i][1];
    if (sign == 1) { // permute column a and b
      for (int j = 0; j < 5; j++) {
        A[j] = M[a][j];
        M[a][j] = M[b][j];
        M[b][j] = A[j];
      }
    } else { // permute row a and b
      for (int j = 0; j < 5; j++) {
        A[j] = M[j][a];
        M[j][a] = M[j][b];
        M[j][b] = A[j];
      }
    }
    sign *= -1;
  }
}
