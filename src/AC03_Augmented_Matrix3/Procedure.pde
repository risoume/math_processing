
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
  pushMatrix();
  translate(3*width/4-s*(n+1)/2, height/2-s*m-off);
  noStroke(); 
  //fill(255);
  fill(0);
  rect(0-off, 0-off, s*(n+1)+5*off/2, s*m+2*off);
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (M[i][j] >= 0) fill(hue(c), saturation(c), map(M[i][j], 0, max, 0, 255));
      else fill((180+hue(c))%360, saturation(c), map(-M[i][j], 0, max, 0, 255));
      rect(j*s, i*s, s, s);
    }
  }
  for (int i = 0; i < m; i++) {
    if (x[i] >= 0) fill(hue(c), saturation(c), map(x[i], 0, max, 0, 255));
    else fill((180+hue(c))%360, saturation(c), map(-x[i], 0, max, 0, 255));
    rect(n*s+off/2, i*s, s, s);
  }
  popMatrix();
  
  fill(255); // For dark background
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

void frame(float b, float cb) {
  noFill();
  stroke(cb);
  strokeWeight(b);
  rect(0, 0, width, height);
}
