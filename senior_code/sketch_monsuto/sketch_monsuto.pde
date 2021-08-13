ArrayList teki = new ArrayList();

float px = 200, py = 500, vx = 0, vy = 0, mx1, my1, mx2, my2, s = 50;
int a = 0;

PImage s1, s2;

void setup()
{
  size(400, 600);
  fill(255);
  stroke(255, 255, 0);
  s1 = loadImage("スラちゃんB.png");
  s2 = loadImage("スラちゃんR.png");
  s1.resize(50, 50);
  s2.resize(50, 50);
  imageMode(CENTER);
  teki.add(new Teki(random(25, 375), random(25, 575), 255, 0, 0, 100, 2, 1));
}

void draw()
{
  background(0);
  if (a == 2)
  {
    vx *= 0.99;
    vy *= 0.99;
    if (sqrt(sq(vx)) < 1 && sqrt(sq(vy)) < 1)
    {
      vx = 0;
      vy = 0;
      a = 0;
    }
  }
  px += vx;
  py += vy;
  if (px < 25)
  {
    px = 25;
    vx = -vx;
  } else if (px > 375)
  {
    px = 375;
    vx = -vx;
  }
  if (py < 25)
  {
    py = 25;
    vy = -vy;
  } else if (py > 575)
  {
    py = 575;
    vy = -vy;
  }
  for (int i = 0; i < teki.size(); i++)
  {
    Teki t = (Teki)teki.get(i);
    t.cl(i);
  }
    
  for (int i = 0; i < teki.size(); i++)
  {
    Teki t = (Teki)teki.get(i);
    t.update();
    t.display();
  }
  image(s1, px, py);
  //fill(0);
  //ellipse(x, y, 50, 50);
  if (a == 1)
  {
    line(mx1, my1, mouseX, mouseY);
  }
  fill(255);
  text(px,100,100);
  text(py,100,200);
}

void mousePressed()
{
  if (a == 0)
  {
    a = 1;
    mx1 = mouseX;
    my1 = mouseY;
  }
}

void mouseReleased()
{
  if (a == 1)
  {
    mx2 = mouseX;
    my2 = mouseY;
    a = 2;
    if(mx1 != mx2 && my1 != my2)
    {
    vx = ((mx1 - mx2) / sqrt(sq(mx1 - mx2) +  sq(my1 - my2))) * s;
    vy = ((my1 - my2) / sqrt(sq(mx1 - mx2) +  sq(my1 - my2))) * s;
    }
  }
}

void keyPressed()
{
  teki.add(new Teki(random(25, 375), random(25, 575), 255, 0, 0, 100, 1, 1));
}

class Teki
{
  float tx, ty, cr, cg, cb, c, hp;
  int s;

  Teki(float t_x, float t_y, float c_r, float c_g, float c_b, float tc, float thp, int ts)
  {
    tx = t_x;
    ty = t_y;
    cr = c_r;
    cg = c_g;
    cb = c_b;
    c = tc;
    hp = thp;
    s = ts;
  }

  void cl(int i)
  {
    if (hp <= 0)
    {
      teki.remove(i);
    }
  }

  void update()
  {
    if (sqrt(sq(px - tx) +  sq(py - ty)) < 50)
    {
      hp -= 1;
      vx = -vx;
      vy = -vy;
    }
  }

  void display()
  {
    //stroke(255);
    //fill(cr, cg, cb, c);
    //ellipse(tx, ty, 50, 50);
    image(s2, tx, ty);
  }
}
