
void circles(float x, float y, float size, int prev) {
  pushMatrix();
  translate(x, y);
  fill(colors[prev]);
  strokeWeight(2);
  ellipse(0, 0, size, size);
  
  float angle = random(-PI, PI); 
  rotate(angle);
  curr = int(random(colors.length));
  while (curr == prev) {
    curr = int(random(colors.length));
  }
  fill(colors[curr]);
  fill(colors[(prev+1)%5]);
  strokeWeight(1);
  ellipse(size/4, 0, size/2, size/2);
  popMatrix();
}

void rects(float x, float y, float size, int prev) {
  pushMatrix();
  translate(x, y);
  fill(colors[prev]);
  strokeWeight(2);
  rect(0, 0, size, size);
  float[][] coor = {{0, 0}, {size/2, 0}, {0, size/2}, {-size/2, 0}, {0, -size/2}};
  
  int q = int(random(coor.length));
  translate(coor[q][0], coor[q][1]);
  curr = int(random(colors.length));
  while (curr == prev) {
    curr = int(random(colors.length));
  }
  fill(colors[curr]);
  fill(colors[(prev+1)%5]);
  strokeWeight(1);
  rect(0, 0, size/2, size/2);
  popMatrix();
}

void pattern(float x, float y, float size, int k) {
  pushMatrix();
  translate(x, y);
  noFill();
  rect(0, 0, size/2, size/2);
  strokeWeight(1);
  switch(k) {
    case 0:
      arc(-size/2, 0, size, size, -PI/2, PI/2); //left
      arc(size/2, 0, size, size, PI/2, 3*PI/2); //right
      arc(0, -size/2, size, size, 0, PI); //up
      arc(0, size/2, size, size, PI, 2*PI); //bottom
      break;
    case 1:
      for (int i = 1; i < 8; i++) {
        line(-size/2+i*size/8, -size/2, -size/2+i*size/8, size/2);
      }
      break;
    case 2:
      triangle(-size/2, -size/2, -size/2, size/2, size/4, 0);
      triangle(size/2, -size/2, size/2, size/2, -size/4, 0);
      break;
    case 3:
      line(-size/2, -size/4, size/2, -size/4);
      line(-size/2, size/4, size/2, size/4);
      line(-size/4, -size/2, -size/4, size/2);
      line(size/4, -size/2, size/4, size/2);
      break;
    case 4:
      arc(-size/2, -size/2, size, size, 0, PI/2);
      arc(-size/2, size/2, size, size, -PI/2, 0);
      arc(size/2, size/2, size, size, PI, 3*PI/2);
      arc(size/2, -size/2, size, size, PI/2, PI);
      break;
  }
  popMatrix();
}

void permute(int[][] M, int[][] X) {
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

void console(int[][] M, int[][] X) {
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      print(M[i][j]+" ");
    }
    println();
  }
  for (int i= 0; i < t; i++) {
    print(X[i][0],"<>", X[i][1], " | ");
  }
  println();
}
