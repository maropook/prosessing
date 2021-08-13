void menu(float a, float b, float c, float d, String e, String f[], int g, int h)
{
  stroke(255);
  fill(0);
  rect(a, b, c, d);
  rect(a + c / 4, b - wind.sx() / 50, c / 2, wind.sx() / 25);
  fill(255);
  textSize((wind.sx() / 60));
  textAlign(CENTER, CENTER);
  text(e, a + c / 2, b);
  if (mouseX > a + c / 4 && mouseX < a + c / 4 + c / 2 && mouseY > b - wind.sx() / 50 && mouseY < b - wind.sx() / 50 + wind.sx() / 25)
  {
    fill(0, 255, 0);
    rect(a + c / 4, b - wind.sx() / 50, c / 2, wind.sx() / 25);
    fill(255);
    text("ENTER",a + c / 2,b);
    bb = 1;
  } else {
    bb = 0;
  }
  fill(255);
  textAlign(LEFT, CENTER);
  for (int i = 0; i * wind.sx() / 50 < d - wind.sx() / 50 * 3; i++)
  {
    if (f.length > g + i)
    {
      text(f[g + i], a + wind.sx() / 50 * 2, b + wind.sx() / 50 * 2 + wind.sx() / 50 * i);
    }
    text("→", a + wind.sx() / 50, b + wind.sx() / 50 * 2);
  }
}

int menu_change(int g, int a)
{
  if (keyCode == UP)
  {
    if (g > 0)
    {
      g--;
    }
  } else if (keyCode == DOWN)
  {
    if (g < a)
    {
      g++;
    }
  }
  return(g);
}
