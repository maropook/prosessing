class En 
{
  float x, y, xx, yy, cc;

  En(float a, float b, float aa, float bb, float c)
  {
    x = a;
    y = b;
    xx = aa;
    yy = bb;
    cc = c;
  }

  void en()
  {
    x += xx;
    y += yy;
    col(cc);
    ellipse(x, y, 5, 5);
    if ((mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y) < 16)
    {
      //time = 0;
      //zn.clear();
    }
  }
  void en_c(int i) {
    if (x < -5 || x > 805 || y < -5 || y > 805)
    {
      zn.remove(i);
    }
  }
}

void s1(float x, float y, int time, int t, float k, float z, float cc, float d)//x座標、y座標、基準時間、間隔、本数、回転速度、色、速さ
{
  if (t == 1)
  {
    for (int i = 0; i < k; i++)
    {
      float xc = cos(radians(time * z + i * (360 / k))) * d;
      float yd = sin(radians(time * z + i * (360 / k))) * d;
      zn.add(new En(x, y, xc, yd, cc));
    }
  }
}

void s2(float x, float y, int time, int t, float k, float z, float cc, float d1, float d2, float e, float xy, float yx)//x座標、y座標、基準時間、間隔、本数、回転速度、色、速さ、広がる速さ、半径
{
  if (t == 1)
  {
    for (int i = 0; i < k; i++)
    {
      float xa = x + cos(radians(time * z + i * (360 / k))) * e;
      float yb = y + sin(radians(time * z + i * (360 / k))) * e;
      float xc = ((xy - x) / sqrt(sq(xy - x) + sq(yx - y))) * d1 + cos(radians(time * z + i * (360 / k))) * d2;
      float yd = ((yx - y) / sqrt(sq(xy - x) + sq(yx - y))) * d1 + sin(radians(time * z + i * (360 / k))) * d2;
      zn.add(new En(xa, yb, xc, yd, cc));
    }
  }
}

void s3(float x, float y, int time, int t, float k, float z, float cc, float d2, float e)//x座標、y座標、基準時間、間隔、本数、回転速度、色、広がる速さ、半径
{
  if (t == 1)
  {
    for (int i = 0; i < k; i++)
    {
      float xa = x + cos(radians(time * z + i * (360 / k))) * e;
      float yb = y + sin(radians(time * z + i * (360 / k))) * e;
      float xc =  cos(radians(time * z + i * (360 / k))) * d2;
      float yd =  sin(radians(time * z + i * (360 / k))) * d2;
      zn.add(new En(xa, yb, xc, yd, cc));
    }
  }
}
