
void getAugMatrix(int[][] M, int[] x) {
  int m = M.length;
  int n = M[0].length;
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      M[i][j] = int(random(-max-1, max+1));
    }
  }
  for (int i = 0; i < m; i++) {
    x[i] = int(random(-max-1, max+1));
  }
}

void showGrid(int[][] M, int[] x) {
  int m = M.length;
  int n = M[0].length;
  strokeWeight(10);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI);
  stroke(cBox);
  float d = 400;
  ellipse(0, 0, d+off, d+off);
  float t = 2*PI/(n+1);
  float r = d/m;
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (M[i][j] >= 0) fill(hue(c), M[i][j], 100);
      else fill((180+hue(c))%360, -M[i][j], 100);
      arc(0, 0, d-i*r, d-i*r, j*t, 2*PI);
    }
  }
  for (int i = 0; i < m; i++) {
    if (x[i] >= 0) fill(hue(c), x[i], 100);
    else fill((180+hue(c))%360, -x[i], 100);
    arc(0, 0, d-i*r, d-i*r, n*t, 2*PI);
  }
  popMatrix();
  
  fill(360); // For dark background
  //fill(0);
  for (int i = 0; i < m; i++) {
    String str = M[i][0] + "x_" + 1;
    for (int j = 1; j < n; j++) {
      if (M[i][j] >= 0) str += " + " + M[i][j] + "x_" + (j+1);
      else str += " - " + abs(M[i][j]) + "x_" + (j+1);
    }
    str += " = " + x[i];
    text(str, 30, 40+i*20);
  }
}

void frame(float b) {
  noFill();
  stroke(cBox);
  strokeWeight(b);
  rect(0, 0, width, height);
}
