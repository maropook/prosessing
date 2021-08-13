class Move
{
  int x;
  int y;
  int bx;
  int by;
  int what = 00;
  int m_num;
  int hp;
  int at;
  String name;
  String state;
  int s = 0;

  Move(int a, int b, int c, String d, int e, int f, int g)
  {
    x = a;
    y = b;
    m_num = c;
    name = d;
    hp = e;
    at = f;
    s = 1;
  }

  void drawing()
  {
    if (s == 1)
    {
      for (int i = (what / 10) * 16; i < 16 + (what / 10) * 16; i++)
      {
        for (int j = (what % 10) * 16; j < 16 + (what % 10) * 16; j++)
        {
          noStroke();
          chara_t[m_num][i][j].tile(i - (what / 10) * 16, j - (what % 10) * 16, 1, x * 16 + 16, y * 16 + 16);
        }
      }
      fill(255);
    }
  }

  void moved(int a)
  {
    bx = x;
    by = y;

    if (a == 00)
    {
      if (what == 00)
      {
        y++;
      } else {
        what = 00;
      }
    } else if (a == 11)
    {
      if (what == 11)
      {
        y--;
      } else {
        what = 11;
      }
    } else if (a == 01)
    {
      if (what == 01)
      {
        x++;
      } else {
        what = 01;
      }
    } else if (a == 10)
    {
      if (what == 10)
      {
        x--;
      } else {
        what = 10;
      }
    }
    if (x < 0 || x > 15 || y < 0 || y > 15 || int(p_c[x][y].t) == 0)
    {
      x = bx;
      y = by;
    }
  }
}
