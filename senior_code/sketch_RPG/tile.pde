class Tile
{
  String t;
  int size;

  Tile(String a, int s)
  {
    t = a;
    size = s;
  }

  void tile(int i, int j, float a, int x, int y)
  {
    switch(t)
    {
    case "0"://奈落
      noFill();
      break;

    case "1"://床
      size *= 6;
      stroke(0);
      fill(125);
      for (int k = 0; k < 6; k++)
      {
        for (int l = 0; l < 3; l++)
        {
          n_tile(i * 6 + l * 2, j * 6 + k, 2, a / 1, x * 6, y * 6);
        }
      }
      for (int k = 0; k < 3; k++)
      {
        for (int l = 0; l < 2; l++)
        {
          n_tile(i * 6 + l * 2 + 1, j * 6 + k * 2, 2, a / 1, x * 6, y * 6);
        }
      }
      size /= 6;
      fill(0, 255, 0, 0);
      break;

    case "2"://森林
      fill(0, 125, 0);
      break;

    case "3"://雪原
      fill(255);
      break;

    case "4"://砂漠
      fill(200, 200, 0);
      break;

    case "5"://霧
      fill(200);
      break;
    case "10":
      fill(255);
      break;

    case "11":
      fill(255, 125, 125);
      break;

    case "12":
      fill(255, 185, 125);
      break;

    case "13":
      fill(255, 255, 125);
      break;

    case "14":
      fill(125, 255, 125);
      break;

    case "15":
      fill(125, 255, 255);
      break;

    case "16":
      fill(185, 125, 255);
      break;

    case "20":
      fill(0);
      break;

    case "21":
      fill(125, 65, 65);
      break;

    case "22":
      fill(255, 95, 65);
      break;

    case "23":
      fill(125, 125, 65);
      break;

    case "24":
      fill(65, 125, 65);
      break;

    case "25":
      fill(125, 125, 255);
      break;

    case "26":
      fill(0, 0, 255);
      break;


    case "99":
      noFill();
      break;
    }
    n_tile(i, j, a, a, x, y);
  }

  void n_tile(float i, float j, float a, float b, float x, float y)
  {
    rect(wind.sy() / size * i + wind.sy() / size * x, wind.sy() / size * j + wind.sy() / size * y, wind.sy() / size * a, wind.sy() / size * b);
  }

  void change(String a)
  {
    t = a;
  }

  String col()
  {
    return(t);
  }
}
