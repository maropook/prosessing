class Window
{
  float sx, sy, dx, dy;

  Window(float a, float b) {
    if (displayWidth / 16 < displayHeight / 9)
    {
      sx = a;
      sy = (a / 16) * 9;
    } else {
      sx = (displayHeight / 9) * 16;
      sy = displayHeight;
    }
    dx = a;
    dy = b;
  }

  void screen()
  {
    background(125);
    translate((dx - sx) / 2, (dy - sy) / 2);
    fill(0);
    rect(0, 0, sx, sy);
    fill(255);
  }

  float sx()
  {
    return sx;
  }

  float sy()
  {
    return sy;
  }
}


void rect2(float x, float y, float a, float b)
{
  rect(x - a / 2, y - b / 2, a, b);
}
