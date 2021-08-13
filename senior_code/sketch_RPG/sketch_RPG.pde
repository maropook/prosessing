Window wind;
Tile[][] p_c = new Tile[16][16];
Tile[][][] chara_t = new Tile[10][32][32];
Move[] chara_m = new Move[10];

Make make;
Text[] states;

String[] ca;
String[] field;
String[] role;

int[][] what_tile = new int[16][16];

int mode = 0;

int aa = 0;
int bb = 0;
int cc = 0;
int ax;
int ay;
int alt = 0;

void setup()
{
  size(displayWidth, displayHeight);
  textFont(createFont("Ms Gothic", 24));//文字指定 
  wind = new Window(displayWidth, displayHeight);
  ca = loadStrings("キングスライム.txt");
  field = loadStrings("field.txt");
  make = new Make("states_name.txt", "chara_file.txt", 32);
  role = loadStrings("chara_role.txt");
  for (int i = 0; i < 16; i++)
  {
    for (int j = 0; j < 16; j++)
    {
      p_c[i][j] = new Tile(field[j].substring(i, i + 1), 20);
      what_tile[i][j] = int(field[j].substring(i, i + 1));
    }
  }
  for (int l = 0; l < 10; l++)
  {
    for (int i = 0; i < 32; i++)
    {
      for (int j = 0; j < 32; j++)
      {
        chara_t[l][i][j] = new Tile(ca[j].substring(i * 2, i * 2 + 2), 320);
      }
    }
  }
  for (int i = 0; i < 10; i++) {
    chara_m[i] = new Move(i, i, 0, "スライム", int(ca[36]), int(ca[38]), 0);
  }
}

void draw()
{
  wind.screen();
  if (mode == 0 || mode == 2) {
    for (int i = 0; i < 16; i++)
    {
      for (int j = 0; j < 16; j++)
      {
        stroke(0);
        p_c[i][j].tile(i, j, 1, 1, 1);
      }
    }

    chara_m[0].drawing();
  } else if (mode == 1)
  {
    make.drawing();
  }
  //text(int(mouseX / (wind.sy() / 20)) - 1, 1500, 1500);
  if (mode == 3)
  {
    menu(wind.sx() / 4, wind.sy / 20, wind.sx() / 2, wind.sy / 2, "対象", role, aa, 0);
  } else if (mode == 4)
  {
    menu(wind.sx() / 4, wind.sy / 20, wind.sx() / 2, wind.sy / 2, "キャラクター", make.file_data, aa, 0);
  }
  textAlign(RIGHT);
  textSize(wind.sx / 60);
  if (mode == 0)
  {
    text("実行モード", wind.sx, wind.sx / 40);
  } else if (mode == 1)
  {
    text("キャラクター編集モード", wind.sx, wind.sx / 40);
  } else if (mode == 2)
  {
    text("マップ編集モード", wind.sx, wind.sx / 40);
  }
  textAlign(LEFT);
}

void keyPressed()
{
  if (key == ENTER)
  {
    if (mode == 0 || mode == 1)
    {
      mode++;
    } else if (mode ==2)
    {
      mode = 0;
    }
  } else {
    if (mode == 0)
    {
      switch(keyCode)
      {
      case UP:
        chara_m[0].moved(11);
        break;

      case DOWN:
        chara_m[0].moved(00);
        break;

      case LEFT:
        chara_m[0].moved(10);
        break;

      case RIGHT:
        chara_m[0].moved(01);
        break;
      }
    } else if (mode == 1)
    {
      make.keypress();
    } else if (mode == 3)
    {
      aa = menu_change(aa, role.length - 1);
    } else if (mode == 4)
    {
      aa = menu_change(aa, make.file_data.length - 1);
    }
  }
}

void mousePressed()
{
  if (mode == 2)
  {
    ax = int(mouseX / (wind.sx() / 20) - 1);
    ay = int(mouseY / (wind.sx() / 20) - 1);
    aa = 0;
    mode = 3;
  } else if (mode == 1)
  {
    make.mousepress();
  } else if (mode == 3)
  {
    if (bb == 1)
    {
      alt = aa;
      mode = 4;
      aa = 1;
    }
  } else if (mode == 4)
  {
    if (bb == 1)
    {
      ca = null;
      chara_m[alt] = null;
      ca = loadStrings(make.file_data[aa] + ".txt");
      chara_m[alt] = new Move(ax, ay, alt, make.file_data[aa], int(ca[36]), int(ca[38]), 0);
      for (int l = 0; l < 10; l++)
      {
        for (int i = 0; i < 32; i++)
        {
          for (int j = 0; j < 32; j++)
          {
            chara_t[l][i][j] = null;
            chara_t[l][i][j] = new Tile(ca[j].substring(i * 2, i * 2 + 2), 320);
          }
        }
      }
      mode = 2;
    }
  }
}
