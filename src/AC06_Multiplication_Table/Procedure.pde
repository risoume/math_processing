
int[][] multiplyModn(int[][] A, int[][] B) {
  int[][] C = new int[n][n];
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      for (int k = 0; k < n; k++) {
        C[i][j] += A[i][k]*B[k][j];
      }
      C[i][j] = C[i][j]%p;
    }
  }
  return C;
}

void showGrid(int[][] M) {
  stroke(0);
  strokeWeight(10);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI);
  float d = 480;
  ellipse(0, 0, d+off, d+off);
  float t = 2*PI/n;
  float r = d/n;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (M[i][j] == 0) fill(c);
      else fill(c2);
      arc(0, 0, d-i*r, d-i*r, j*t, 2*PI);
    }
  }
  popMatrix();
}
