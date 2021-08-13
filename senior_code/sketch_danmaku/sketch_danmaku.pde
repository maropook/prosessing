float bx = 200;
float by = 200;
float bxx = 2;
float byy = 1;

ArrayList zn = new ArrayList();

int time = 0;

float x = 400;
float y = 400;
float xx = 10;
float yy = 0;

void setup()
{
  size(800, 800);
  background(0);
  noCursor();
  stroke(255);
}

void draw()
{
  if (time != 0)
  {
    time++;
    background(40);
    if (bx < 200 || bx > 600)
    {
      byy = bxx;
      bx -= bxx * 2;
      bxx = 0;
    }
    if (by < 200 || by > 600)
    {
      bxx = -byy;
      by -= byy * 2;
      byy = 0;
    }
    bx += bxx;
    by += byy;
    
    s1(bx, by, 270, time % 20, 4, 1, 6, 2);
    s2(100, 100, time, ((time / 18) % 8) % 5, 4, 12, 0, 8, -3, 50, bx, by);
    s2(bx, by, time, (time / 18) % 5, 4, 12, 3, 8, -3, 50, mouseX, mouseY);
    s3(bx, by, time, (time / 50) % 2, 6, 4, 6, -3, 100);
    s2(700, 700, time, ((time / 18) % 8 - 4) % 5, 4, 12, 1, 8, -3, 50, bx, by);
    s2(700, 100, time, ((time / 18) % 8 - 6) % 5, 4, 12, 2, 8, -3, 50, bx, by);
    s2(100, 100, time, (time / 6) % 48 - 6, 1, 12, 5, 5, -1, 50, mouseX, mouseY);
    s2(700, 100, time, (time / 6) % 48 - 18, 1, 12, 5, 5, -1, 50, mouseX, mouseY);
    s2(700, 700, time, (time / 6) % 48 - 30, 1, 12, 5, 5, -1, 50, mouseX, mouseY);
    s2(100, 700, time, (time / 6) % 48 - 42, 1, 12, 5, 5, -1, 50, mouseX, mouseY);
    ziki(mouseX, mouseY);
    for (int i = 0; i < zn.size(); i++)
    {
      En e = (En)zn.get(i);
      e.en();
    }
    for (int i = 0; i < zn.size(); i++)
    {
      En e = (En)zn.get(i);
      e.en_c(i);
    }
    boss(bx, by);
  } else
  {
    background(0);
  }
  fill(255);
  rect(700,70,80,30);
  fill(0);
  textSize(30);
  text(frameRate, 100, 100);
  text(time / 60, 700, 100);
}

void mousePressed()
{
  if (time == 0)
  {
    time = 1;
  } else 
  {
    time = 0;
    zn.clear();
    background(0);
  }
}
