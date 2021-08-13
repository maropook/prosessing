class Make
{
  String[] states_name;
  int[][] picture = new int[32][32];
  String[] st;
  String[] text;
  String[] file_data;
  String fd;

  int col = 10;
  int num = 0;
  int mode = 0;
  int m_num = 0;
  int syurui = 0;
  int ax = 0;
  int load = 0;
  int menu = 0;

  Make(String a, String c, int b)
  {
    textAlign(LEFT, CENTER);
    fd = c;
    m_num = b;
    states_name = loadStrings(a);
    states = new Text[states_name.length / 2];
    text = new String[32 + (states_name.length * 2)];
    file_data = loadStrings(fd);
    textSize((wind.sx() / 60));
    for (int i = 0; i < b; i++)
    {
      for (int j = 0; j < b; j++)
      {
        picture[i][j] = 99;
      }
    }
    for (int i = 0; i < states.length; i++)
    {
      states[i] = new Text(int(states_name[i * 2 + 1]), "");
    }
    for (int i = 0; i < text.length; i++)
    {
      text[i] = "";
    }
    ax = 1;
  }

  void drawing()
  {
    if (ax == 1)
    {
      color_c();
      stroke(255);
      for (int i = 0; i < 16; i++)
      {
        for (int j = 0; j < 16; j++)
        {
          pic(picture[i][j], 1, 1, i + 2, j + 12);
          pic(picture[i + 16][j], 1, 1, i + 23, j + 12);
          pic(picture[i][j + 16], 1, 1, i + 2, j + 33);
          pic(picture[i + 16][j + 16], 1, 1, i + 23, j + 33);
        }
      } 
      for (int i = 0; i < 7; i++)
      {
        for (int j = 1; j < 3; j++)
        {
          pic(i + j * 10, 2, 2, i * 2, (j - 1) * 2);
          stroke(255);
        }
      }
      pic(99, 4, 4, 14, 0);
      if (col != 99)
      {
        pic(col, 3, 3, (col % 10) * 2, (col / 10) - 1);
      }
      states();
      fill(255);
    }
    if (load == 1)
    {
      menu(wind.sx() / 2 - wind.sx() / 10, wind.sy() / 10, wind.sx() / 5, wind.sy() / 2, "キャラクター", file_data, aa, 0);
    }
  }

  void mousepress()
  {
    if (load == 0)
    {
      if (ax == 1)
      {
        int i = (mouseX - int(wind.sx() / 40)) / int(wind.sx() / 100);
        int j = (mouseY - int(wind.sx() / 40)) / int(wind.sx() / 100);

        if (mouseX < (wind.sx() / 40) * 14 + (wind.sx() / 40) * 3 && mouseX > (wind.sx() / 40) * 14 && mouseY < (wind.sy() / 40) * 1 + (wind.sy() / 40) * 5 && mouseY > (wind.sy() / 40) * 1)
        {
          save_file();
        } else 
        if (mouseX < (wind.sx() / 40) * 10 + (wind.sx() / 40) * 3 && mouseX > (wind.sx() / 40) * 10 && mouseY < (wind.sy() / 40) * 1 + (wind.sy() / 40) * 5 && mouseY > (wind.sy() / 40) * 1)
        {
          load = 1;
        } else if (i < 14 && i > -1 && j < 4 && j > -1)
        {
          col = (i / 2) + ((j / 2) + 1) * 10;
        } else if (i < 18 && i > 13 && j < 4 && j > -1)
        {
          col = 99;
        } else if (mouseX > (wind.sx() / 40) * 19 && mouseX < (wind.sx() / 40) * 39)
        {
          if (mouseY < (wind.sx() / 40) * 2)
          {
            if (states[num].txt_mode != 0)
            {
              mode++;
              if (mode == 3)
              {
                mode = 0;
              }
            }
            states[num].change(mode);
          } else {
            int bnum = num;
            num = (int((mouseX - (wind.sx() / 40) * 19) / (wind.sx() / 40)) / 10) % 2 + (int(mouseY / (wind.sy() / 40) - 3) / 4) * 2;
            if (num < states.length)
            {
              if (states[num].txt_mode == 0)
              {
                states[num].change(4);
              }
            } else {
              num = bnum;
            }
          }
        }
      }
    } else if (load == 1)
    {
      loading();
    }
  }

  void keypress()
  {
    if (load == 0)
    {
      if (ax == 1)
      {
        if (num >= 0 && num < states_name.length)
        {
          if (key == BACKSPACE)
          {
            states[num].delete();
          } else if (keyCode != SHIFT)
          {
            char ky= key;
            states[num].press(str(ky));
          }
        }
      }
    } else if (load == 1)
    {
      aa = menu_change(aa, file_data.length - 1);
    }
  }

  void color_c()
  {
    int i = (mouseX - int(wind.sx() / 40)) / int(wind.sx() / 100);
    int j = (mouseY - int(wind.sx() / 40)) / int(wind.sx() / 100);
    if (mousePressed == true)
    {
      if (i <= 17 && i >= 2 && j <= 27 && j >= 12)
      {
        picture[i - 2][j - 12] = col;
      } else if (i <= 38 && i >= 23 && j <= 27 && j >= 12)
      {
        picture[i - 7][j - 12] = col;
      } else if (i <= 17 && i >= 2 && j <= 48 && j >= 33)
      {
        picture[i - 2][j - 17] = col;
      } else if (i <= 38 && i >= 23 && j <= 48 && j >= 33)
      {
        picture[i - 7][j - 17] = col;
      }
    }
  }

  void states() {
    textSize((wind.sx() / 100) * 2);
    stroke(255);
    for (int i = 0; i < states_name.length / 2; i++)
    {
      fill(0);
      if (i == num)
      {
        fill(0, 125, 0);
      }
      rect((wind.sx() / 40) * ((i % 2) * 10 + 19), (wind.sy() / 40) * ((i / 2) * 4 + 3), (wind.sx() / 40) * 10 - 2, (wind.sy() / 40) * 4 - 2);
    }
    stroke(0);
    fill(255);
    text(states[num].mode(), (wind.sx() / 40) * (19.5), (wind.sy() / 40) * (2));
    for (int i = 0; i < states_name.length / 2; i++)
    {
      text(states_name[i * 2] + " : " + states[i].update() + "_", (wind.sx() / 40) * ((i % 2) * 10 + 19.5), (wind.sy() / 40) * ((i / 2) * 4 + 6));
    }
    if (mouseX < (wind.sx() / 40) * 14 + (wind.sx() / 40) * 3 && mouseX > (wind.sx() / 40) * 14 && mouseY < (wind.sy() / 40) * 1 + (wind.sy() / 40) * 5 && mouseY > (wind.sy() / 40) * 1)
    {
      fill(0, 255, 0);
    }
    rect((wind.sx() / 40) * 14, (wind.sy() / 40) * 1, (wind.sx() / 40) * 3, (wind.sy() / 40) * 5);
    if (mouseX < (wind.sx() / 40) * 10 + (wind.sx() / 40) * 3 && mouseX > (wind.sx() / 40) * 10 && mouseY < (wind.sy() / 40) * 1 + (wind.sy() / 40) * 5 && mouseY > (wind.sy() / 40) * 1)
    {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    rect((wind.sx() / 40) * 10, (wind.sy() / 40) * 1, (wind.sx() / 40) * 3, (wind.sy() / 40) * 5);
    fill(0);
    text("SAVE", (wind.sx() / 40) * 14.5, (wind.sy() / 40) * 4);
    text("LOAD", (wind.sx() / 40) * 10.5, (wind.sy() / 40) * 4);
    fill(255);
    textSize((wind.sx() / 100) * 4);
    text("↓", (wind.sx() / 40) * 4.3, (wind.sy() / 40) * 8);
    text("←", (wind.sx() / 40) * 12.3, (wind.sy() / 40) * 8);
    text("→", (wind.sx() / 40) * 4.3, (wind.sy() / 40) * 23);
    text("↑", (wind.sx() / 40) * 12.3, (wind.sy() / 40) * 23);
  }

  void save_file()
  {
    if (states[0].txt != "")
    {
      file_data = null;
      file_data = loadStrings(fd);
      String a = states[0].update() + ".txt";
      String[] b;
      int fdx = 0;

      for (int i = 0; i < file_data.length; i++)
      {
        if (file_data[i] == states[0].txt)
        {
          fdx = 1;
        }
      }
      if (fdx == 1)
      {
        b = new String[file_data.length];
        for (int i = 0; i < file_data.length; i++)
        {
          b[i] = file_data[i];
        }
      } else {
        b = new String[file_data.length + 1];
        for (int i = 0; i < file_data.length; i++)
        {
          b[i] = file_data[i];
        }
        b[file_data.length] = states[0].update();
      }


      for (int i = 0; i < m_num; i++)
      {
        text[i] = "";
      }
      for (int i = 0; i < m_num; i++)
      {
        for (int j = 0; j < m_num; j++)
        {
          text[j] +=  picture[i][j];
        }
      }
      for (int i = 0; i < states.length; i++)
      {
        text[i * 2 + 32] = states_name[i * 2];
        text[i * 2 + 33] = states[i].update();
      }
      saveStrings(a, text);
      saveStrings(fd, b);
    }
  }

  void new_file(String a, int b)
  {
    delete();
    m_num = b;
    states_name = loadStrings(a);
    states = new Text[states_name.length / 2];
    text = new String[32 + (states_name.length * 2)];
    textSize((wind.sx() / 60));
    for (int i = 0; i < b; i++)
    {
      for (int j = 0; j < b; j++)
      {
        picture[i][j] = 99;
      }
    }
    for (int i = 0; i < states.length; i++)
    {
      states[i] = new Text(int(states_name[i * 2 + 1]), "");
    }
    for (int i = 0; i < text.length; i++)
    {
      text[i] = "";
    }
    ax = 1;
  }

  void load_file(String a, int b, String c)
  {
    m_num = b;
    String[] ca = loadStrings(c);
    states_name = loadStrings(a);
    states = new Text[states_name.length / 2];
    text = new String[32 + (states_name.length * 2)];
    textSize((wind.sx() / 60));
    for (int i = 0; i < b; i++)
    {
      for (int j = 0; j < b; j++)
      {
        picture[i][j] = int(ca[j].substring(i * 2, i * 2 + 2));
      }
    }
    for (int i = 0; i < states.length; i++)
    {
      states[i] = new Text(int(states_name[i * 2 + 1]), ca[i * 2 + 33]);
    }
    for (int i = 0; i < text.length; i++)
    {
      text[i] = "";
    }
    //states[0].txt = str(ca[1].length());
    ax = 1;
  }

  void delete()
  {
    states_name = null;
    for (int i = 0; i < m_num; i++)
    {
      for (int j = 0; j < m_num; j++)
      {
        picture[i][j] = 99;
      }
    }
    st = null;
    text = null;

    col = 99;
    num = 0;
    mode = 0;
    m_num = 0;
    syurui = 0;
    ax = 0;
  }

  void loading()
  {
    if (mousePressed == true)
    {
      if (aa == 0)
      {
        load = 0;
        new_file("states_name.txt", 32);
      } else {
        load = 0;
        load_file("states_name.txt", 32, file_data[aa] + ".txt");
      }
    }
  }
}
