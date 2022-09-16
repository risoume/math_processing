
void getAugMatrix(int[][] M) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      M[i][j] = int(random(p));
    }
  }
}

void multiplyModn(int[][] A, int[][] B, int[][] C) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      for (int k = 0; k < n; k++) {
        C[i][j] += A[i][k]*B[k][j];
      }
      C[i][j] = C[i][j]%p;
    }
  }
}

void showGrid(int[][] M) {
  stroke(0);
  strokeWeight(10);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI);
  float d = 500;
  ellipse(0, 0, d+off, d+off);
  float t = 2*PI/n;
  float r = d/n;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      fill(colors[M[i][j]]);
      arc(0, 0, d-i*r, d-i*r, j*t, 2*PI);
    }
  }
  popMatrix();
}

void showMatrix(int[][] M) {
  fill(255); // For dark background
  //fill(0);
  textAlign(RIGHT);
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      str = M[i][j] + "";
      text(str, (j+1)*entrySize, (i+1)*entrySize);
    }
  }
}
