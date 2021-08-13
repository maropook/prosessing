void ziki(float x, float y)
{
  stroke(200, 200, 200);
  fill(255, 0, 0);
  quad(x - 5, y + 2, x - 3, y + 8, x - 5, y + 14, x - 7, y + 8);
  quad(x + 5, y + 2, x + 3, y + 8, x + 5, y + 14, x + 7, y + 8);
  fill(255, 255, 255);
  triangle(x - 5, y - 2, x - 25, y + 3, x - 7, y + 3);
  triangle(x + 5, y - 2, x + 25, y + 3, x + 7, y + 3);
  triangle(x, y - 11, x + 7, y + 4, x - 6, y + 4);
  fill(0, 0, 255);
  triangle(x - 3, y - 18, x - 3, y + 7, x - 7, y + 7);
  triangle(x + 3, y - 18, x + 3, y + 7, x + 7, y + 7);
  fill(0, 0, 0);
  noStroke();
  ellipse(x, y, 3, 3);
}

void boss(float a, float b)
{
  if (bx < 30 || bx > 770)
  {
    bxx = -bxx;
  }
  bx += bxx;
  by += byy;
  stroke(0, 0, 0);
  fill(255, 0, 0);
  triangle(a - 1, b, a - 15, b - 2, a - 30, b - 15);
  triangle(a + 1, b, a + 15, b - 2, a + 30, b - 15);
  triangle(a - 1, b, a - 15, b + 2, a - 30, b + 15);
  triangle(a + 1, b, a + 15, b + 2, a + 30, b + 15);
  fill(0, 0, 0);
  ellipse(a, b, 10, 15);
  noStroke();
}