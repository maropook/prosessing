void pic(int a, int w, int h, int i, int j)
{
  switch(a)
  {
  case 10:
    fill(255);
    break;

  case 11:
    fill(255, 125, 125);
    break;

  case 12:
    fill(255, 185, 125);
    break;

  case 13:
    fill(255, 255, 125);
    break;

  case 14:
    fill(125, 255, 125);
    break;

  case 15:
    fill(125, 255, 255);
    break;

  case 16:
    fill(185, 125, 255);
    break;

  case 20:
    fill(0);
    break;

  case 21:
    fill(125, 65, 65);
    break;

  case 22:
    fill(255, 95, 65);
    break;

  case 23:
    fill(125, 125, 65);
    break;

  case 24:
    fill(65, 125, 65);
    break;

  case 25:
    fill(125, 125, 255);
    break;

  case 26:
    fill(0, 0, 255);
    break;

  case 99:
    fill(255, 60);
    stroke(255);
    line(int(wind.sx() / 40) + i * int(wind.sx() / 100), int(wind.sx() / 40) + j * int(wind.sx() / 100), int(wind.sx() / 40) + i * int(wind.sx() / 100) + int(wind.sx() / 100) * w, int(wind.sx() / 40) + j * int(wind.sx() / 100) + int(wind.sx() / 100) * h);
    line(int(wind.sx() / 40) + i * int(wind.sx() / 100), int(wind.sx() / 40) + j * int(wind.sx() / 100) + int(wind.sx() / 100) * h, int(wind.sx() / 40) + i * int(wind.sx() / 100) + int(wind.sx() / 100) * w, int(wind.sx() / 40) + j * int(wind.sx() / 100));
    break;
  }
  stroke(255);
  rect(int(wind.sx() / 40) + i * int(wind.sx() / 100), int(wind.sx() / 40) + j * int(wind.sx() / 100), int(wind.sx() / 100) * w, int(wind.sx() / 100) * h);
}
