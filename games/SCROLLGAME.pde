void TITLE() {
  if (TITLE) {
    IniEnum();
    boss = new Boss(1200, 720);
    score = 0;
    up = false;
    down = false;
    left = false;
    right = false;
    zdash = false;
    space = false; 
    changemap = false; 
    loadmap = false; 
    fade = false; 
    gameclear = false; 
    GAMEOVER = false; 
    TITLE = true; 
    SE = false; 
    mouse = false; 
    tip = false; 
    Switch = false; 
    weapon = false; 
    Boss = false; 
    Bossclear = false;
    tutorial = true;
    activ = true;
    fadeout = false;
    needloadmap = false; 
    main = false;
    map.loadmap();
    p = new Player(0, 0, HP);
    p.zannki = 3;
    playing = bgm[0].isPlaying();
    if (playing == false) {
      bgm[0].rewind();
      bgm[0].play();
    }
    titleUI();
  } else if (fade == false||tip == false) {
    if (SE == false) {
      AUI[1].rewind();
      AUI[1].play();
      SE = true;
    }
    fill(0, NUMBER);
    rect(0, 0, width, height);
    NUMBER++;
    if (NUMBER >= 80) {
      fade = true;
      if (mousePressed||keyPressed) {
        tip = true;
        NUMBER = 0;
      }
      image(TIP, 0, 0, width, height);
    }
  }
}

void Loadmap() {
  if (needloadmap) {
    map.setmap();
    SE = false;
    GMOV.pause();
    GMOV.rewind();
    p.x = px;
    p.y = py;
    //p = new Player(px, py,HP);
    loadmap = true;
    changemap = false;
  }
}

void Main() {
  framecount++;
  if (main) {
    playing = bgm[1].isPlaying();
    if (playing == false&&Boss == false&&Bossclear == false) {
      bgm[1].rewind();
      bgm[1].play();
    }
    if (Boss) {
      bgm[1].pause();
      bgm[1].rewind();
    }
    background(100);
    if (Boss) {
      boss.drawing();
      for (int i = 0; i<BB.size(); i++) {
        BB.get(i).drawing();
        if (BB.get(i).Break()) {
          BB.remove(i);
        }
      }
      for (int i = 0; i<Missile.size(); i++) {
        Missile.get(i).drawing();
        if (Missile.get(i).Break()) {
          bomb.add(new Bomb(Missile.get(i).x, Missile.get(i).y));
          se[9].rewind();
          se[9].play();
          Missile.remove(i);
        }
      }
      for (int i = 0; i<bomb.size(); i++) {
        bomb.get(i).bomb();
        if (bomb.get(i).remove) {
          bomb.remove(i);
        }
      }
      if (boss.hp>0) {
        bossHP();
      }
    }
    map.drawmap();
    for (int i = 0; i<enemy0.size(); i++) {
      enemy00 = enemy0.get(i);
      enemy00.drawing();
    }
    for (int i = 0; i<enemy1.size(); i++) {
      enemy01 = enemy1.get(i);
      enemy01.drawing();
    }
    for (int i = 0; i<coin.size(); i++) {
      coin.get(i).update();
      coin.get(i).drawing();
      if (coin.get(i).needbreak()) {
        score += 10;
        coin.remove(i);
      }
    }
    for (int i = 0; i<cap.size(); i++) {
      cap.get(i).Update();
      cap.get(i).drawing();
      if (cap.get(i).Break()) {

        cap.remove(i);
      }
    }
    for (int i = 0; i<gr.size(); i++) {
      gr.get(i).update();
      gr.get(i).drawing();
      if (gr.get(i).needbreak) {
        gr.remove(i);
      }
    }
    p.drawing();
    HPgauge();
    score();
    zannki();
    if (changemap == true) {
      se[3].pause();
      se[3].rewind();
      if (fill >= 255) {
        IniEnum();
        changepoint = changepointnum[NUMBER][DN];
        NUMBER = changemapnum[NUMBER][DN];
        loadmap = false;
        fill(0, fill);
        rect(-1, -1, width, height);
        fill+=8;
        fill = 0;
      }
      fill+=8;
      left = false;
      right = false;
      p.addX = 0;
    }
    fill(0, fill);
    rect(-1, -1, width, height);
    if (NUMBER == 4&&Boss == false&&Bossclear == false) {
      Boss = true;
      framecount = 0;
    }
  }
}

void Booleans() {
  if (TITLE == false&&fade == true&&tip == true&&loadmap == false) {
    needloadmap = true;
  } else {
    needloadmap = false;
  }
  if (GAMEOVER == false && loadmap == true && gameclear == false&&needloadmap == false) {
    main = true;
  } else {
    main = false;
  }
}



void GAMEOVER() {
  if (GAMEOVER) {
    //boss = false;
    bgm[2].pause();
    bgm[1].pause();
    bgm[1].rewind();
    IniEnum();
    if (gameclear == false) {
      if (SE == false) {
        GMOV.play();
        SE = true;
      }
      for (int i = 0; i<BB.size(); i++) {
        BB.remove(i);
      }
      for (int i = 0; i<Missile.size(); i++) {
          Missile.remove(i);
        }
      }
      if (NUMBER == 6) {
        NUMBER = 5;
        Boss = false;
        boss.y += 600;
      }

      textSize(40);
      counter ++;
      image(gameover, 0, 0, width, height);
      if (counter >= 60) {
        fill(220, 180, 0);
        text("タイトルに戻る", width/2-150, height/2+320);
        if (keyPressed) {
          if (key == ' ') {
            HP = 100;
            score = 0;
            loadmap = false;
            GAMEOVER = false;
            counter = 0;
            TITLE = true;
            fade = false;
            tip = false;
            SE = false;
          }
        } else if (mousePressed) {
          HP = 100;
          score = 0;
          loadmap = false;
          GAMEOVER = false;
          counter = 0;
          TITLE = true;
          fade = false;
          tip = false;
          SE = false;
        }
      }
    }
  }

boolean coins(float _x, float _y) {
  if (coins) {
    if (framecount<80) {
      coin.add(new Object(_x, _y));
    } else {
      coins = false;
      return true;
    }
  }
  return false;
}
void fade() {
  framecount++;
  fill(0, framecount-fadecount);
  rect(-1, -1, width+1, height+1);
  if (framecount-fadecount>255&&Bossclear == false) {
    fadeout = false;
    framecount = 0;
    NUMBER++;
    IniEnum();
    Switch = false;
    map.IO2 = false;
    loadmap = false;
    activ = true;
  } else
    if (Bossclear) {
      gameclear = true;
      image(GAMECLEAR, 0, 0);
      if (keyPressed||mousePressed) {
        TITLE = true;
      }
    }
}

void IniEnum() {
  for (; enemy0.size()>0; ) {
    enemy0.remove(0);
  }
  for (; enemy1.size()>0; ) {
    enemy1.remove(0);
  }
  for (; coin.size()>0; ) {
    coin.remove(0);
  }
}














class Boss {
  int actioncounter = 0, actions, actiontime, hp, imgcount = 0;
  float x, y, part1 = 600, part2 = 600, ran = 0;
  boolean action = false;
  Boss(float _x, float _y) {
    hp = 500;
    x = _x;
    y = _y;
  }

  void update() {
    //bossdeath^^^^^^^^^^^^^^^^^^^^^^|
    if (hp<=1) {
      bgm[2].pause();
      if (hp==0) {
        hp-=10;
        actiontime = 150;
        actioncounter = 0;
      }
      if (actioncounter<120) {
        if (actioncounter%5==0) {
          se[9].rewind();
          se[9].play();
          bomb.add(new Bomb(x+width/2+random(20, 80), y+random(0, 360)));
        }
        ran = random(-2, 3);
        part1+=5;
        part2+=5;
        y+=5;
      } else
        if (actioncounter>=120) {
          p.X = width/2;
          Bossclear = true;
          Boss = false;
        }
    }
    //_______|
    else
      if (actioncounter == 0) {
        actions = int(random(0, 6));
        if (actions == 0) {
          action = true;
          actiontime = 120;
        }
        if (actions == 1||actions == 4) {
          for (int j = 0; j<2; j++) {
            for (int i = 0; i<3; i++) {
              BB.add(new BossBullet(190-j*20, i, 4, 0));
            }
          }
          action = true;
          actiontime = 60;
        }
        if (actions == 2) {
          action = true;
          actiontime = 150;
        }
        if (actions == 3||actions == 5) {
          for (int j = 0; j<3; j++) {
            for (int i = 0; i<2; i++) {
              BB.add(new BossBullet(200-j*20, i, 4, 80));
            }
          }
          action = true;
          actiontime = 60;
        }
      } else 
      if (actions == 2) {
        if (actioncounter<=30) {
          part1-=0.5;
          part2+=0.5;
        }
        if (actioncounter>120) {
          part1+=0.5;
          part2-=0.5;
        }
        if (actioncounter == 60||actioncounter==90||actioncounter==120) {
          for (int i = 0; i<3; i++) {
            Missile.add(new Bossmissile(180, i));
          }
        }
      }
    actioncounter++;
    if (actioncounter>actiontime) {
      actioncounter=0;
    }
  }

  void drawing() {
    if (framecount>60&&framecount<120) {
      Switch = true;
    }
    if (framecount>120&&framecount<180) {
      map.x+=10;
      p.X-=10;
    }
    if (framecount>180&&framecount<=240) {
      y-=10;
      part1-=10;
      part2 -= 10;
    }
    if (framecount > 300) {
      update();
    }

    image(bossimage[0], x+ran, y+ran, 80, 480);
    for (int i = 0; i<3; i++) {
      image(bossimage[1], 1200, i*120+201+part1+ran);
    }
    for (int i = 0; i<3; i++) {
      image(bossimage[2], 1200, i*120+221+part2+ran);
    }
  }
}









class Enemy0 extends Player {
  int number;
  float Y;
  boolean addx;
  Enemy0(float _x, float _y, int _number) {
    super(_x, _y, 0);
    number = _number;
    Height = 40;
  }

  float Floor() {
    return super.Floor();
  }
  float Ceiling() {

    return super.Ceiling();
  }
  float wall(int _i) {

    return super.wall(_i);
  }
  float updateX(int add) {
    if (addx == false) {
      addX = add;
      addx = true;
    }
    if (x+addX<wall(0)) {
      Right = true;
      Left = false;
      addX = abs(addX);
    }
    if (x+Width+addX>wall(1)) {
      Left = true;
      Right = false;
      addX = -abs(addX);
    }
    x += addX;

    return x;
  }
  float updateY() {

    if (Y!=0) {
      y += Y;
    } else {
      if (y+Height+addY < Floor()) {
        addY += a;
        y += addY;
      } else {
        addY = 0;
        y = Floor()-Height;
      }
    }
    Y = 0;
    return y;
  }
  void update() {
    x = updateX(2);
    y = updateY();
    if (map.imagecount%2==0) {
      number = 0;
      if (Right) {
        number = 2;
      }
    } else {
      number = 1;
      if (Right) {
        number = 3;
      }
    }
  }
  void drawing() {
    update();
    image(enemydata[number], x-p.x+width/2, y+5, 40, 40);
  }
}









class Enemy1 extends Enemy0 {
  float Y, random;
  Enemy1(float _x, float _y, int _number) {
    super(_x, _y, _number);
  }
  float updateX(int add) {
    if (addx == false) {
      addX = add;
      addx = true;
    }
    if (random<5) {
      Right = true;
      Left = false;
      addX = abs(addX);
    } else {
      Left = true;
      Right = false;
      addX = -abs(addX);
    }

    if (x+addX<wall(0)) {
      Right = true;
      Left = false;
      addX = abs(addX);
    }
    if (x+Width+addX>wall(1)) {
      Left = true;
      Right = false;
      addX = -abs(addX);
    }
    x += addX;

    return x;
  }
  float updateY() {
    if (y+Height+addY < Floor()) {
      x = updateX(5);
      frame = 0;
      if (a <= 0.6) {
        a += 0.1;
      }
      addY += a;
      y += addY;
    } else {
      frame++;
      addY = 0;
      if (frame%40 == 0) {
        random = random(0, 11);
        a = -1;
      } else {
        a = 0;
      }
      y = Floor()-Height;
      addY += a;
    }
    if (y+addY < super.Ceiling()) {
      y = super.Ceiling();
      addY = 0;
      a = 0;
    }
    y+=Y;

    Y = 0;
    return y;
  }
  void update() {

    y = updateY();
    if (p.y<180) {
      y += 180-p.y;
    }
    if (p.y>=height-175) {
      y += (height-180)-p.y;
    }
    if (Left) {
      number = 4;
      if (addY != 0) {
        number = 6;
      }
    } else if (Right) {
      number = 5;
      if (addY != 0) {
        number = 7;
      }
    } else {
      number = 4;
    }
  }
  void drawing() {
    update();
    image(enemydata[number], x-p.x+width/2, y, 40, 40);
  }
}








class Grain {
  float x, y, rad, addX, addY, size;
  int frame = 0, R, G, B;
  boolean needbreak = false;
  Grain(float _x, float _y, int _R, int _G, int _B, float _size) {
    x = _x;
    y = _y;
    rad = random(0, TWO_PI);
    addX = random(1, 5)*cos(rad);
    addY = random(1, 5)*sin(rad);
    R = _R;
    G = _G;
    B = _B;
    size = _size;
  }
  Grain(float _x, float _y) {
    this(_x, _y, 255, 255, 0, 1);
  }
  void update() {
    frame++;
    if (x<0||x>width||y<0||y>height||frame>13) {
      needbreak = true;
    }
    x+=addX;
    y+=addY;
  }
  void drawing() {
    stroke(0);
    fill(R, G, B);
    if (size<=1) {
      stroke(R, G, B);
    } else {
      stroke(0);
    }
    ellipse(x, y, size, size);
    noStroke();
  }
}

void broken(float _x, float _y, int _R, int _G, int _B, float _size) {
  float size = _size;
  int R = _R, G = _G, B = _B;
  for (int i = 0; i<10; i++) {
    gr.add(new Grain(_x, _y, R, G, B, size));
  }
}









class Map {
  int imagecount = 0, count = 0;
  float Y = 0, x;
  int H = 40, num;
  int[] loadmap;//lin行目の,で区切った整数
  String lines[];//全部、行区切りで
  String lin;//１行読む
  boolean sc = false, load, one = false, ikkai = false, IO2 = false, bosscamera = false;
  Map() {
  }

  void loadmap() {
    for (int k = 0; k<6; k++) {
      lines = loadStrings(mapname+k+".txt");
      for (int i = 0; i<54; i++) {
        lin = lines[i];
        loadmap = int(split(lin, ','));
        for (int j = 0; j<96; j++) {
          mapdata[k][i][j] = loadmap[j];
        }
      }
    }
  }
  void setmap() {
    int N = 0;
    Y = 0;
    for (int i = 0; i<54; i++) {
      for (int j = 0; j<96; j++) {
        if (mapdata[NUMBER][i][j] == -1) {
          enemy0.add(new Enemy0(j*40, i*40-Y, 1));
          mapdata[NUMBER][i][j] = 0;
        }
        if (mapdata[NUMBER][i][j] == -12&&weapon == true) {
          mapdata[NUMBER][i][j] = -2;
        } else if (mapdata[NUMBER][i][j] == -2) {
          mapdata[NUMBER][i][j] = 0;
          enemy1.add(new Enemy1(j*40, i*40-Y, 1));
        }
        if (mapdata[NUMBER][i][j] == 102&&IO2==false) {
          px = j*40;
          py = i*40;
          IO2 = true;
        }
        if ((mapdata[NUMBER][i][j] == 3||mapdata[NUMBER][i][j] == 4)&&IO2 == false) {
          lapnum[i][j] = N;
          if (N == changepoint) {
            if (mapdata[NUMBER][i][j] == 3) {
              p.Right = true;
              px = (j+2)*40;
              py = i*40;
            } else {
              p.Left = true;
              px = (j-2)*40;
              py = i*40;
            }
          }
          N++;
        }
      }
    }
    IO2 = false;
  }

  void drawmap() {
    count++;
    if (count%5==0) {
      imagecount++;
    }
    if (Boss == false||framecount<=2) {
      x = p.x;
      if (sc == true) {
        if (p.y<180) {
          for (int i = 0; i<enemy0.size(); i++) {
            enemy0.get(i).Y = 180-p.y;
          }
          for (int i = 0; i<enemy1.size(); i++) {
            enemy1.get(i).Y = 180-p.y;
          }
          Y -= 180-p.y;
          p.y += 180-p.y;
        }
        if (p.y>=height-175) {
          for (int i = 0; i<enemy0.size(); i++) {
            enemy0.get(i).Y = (height-180)-p.y;
          }
          for (int i = 0; i<enemy1.size(); i++) {
            enemy1.get(i).Y = (height-180)-p.y;
          }
          Y += p.y-(height-180);
          p.y += (height-180)-p.y;
        }
      }
    }

    for (int i = 0; i<54; i++) {
      for (int j = 0; j<96; j++) {
        for (int k = 1; k<10; k++) {
          if (mapdata[NUMBER][i][j] == k) {
            if (k==3||k==4) {
              H = 80;
            } else {
              H = 40;
            }
            image(block[k], (40*j-x)+width/2, (40*i-Y)/*40*i*/, 40, H);
            if (Boss == false&&k == 9) {
              mapdata[NUMBER][i][j] = 0;
            }
          }
        }
        if (mapdata[NUMBER][i][j] == -11&&weapon == true) {
          mapdata[NUMBER][i][j] = -1;
        } else 
        if (mapdata[NUMBER][i][j] == 100) {
          image(block[100], (40*j-x)+width/2, (40*i-Y), 40, 40);
        }
        if (mapdata[NUMBER][i][j] == 101) {
          image(block[101], (40*j-x)+width/2, (40*i-Y), 40, 80);
        }
        if (mapdata[NUMBER][i][j] == 109) {
          if (weapon == false) {
            image(block[109], (40*j-x)+width/2, (40*i-Y), 40, 40);
          }
        }
        if (mapdata[NUMBER][i][j] == 105||mapdata[NUMBER][i][j] == 106) {
          if (Switch == false) {
            mapdata[NUMBER][i][j] = 105;
            image(block[105], (40*j-x)+width/2, (40*i-Y), 40, 40);
          } else {
            mapdata[NUMBER][i][j] = 106;
          }
        }
        if (mapdata[NUMBER][i][j] == 106) {
          image(block[106], (40*j-x)+width/2, (40*i-Y), 40, 40);
        }
        if (mapdata[NUMBER][i][j] == 107||mapdata[NUMBER][i][j] == 108) {
          if (Switch == true) {
            mapdata[NUMBER][i][j] = 107;
            image(block[107], (40*j-x)+width/2, (40*i-Y), 40, 40);
          } else {
            mapdata[NUMBER][i][j] = 108;
          }
        }
        if (mapdata[NUMBER][i][j] == 108) {
          image(block[108], (40*j-x)+width/2, (40*i-Y), 40, 40);
        }
        if (mapdata[NUMBER][i][j] == 112) {
          image(block[112], (40*j-x)+width/2, (40*i-Y), 40, 40);
        }
        if (mapdata[NUMBER][i][j] == 156) {
          image(block[156], (40*j-x)+width/2, (40*i-Y), 40, 40);
        }
        if (mapdata[NUMBER][i][j] == 157) {
          image(block[157], (40*j-x)+width/2, (40*i-Y), 40, 40);
          coins(j*40, i*40-Y-40);
        }
        if (mapdata[NUMBER][i][j] == 158) {
          image(block[158], (40*j-x)+width/2, (40*i-Y), 80, 80);
        }
        if (mapdata[NUMBER][i][j] == 159) {
          image(block[159], (40*j-x)+width/2, (40*i-Y), 80, 80);
          coins(j*40, i*40-Y-40);
        }
        if (mapdata[NUMBER][i][j] == 150) {

          switch(imagecount%6) {
          case 0:
            num = 150;
            break;
          case 1:
            num = 151;
            break;
          case 2:
            num = 152;
            break;
          case 3:
            num = 153;
            break;
          case 4:
            num = 152;
            break;
          case 5:
            num = 151;
            break;
          }

          image(block[num], (40*j-x)+width/2, (40*i-Y), 40, 40);
        }
        if (mapdata[NUMBER][i][j] == 200) {
          image(block[200], (40*j-x)+width/2-160, (40*i-Y)-120, 360, 320);
        }
        if (mapdata[NUMBER][i][j] == 201) {
          image(block[201], (40*j-x)+width/2, (40*i-Y), 80, 80);
        }
        if (mapdata[NUMBER][i][j] == 202) {
          image(block[202], (40*j-x)+width/2, (40*i-Y), 80, 80);
        }
        if (mapdata[NUMBER][i][j] == 203) {
          image(block[203], (40*j-x)+width/2, (40*i-Y), 80, 80);
        }
        if (mapdata[NUMBER][i][j] == 204) {
          image(block[204], (40*j-x)+width/2, (40*i-Y), 80, 80);
        }
        if (mapdata[NUMBER][i][j] == 205) {
          image(block[205], (40*j-x)+width/2, (40*i-Y), 80, 80);
        }
        if (mapdata[NUMBER][i][j] == 206) {
          image(block[206], (40*j-x)+width/2, (40*i-Y), 80, 80);
        }
        if (mapdata[NUMBER][i][j] == 6||mapdata[NUMBER][i][j] == -6) {
          if (Switch == false) {
            mapdata[NUMBER][i][j] = 6;
            image(block[6], (40*j-x)+width/2, (40*i-Y), 40, 40);
          } else {
            image(block[110], (40*j-x)+width/2, (40*i-Y)/*40*i*/, 40, 40);
            mapdata[NUMBER][i][j] = -6;
          }
        }
        if (mapdata[NUMBER][i][j] == 7||mapdata[NUMBER][i][j] == -7) {
          if (Switch == true) {
            mapdata[NUMBER][i][j] = 7;
            image(block[7], (40*j-x)+width/2, (40*i-Y), 40, 40);
          } else {
            image(block[110], (40*j-x)+width/2, (40*i-Y), 40, 40);
            mapdata[NUMBER][i][j] = -7;
          }
        }
      }
    }

    for (int i = 0; i<54; i++) {
      for (int j = 0; j<96; j++) {
        if (mapdata[NUMBER][i][j] == 103) {
          noStroke();
          fill(0, 0, 180, 80);
          if (NUMBER == 4) {
            rect((40*j-x)+width/2, (40*i-Y), 40, 200);
          } else {
            rect((40*j-x)+width/2, (40*i-Y), 40, 1500);
          }
        }
      }
    }
  }
}










class Object extends Player {
  float addX, addY = -7;
  Object(float _x, float _y) {
    super(_x, _y, 0);
    Height = 40;
    a = 0.5;
    addX = random(-3, 4);
  }
  float Floor() {
    return super.Floor();
  }
  float Ceiling() {
    return super.Ceiling();
  }
  float wall(int _i) {
    return super.wall(_i);
  }

  void update() {
    if (x+addX+40>wall(1)||x+addX<wall(0)) {
      addX *= -1;
      addX /= 2;
    }
    if (y+Height+addY < Floor()) {
      addY += a;
      y += addY;
    } else {
      addY = 0;
      y = Floor()-Height;
    }
    x+=addX;
  }

  boolean needbreak() {
    if (dist(x+20, y+20, p.x+20, p.y+20)<40||dist(x+20, y+20, p.x+20, p.y+40)<40) {
      se[5].rewind();
      se[5].play();
      return true;
    }
    return false;
  }

  void drawing() {
    switch(map.imagecount%6) {
    case 0:
      number = 150;
      break;
    case 1:
      number = 151;
      break;
    case 2:
      number = 152;
      break;
    case 3:
      number = 153;
      break;
    case 4:
      number = 152;
      break;
    case 5:
      number = 151;
      break;
    default:
      break;
    }
    image(block[number], x-p.x+width/2, y, 40, 40);
  }
}

class Cap extends Object {

  Cap(float _x, float _y) {
    super(_x, _y);
    addY = -10;
  }
  void Update() {
    if (x+addX+40>wall(1)||x+addX<wall(0)) {
      addX *= -1;
      addX /= 2;
    }
    if (y< Floor()) {
      addY += a;
      y += addY;
    }
    x+=addX;
  }
  boolean Break() {
    if (y+20>Floor()) {
      for (int i = 0; i<5; i++) {
        broken(x-p.x+width/2, y, 68, 72, 239, 5);
      }
      return true;
    }
    return false;
  }
  void drawing() {
    image(block[155], x-p.x+p.X, y);
  }
}

class Bomb {
  int imgcount = 0;
  float x, y;
  boolean remove = false;
  Bomb(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void bomb() {
    if (imgcount<4) {
      if (framecount%3 == 0) {
        imgcount++;
      }
      image(bossimage[imgcount+3], x-p.x+p.X-40, y-40);
    } else {
      remove = true;
    }
  }
}






class Player {
  int xl, xr, yd, yu, wai, n, Width = 40, Height = 80, number = 2, lastnum = 2, count = 0, frame = 0, 
    hp, Dcounter = 0, Acounter = 0, atackx = 0, addX, addrange = 6, maxspeed = 30, zannki = 3;
  float x, X = width/2, y, Y = 0, addY, a = 1, addplus = 0, lastfloor, lastX, 
    dicxL, dicxR, dicy, dicyD, dicyU, 
    adju, sokudo, my, mY;
  boolean air= false, lastone = false, jump = false, zup = false, squat = false, Down = false, damagecount, 
    spacePressed = false, Right = false, Left = false, ceiling = false, death = false
    , SEj = false, firing = false, hasigo = false;

  Player(float _x, float _y, int _HP) {
    x = _x;
    y = _y;
    hp = _HP;
    right = false;
    left = false;
    hp = 100;
  }

  float Floor() {

    dicxL = (x+7)/40;
    dicy = (y+Height+map.Y)/40;
    dicxR = (x+40-7)/40;

    xl = int(dicxL+1);
    wai = int(dicy);
    xr = int(dicxR+1);

    if (wai<54 && wai>-1 && xr-1<96 && xl-1 > -1) {
      for (int i = 0; i<54-wai; i++) {
        if ((mapdata[NUMBER][wai+i][xl-1] >= 1&&mapdata[NUMBER][wai+i][xl-1]<=100)|| 
          (mapdata[NUMBER][wai+i][xr-1] >= 1&&mapdata[NUMBER][wai+i][xr-1]<=100)) {
          if (mapdata[NUMBER][wai+i][xl-1] == 100 || 
            mapdata[NUMBER][wai+i][xr-1] == 100) {
            death = true;
          } else {
            death = false;
          }
          return (wai+i)*40-map.Y;
        }
      }
    }
    return 54*40;
  }

  float Ceiling() {
    dicxL = (x+7)/40;
    dicxR = (x+40-7)/40;
    dicyU = (y+map.Y)/40;
    xl = int(dicxL+1);
    xr = int(dicxR+1);
    yu = int(dicyU);

    if (yu<54 && yu>-1 && xr-1<96 && xl-1 > -1) {
      for (int i = 0; i<yu-1; i++) {
        if ((mapdata[NUMBER][yu-i][xl-1] >= 1&&mapdata[NUMBER][yu-i][xl-1]<=100)&&(mapdata[NUMBER][yu-i][xl-1] > 4 || mapdata[NUMBER][yu-i][xl-1] < 3)||
          (mapdata[NUMBER][yu-i][xr-1] >= 1&&mapdata[NUMBER][yu-i][xr-1]<=100)&&(mapdata[NUMBER][yu-i][xr-1]>4||mapdata[NUMBER][yu-i][xr-1]<3)) {
          return (yu-i)*40+40-map.Y;
        }
        if (hasigo) {
          if ((mapdata[NUMBER][yu-i][xl-1] != 112)||
            (mapdata[NUMBER][yu-i][xr-1] != 112)) {
            return (yu-i)*40+40-map.Y;
          }
        }
      }
    }
    return 40-map.Y;
  }

  float wall(int _i) {//0 is left,1 is right

    dicxL = (x+5)/40;
    dicxR = (x+Width-5)/40;
    dicyU = (y+map.Y+20)/40;
    xl = int(dicxL);
    xr = int(dicxR);
    yu = int(dicyU);

    if (_i == 0 && yu<54 && yu>-1 && xr<96 && xl > -1) {
      for (int i = 0; i<xl; i++) {
        for (int j = 0; j< (Height/40); j++) {
          if (mapdata[NUMBER][yu+j][xl-i]>=1&&mapdata[NUMBER][yu+j][xl-i]<101&&(mapdata[NUMBER][yu+j][xl-i] > 4 || mapdata[NUMBER][yu+j][xl-i] < 3)) {
            if (mapdata[NUMBER][yu+j][xl-i] == 101) {
            } else {
              return (xl-i)*40+40;
            }
          }
        }
      }
      return 40;
    }
    if (_i >= 1 && yu<54 && yu>-1 && xl<96 && xl > -1) {
      for (int i = 0; i<96-xr; i++) {
        for (int j = 0; j<Height/40; j++) {
          if (mapdata[NUMBER][yu+j][xr+i]>=1&&mapdata[NUMBER][yu+j][xr+i]<101&&(mapdata[NUMBER][yu+j][xr+i] > 4 || mapdata[NUMBER][yu+j][xr+i] < 3)) {
            if (mapdata[NUMBER][yu+j][xr+i] == 101) {
            } else {
              return (xr+i)*40;
            }
          }
        }
      }
      return 96*40;
    }
    return 0;
  }
  void Lap() {
    int _x = int(x)/40, _y = int(y+map.Y)/40, Y;
    boolean continu = true;
    if (_y>0&&_y<54&&_x>0&&_x<96) {
      //Y = Height/40-1;
      Y = 0;
      for (int i = 0; i<2; i++) {
        for (int X = 0; X<2; X++) {


          switch(mapdata[NUMBER][_y+Y][_x+X]) {
          case 3:
          case 4:
            DN = lapnum[_y+Y][_x+X];
            changemap = true;
            break;
          case 101:
            gameclear = true;
            break;
          case 103:
            maxspeed = 5;
            break;
          case 104:
            maxspeed = 30;
            break;
          case 105:
            continu = false;
            se[3].pause();
            se[3].rewind();
            se[3].play();
            mapdata[NUMBER][_y+Y][_x+X] = 106;
            Switch = true;
            break;
          case 107:
            continu = false;
            se[3].pause();
            se[3].rewind();
            se[3].play();
            mapdata[NUMBER][_y+Y][_x+X] = 108;
            Switch = false;
            break;
          case 109:
            se[3].pause();
            se[3].rewind();
            se[3].play();
            weapon = true;
            mapdata[NUMBER][_y+Y][_x+X] = 0;
            break;
          case 112:
            if ((down||up)&&left == false&&right == false) {
              x = (_x+X)*40;
              hasigo = true;
            }
            break;
          case 150:
          case 151:
          case 152:
          case 153:
            se[5].rewind();
            se[5].play();
            score+=10;
            mapdata[NUMBER][_y+Y][_x+X] = 0;
            break;
          case 156:
            mapdata[NUMBER][_y+Y][_x+X] = 157;
            se[6].rewind();
            se[6].play();
            addplus = 0;
            activ = false;
            coins = true;
            x-=5;
            if (Left) {
              x+=5;
            }
            framecount = 0;
            break;
          case 158:
            mapdata[NUMBER][_y+Y][_x+X] = 159;
            se[6].rewind();
            se[6].play();
            addplus = 0;
            activ = false;
            coins = true;
            x-=5;
            if (Left) {
              x+=5;
            }
            framecount = 0;
            break;
          default:
            break;
          }
          if (continu == false) {
            break;
          }
        }
        if (Height >= 80) {
          Y++;
        }
        if (continu == false) {
          break;
        }
      }
    }
  }
  float updateX() {
    if (left == true && right == false) {
      Left = true;
      Right = false;
      if (addplus>-addrange) {
        if ((up == true || air == true)&&y-1>Ceiling()) {
          addplus -= 0.3;
        } else {
          addplus -= 1;
        }
      } else if (addplus<-addrange) {
        addplus += 1;
      } else {
        addplus = -addrange;
      }
    } else
      if (right == true && left == false) {
        Right = true;
        Left = false;

        if (addplus<addrange) {
          if ((up == true || air == true)&&y-1>Ceiling()) {
            addplus += 0.3;
          } else {
            addplus += 1;
          }
        } else if (addplus>addrange) {
          addplus -= 1;
        } else {
          addplus = addrange;
        }
      } else if (left == false && right == false || 
        left == true && right == true) {
        if (addplus<0 || addplus>0) {
          if ((up == true || air == true)&&y-1>Ceiling()) {
            if (addplus<0) {
              addplus += 0.15;
            } else {
              addplus -= 0.15;
            }
          } else {
            if (addplus<0) {
              addplus += 1;
              if (addplus>0) {
                addplus = 0;
              }
            } else {
              addplus -= 1;
              if (addplus<0) {
                addplus = 0;
              }
            }
          }
        }
      }
    if (x+addplus+40<wall(1) && x+addplus>wall(0)) {
      x += addplus;
    } else if (x+addplus+40>wall(1)) {
      x = wall(1)-40;
    } else if (x+addplus<wall(0)) {
      x = wall(0);
    }
    return x;
  }

  void jump() {
    if (y+sokudo > Ceiling()) {
      if (up&&ceiling == false&&hasigo == false&&y-1>Ceiling()) {
        air = true;
        if (jump == true) {
          addY = abs(sokudo)-15;
          jump = false;
          SEj = false;
        }
        if (SEj == false) {
          se[0].rewind();
          se[0].play();
          SEj = true;
        }
        switch(int(addY)) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
          n += -3;
          sokudo = n;
          break;
        case 5:
        case 6:
        case 7:
        case 8:
          n += -2;
          sokudo = n;
          break;
        case 9:
        case 10:
        case 11:
          n += -1;
          sokudo = n;
          break;
        case 12:
        case 13:
        case 14:
          n += -0.5;
          sokudo = n;
          break;
        case 15:
        case 16:
        case 17:
          n += -0.5;
          sokudo = n;
          break;
        case 18:
          n += -0.1;
          sokudo = n;
          break;
        default:
          sokudo = n;
        }
        y += sokudo;
        zup = true;
      } else if (zup == true) {
        if (maxspeed == 5) {
          SEj = se[0].isPlaying();
          if (SEj == false) {
            se[0].rewind();
          }
          jump = true;
        }
        y += sokudo;
        if (y-Ceiling()>=40) {
          if (maxspeed == 5) {
            jump = true;
          }
          ceiling = false;
        }
      } else {
        if (y-Ceiling()>=40) {
          if (maxspeed == 5) {
            jump = true;
          }
          ceiling = false;
        }
      }
    } else {
      ceiling = true;
      y = Ceiling();
      addY = 0;
      sokudo = 0;
      n = 0;
    }
  }

  float updateY() {
    if (hasigo == false) {
      if (squat) {
        up = false;
        air = false;
        Height = 40;
        Down = true;
      } else if (y-1>Ceiling()) {
        Height = 80;
        if (Down == true) {
          y -= 40;
          Down = false;
        }
      }
    } else {
      Height = 80;
    }
    lastone = air;
    //floor{
    if (y+Height+addY < Floor()) {
      //a += 0.5;
      if (addY+sokudo <maxspeed) {
        addY += a;
      } else {
        addY = abs(sokudo)+maxspeed;
      }
      /*if (number == 1||number == 2) {
       number = 9;
       lastnum = number;
       } else if (number == 3||number == 4) {
       number = 10;
       lastnum = number;
       }*/
      Y = y;
      y += addY;
    } else {
      if (death == true) {
        hp -= 200;
        HP -= 200;
      }
      map.sc = false;
      up = false;
      zup = false;
      air = false;
      SEj = false;
      se[0].pause();
      se[0].rewind();
      if (death == false) {
        lastfloor = y+map.Y-Height;
        lastX = x;
        if (Left) {
        }
      }
      y = Floor()-Height;
      addY = 0;
      n = 0;
      sokudo = 0;
    }

    return y;
  }
  //}

  void update() {
    if (zdash == true) {
      addrange = 11;
    } else {
      addrange = 6;
    }
    if (hasigo == false) {
      jump();
    } else {
      Hasigo();
    }
    y = updateY();
    if (Boss == false||framecount>300) {
      if (hasigo == false) {
        x = updateX();
      }
    } else {
      number = 3;
      lastnum = number;
    }


    //scroll{
    if (y>height-180 || y<180) {
      if (y<180) {
      }
      map.sc = true;
      map.one = true;
    } else {
      map.sc = false;
    }
    if ((up == true || air == true)&&y-1>Ceiling()) {
    }
    //blocklap();
    Lap();
    number = animation();
  }
  void drawing() {
    frame++;
    if (frame%3 == 0) {
      count++;
    }
    if (hp>0) {
      if (activ) {
        update();
      } else {
        Clear();
      }
      if (Boss == true&&framecount>300&&Bossclear == false) {
        if (x>1840) {
          if (damagecount==false) {
            HP -= 5;
            hp -= 5;
          }
          damagecount = true;
          x = 1839;
        }
        X = x-17*40+10;
      }
      atack();
      damage();
      image(player[number], X+atackx, y, Width, Height);
      for (int i = 0; i<bullet.size(); i++) {
        bul = bullet.get(i);
        bul.drawing();
        if (bul.Break()) {
          float _x = (bul.x+20)-p.x+p.X;
          broken(_x, bul.y, 255, 255, 0, 1);
          bullet.remove(i);
        }
      }
    } else if (count>=20) {
      se[7].rewind();
      se[7].play();
      cap.add(new Cap(x, y));
      count = 0;
      addY = 0;
    } else {
      float adx = 0;
      if (y+Height+addY < Floor()) {
        //a += 0.5;
        if (addY+sokudo <maxspeed) {
          addY += a;
        } else {
          addY = abs(sokudo)+maxspeed;
        }
        Y = y;
        y += addY;
      } else {
        y = Floor()-Height;
        addY = 0;
        n = 0;
        sokudo = 0;
      }
      int C = count;
      if (count>9) {
        C = 9;
      }
      number = 30+C;
      if (Left) {
        adx = -40;
        number = 40+C;
      }
      image(player[number], X+adx, y, 80, 80);
      //X = width/2;
      if (count == 19) {
        zannki--;
        hp = 100;
        x = lastX;
        y = lastfloor-map.Y;
        //map.Y = 0;
        addplus = 0;
        death = false;
      }
    }
  }
  void damage() {
    DamageCount();
    for (int i = 0; i<enemy0.size (); i++) {
      if ((x+atackx+Width<enemy0.get(i).x+30 && x+atackx>enemy0.get(i).x+10 ||
        x+atackx<enemy0.get(i).x+30 && x+atackx+Width>enemy0.get(i).x+10) &&
        (y+Height<enemy0.get(i).y+20 && y>enemy0.get(i).y ||
        y<enemy0.get(i).y+20 && y+Height>enemy0.get(i).y)) {
        if (space == true) {
          if (Left == true && enemy0.get(i).x<x+atackx) {
            se[1].pause();
            se[1].rewind();
            se[1].play();
            coin.add(new Object(enemy0.get(i).x, enemy0.get(i).y));
            enemy0.remove(i);
          } else if (enemy0.get(i).x>x+40) {
            coin.add(new Object(enemy0.get(i).x, enemy0.get(i).y));
            se[1].pause();
            se[1].rewind();
            se[1].play();
            enemy0.remove(i);
          } else {
            se[2].pause();
            se[2].rewind();
            se[2].play();
            damagecount = true;
            hp -=10;
            HP -= 10;
            score -= 3;
            enemy0.remove(i);
          }
        } else if (damagecount == false) {
          se[2].pause();
          se[2].rewind();
          se[2].play();
          damagecount = true;
          hp -= 10;
          HP -= 10;
          score -= 3;
          enemy0.remove(i);
        }
      }
    }
    for (int i = 0; i<enemy1.size (); i++) {
      if ((x+atackx+Width<enemy1.get(i).x+30 && x+atackx>enemy1.get(i).x+10 ||
        x+atackx<enemy1.get(i).x+30 && x+atackx+Width>enemy1.get(i).x+10) &&
        (y+Height<enemy1.get(i).y+20 && y>enemy1.get(i).y ||
        y<enemy1.get(i).y+20 && y+Height>enemy1.get(i).y)) {
        if (space == true) {
          if (Left == true && enemy1.get(i).x<x+atackx) {
            se[1].pause();
            se[1].rewind();
            se[1].play();
            coin.add(new Object(enemy1.get(i).x, enemy1.get(i).y));
            coin.add(new Object(enemy1.get(i).x, enemy1.get(i).y));
            enemy1.remove(i);
          } else if (enemy1.get(i).x>x+40) {
            se[1].pause();
            se[1].rewind();
            se[1].play();
            coin.add(new Object(enemy1.get(i).x, enemy1.get(i).y));
            coin.add(new Object(enemy1.get(i).x, enemy1.get(i).y));
            enemy1.remove(i);
          } else if (damagecount == false) {
            se[2].pause();
            se[2].rewind();
            se[2].play();
            damagecount = true;
            hp -= 10;
            HP -= 10;
            score -= 2;
            enemy1.remove(i);
          }
        } else if (damagecount == false) {
          se[2].pause();
          se[2].rewind();
          se[2].play();
          damagecount = true;
          hp -= 10;
          HP -= 10;
          score -= 2;
          enemy1.remove(i);
        }
      }
    }
  }
  void DamageCount() {
    if (damagecount == true && Dcounter <= 60) {
      Dcounter += 1;
      number = lastnum;
      if (space&&Acounter<5) {
        if (Right) {
          number = 12;
          if (squat) {
            number = 14;
          }
        } else {
          number = 11;
          if (squat) {
            number = 13;
          }
        }
      }
      if ((Dcounter/3)%2 == 1) {
        number = 0;
      }
    } else {
      Dcounter = 0;
      damagecount = false;
    }
  }
  void atack() {
    Acounter++;

    if (space == true && Acounter <= 5) {
      if (x+40<wall(1)||x>wall(0)) {
        if (Left) {
          if (weapon ==false) {
            spacePressed = true;
          } else if (Acounter == 1) {
            se[4].rewind();
            se[4].play();
            spacePressed = true;
            if (Height == 80) {
              bullet.add(new Bullet(x, y+30, 0));
            } else {
              bullet.add(new Bullet(x, y+19, 0));
            }
          }
        } else {
          if (weapon ==false) {
            spacePressed = true;
          } else if (Acounter == 1) {
            se[4].rewind();
            se[4].play();
            spacePressed = true;
            if (Height == 80) {
              bullet.add(new Bullet(x, y+30, 0));
            } else {
              bullet.add(new Bullet(x, y+19, 0));
            }
          }
        }
        if ((x+40>wall(1)-40||x<wall(0)+40)&&weapon == false) {
          if (Right == true&&x+40>wall(1)-40&&weapon == false) {
            x = wall(1)-80;
          } else if (Left == true&&x<wall(0)+40&&weapon == false) {
            x = wall(0)+40;
          }
        }
      }
    } else {
      spacePressed = false;
      atackx = 0;
      if (Acounter >= 10) {
        Acounter = 0;
      }
      Width = 40;
      number = lastnum;
      if (space == false) {
        Acounter = 0;
      }
    }

    if (firing == true&&Acounter == 1) {
      firing = false;
      if (Down == true) {
        se[4].pause();
        se[4].rewind();
        se[4].play();
        bullet.add(new Bullet(x, y+15, bullet.size()));
      } else {
        se[4].pause();
        se[4].rewind();
        se[4].play();
        bullet.add(new Bullet(x, y+30, bullet.size()));
      }
    }
  }

  void Hasigo() {
    a = 0;
    addY = 0;
    sokudo = 0;
    n = 0;
    addplus = 0;
    if (y+addY>Ceiling()) {
      if (up) {
        addY = -5.1;
      }
    } else {
      ceiling = true;
    }
    if (down) {
      addY =5.1;
    }

    if (left) {
      hasigo = false;
      a = 1;
    }
    if (right) {
      hasigo = false;
      a = 1;
    }
  }

  int animation() {
    if (hasigo) {
      if (lastnum<19) {
        lastnum = 19;
      }
      if (up&&ceiling == false) {
        switch(lastnum) {
        case 19:
          number = 20;
          lastnum = number;
          break;
        case 20:
          number = 21;
          lastnum = number;
          break;
        case 21:
          number = 22;
          lastnum = number;
          break;
        case 22:
          number = 23;
          lastnum = number;
          break;
        case 23:
          number = 24;
          lastnum = number;
          break;
        case 24:
          number = 19;
          lastnum = number;
          break;
        default:
          break;
        }
      } else if (down) {
        ceiling = false;
        switch(lastnum) {
        case 19:
          number = 20;
          lastnum = number;
          break;
        case 20:
          number = 21;
          lastnum = number;
          break;
        case 21:
          number = 22;
          lastnum = number;
          break;
        case 22:
          number = 23;
          lastnum = number;
          break;
        case 23:
          number = 24;
          lastnum = number;
          break;
        case 24:
          number = 19;
          lastnum = number;
          break;
        default:
          break;
        }
      }
    } else
      if (Left) {
        number = 1;
        lastnum = number;
        if (squat) {
          number = 5;
          lastnum = number;
        }
        if ((left||right)) {
          if (squat == true) {
            number = count%2;
            number += 5;
            lastnum = number;
          } else {
            number = count%2;
            number += 1;
            lastnum = number;
          }
        }
        if (air&&y+addY+Height<Floor()) {
          number = 9;
          lastnum = number;
        }
        if (spacePressed) {
          Width = 80;
          atackx = -40;
          number = 11;
          if (weapon) {
            Width = 40;
            atackx = 0;
            number = 17;
          }
          if (squat) {
            number = 13;
            if (weapon) {
              Width = 40;
              atackx = 0;
              number = 16;
            }
          }
        }
      } else
        if (Right) {
          number = 3;
          lastnum = number;
          if (squat) {
            number = 7;
            lastnum = number;
          }
          if ((left||right)) {
            if (squat == true) {
              number = count%2;
              number += 7;
              lastnum = number;
            } else {
              number = count%2;
              number += 3;
              lastnum = number;
            }
          }
          if (air&&y+addY+Height<Floor()) {
            number = 10;
            lastnum = number;
          }
          if (spacePressed) {
            Width = 80;
            number = 12;
            if (weapon) {
              Width = 40;
              atackx = 0;
              number = 18;
            }
            if (squat) {
              number = 14;
              if (weapon) {
                Width = 40;
                atackx = 0;
                number = 15;
              }
            }
          }
        }

    return number;
  }
  void Clear() {
    if (framecount>50) {
      addY += a;
      y+=addY;

      number = 10;
      if (Left) {
        number = 9;
      }
      lastnum = number;
      if (y+Height+addY > Floor()) {
        Height = 80;
        y = Floor()-Height;
        addY = -10;
      }
    }
    if (activ == false&&framecount>140) {
      fadecount = 140;
      fadeout = true;
    }
  }
}








void titleUI() {
  int x = int(random(-5, 5)), y = int(random(-5, 5));
  float n = 45;
  boolean on = false;
  image(title, 0, 0, width, height);
  if (mouse == true) {
    right = false;
  }
  if (right == true) {
    AUI[0].play();
    on = true;
    if (space == true) {
      TITLE = false;
      bgm[0].pause();
    }
  }
  if (mouseX>width-width/4&&mouseX<width-width/4+220) {
    if (mouseY<senn(45, 45)&&mouseY>senn(-45, 45)&&
      mouseY<senn(-45, 135)&&mouseY>senn(45, -45)) {
      on = true;
    }
  }
  if (on == true) {
    image(UI[1], width-width/4+x, height-height/4+y, 220, 90);
    if (mousePressed) {
      TITLE = false;
      bgm[0].pause();
    }
  } else {
    AUI[0].pause();
    AUI[0].rewind();
    image(UI[0], width-width/4, height-height/4, 220, 90);
  }
}

float senn(float _y, float _n) {
  return (mouseX-(width-width/4))*_y/110+(height-height/4+_n);
}

void HPgauge() {
  fill(255);
  textSize(30);
  text("HP", 20, 50);
  fill(250);
  rect(15, 55, 110, 20, 20);
  fill(0);
  rect(20, 60, 100, 10, 20);
  if (p.hp > 0) {
    fill(0, 200, 255);
    rect(20, 60, p.hp, 10, 20);
  } else {
  }
}
void score() {
  if (score<0) {
    score=0;
  }
  textSize(30);
  fill(255);
  image(block[150], 150, 10);
  text(score, 200, 40);
}

void zannki() {
  if (p.zannki < 0) {
    GAMEOVER = true;
  }
  for (int i = 0; i<p.zannki; i++) {
    image(block[154], i*40+300, 10);
  }
}






class Bullet extends Player {
  boolean needremove;
  Bullet(float _X, float _Y, int _num) {
    super(0, 0, 0);
    x = _X;
    y = _Y;
    number = _num;
    Height = 40;
    if (p.Right == true) {
      addX = 20;
    } else {
      addX = -20;
    }
  }

  float Floor() {
    return super.Floor();
  }
  float Ceiling() {
    return super.Ceiling();
  }
  float wall(int _i) {
    return super.wall(_i);
  }
  float updateX() {
    x += addX;
    return x;
  }
  float updateY() {
    if (p.y<180) {
      y += 180-p.y;
    }
    if (p.y>=height-175) {
      y += (height-180)-p.y;
    }
    return y;
  }
  boolean Break() {
    if (dist((x+20)-p.x+p.X, y, boss.x+40, boss.y+40)<40&&Bossclear == false) {
      needremove=true;
      boss.hp -= 5;
    }
    for (int i = enemy0.size()-1; i>=0; i--) {
      if ((x+atackx+Width<enemy0.get(i).x+30 && x+atackx>enemy0.get(i).x+10 ||
        x+atackx<enemy0.get(i).x+30 && x+atackx+Width>enemy0.get(i).x+10) &&
        (y+Height<enemy0.get(i).y+20 && y>enemy0.get(i).y ||
        y<enemy0.get(i).y+20 && y+Height>enemy0.get(i).y)) {
        se[1].pause();
        se[1].rewind();
        se[1].play();
        coin.add(new Object(enemy0.get(i).x, enemy0.get(i).y));

        enemy0.remove(i);
        needremove = true;
      }
    }
    for (int i = enemy1.size()-1; i>=0; i--) {
      if ((x+atackx+Width<enemy1.get(i).x+30 && x+atackx>enemy1.get(i).x+10 ||
        x+atackx<enemy1.get(i).x+30 && x+atackx+Width>enemy1.get(i).x+10) &&
        (y+Height<enemy1.get(i).y+20 && y>enemy1.get(i).y ||
        y<enemy1.get(i).y+20 && y+Height>enemy1.get(i).y)) {
        se[1].pause();
        se[1].rewind();
        se[1].play();
        coin.add(new Object(enemy1.get(i).x, enemy1.get(i).y));
        coin.add(new Object(enemy1.get(i).x, enemy1.get(i).y));
        enemy1.remove(i);
        needremove = true;
      }
    }
    for (int i = 0; i<54; i++) {
      for (int j = 0; j<96; j++) {
        if (mapdata[NUMBER][i][j] == 105) {
          if ((x+atackx+Width<j*40+40&&x+atackx>j*40||x+atackx<j*40+40&&x+atackx+Width>j*40)
            &&(y+Height+map.Y<i*40&&y+map.Y>i*40+80||y+map.Y<i*40+80&&y+Height+map.Y>i*40)) {
            se[3].pause();
            se[3].rewind();
            se[3].play();
            Switch = true;
            needremove = true;
          }
        }
        if (mapdata[NUMBER][i][j] == 107) {
          if ((x+atackx+Width<j*40+40&&x+atackx>j*40||x+atackx<j*40+40&&x+atackx+Width>j*40)
            &&(y+Height+map.Y<i*40&&y+map.Y>i*40+80||y+map.Y<i*40+80&&y+Height+map.Y>i*40)) {
            se[3].pause();
            se[3].rewind();
            se[3].play();
            Switch = false;
            needremove = true;
          }
        }
      }
    }
    if (x < wall(0)||x > wall(1)||needremove) {
      return true;
    } else {
      return false;
    }
  }
  void drawing() {
    x = updateX();
    if (Boss == false) {
      y = updateY();
    }
    Break();
    fill(180, 180, 0);
    rectMode(CENTER);
    stroke(255, 255, 0);
    rect((x+20)-p.x+p.X, y, 4, 2);
    noStroke();
    rectMode(CORNER);
  }
}

class BossBullet extends Player {
  float dx, dy, add, rad, lastrad;
  boolean needremove;
  int count;
  BossBullet(float _rad, float _Y, int num, int yy) {
    super(0, 0, 0);
    x = 1940;
    num *= 40;
    y = _Y*num+220+yy;
    rad = _rad;
    lastrad = rad-2;
    Height = 40;
    add = -5;
  }

  float Floor() {
    return super.Floor();
  }
  float Ceiling() {
    return super.Ceiling();
  }
  float wall(int _i) {
    return super.wall(_i);
  }
  void update() {
    count++;
    /*if(count>40){
     dx = (p.x+20)-x;
     dy = (p.y+40)-y;
     
     rad = atan(dy/dx);
     if (dx < 0) {
     rad += PI;
     }
     rad = degrees(rad);
     
     if (rad-lastrad>1) {
     if (rad-lastrad>180) {
     if (lastrad+90+270-rad>1) {
     rad = lastrad-1;
     if (rad<-90) {
     rad = 360+rad;
     }
     }
     } else {
     rad = lastrad+1;
     }
     } else if (rad-lastrad<-1) {
     if (rad-lastrad<-180) {
     if (270-lastrad+90+rad>1) {
     rad = lastrad+1;
     if (rad>270) {
     rad-=360;
     }
     }
     } else {
     rad = lastrad-1;
     }
     }
     lastrad = rad;
     }*/
    x += 3*cos(radians(rad));
    y += 3*sin(radians(rad));
  }
  boolean Break() {

    if (dist(p.x+20, p.y+0, x, y)<20||dist(p.x+20, p.y+40, x, y)<15) {
      if (p.Dcounter<10||p.Dcounter>40) {
        HP -= 10;
        p.hp -= 10;
        p.damagecount = true;
      }
      needremove = true;
    }

    if (y<Ceiling()||y>Floor()||x < wall(0)||x > wall(1)||needremove == true) {
      return true;
    } else {
      return false;
    }
  }
  void drawing() {
    update();
    Break();
    noFill();
    rectMode(CENTER);
    stroke(255, 255, 0);
    ellipse(x-p.x+p.X, y, 15, 15);
    stroke(255);
    rectMode(CORNER);
  }
}
class Bossmissile extends Player {
  float dx, dy, add, rad, lastrad;
  boolean needremove;
  int count, a = 0;
  Bossmissile(float _rad, float _Y) {
    super(0, 0, 0);
    x = 1900;
    y = _Y*120+220;
    rad = _rad;
    lastrad = rad-2;
    Height = 40;
    add = -5;
  }

  float Floor() {
    return super.Floor();
  }
  float Ceiling() {
    return super.Ceiling();
  }
  float wall(int _i) {
    return super.wall(_i);
  }
  void update() {
    count++;
    if (count>40) {
      dx = (p.x+20)-x;
      dy = (p.y+(20*p.Height/40))-y;

      rad = atan(dy/dx);
      if (dx < 0) {
        rad += PI;
      }
      rad = degrees(rad);

      if (rad-lastrad>1) {
        if (rad-lastrad>180) {
          if (lastrad+90+270-rad>1) {
            rad = lastrad-1;
            if (rad<-90) {
              rad = 360+rad;
            }
          }
        } else {
          rad = lastrad+1;
        }
      } else if (rad-lastrad<-1) {
        if (rad-lastrad<-180) {
          if (270-lastrad+90+rad>1) {
            rad = lastrad+1;
            if (rad>270) {
              rad-=360;
            }
          }
        } else {
          rad = lastrad-1;
        }
      }
      lastrad = rad;
    }
    x += 3*cos(radians(rad));
    y += 3*sin(radians(rad));
  }
  boolean Break() {

    if (dist(p.x+20, p.y+20, x, y)<15||dist(p.x+20, p.y+40, x, y)<15) {
      if (p.Dcounter<10||p.Dcounter>40) {
        if (p.x-(x-10)<0) {
          p.addplus = -10;
        } else {
          p.addplus = 10;
        }
        if (p.damagecount == false) {
          HP -= 10;
          p.hp -= 10;
          p.damagecount = true;
        }
      }
      needremove = true;
    }
    for (int i = 0; i<54; i++) {
      for (int j = 0; j<96; j++) {
        if (mapdata[NUMBER][i][j] == 105) {
          if ((x+atackx+Width<j*40+40&&x+atackx>j*40||x+atackx<j*40+40&&x+atackx+Width>j*40)
            &&(y+Height+map.Y<i*40&&y+map.Y>i*40+80||y+map.Y<i*40+80&&y+Height+map.Y>i*40)) {
            se[3].pause();
            se[3].rewind();
            se[3].play();
            Switch = true;
            needremove = true;
          }
        }
        if (mapdata[NUMBER][i][j] == 107) {
          if ((x+atackx+Width<j*40+40&&x+atackx>j*40||x+atackx<j*40+40&&x+atackx+Width>j*40)
            &&(y+Height+map.Y<i*40&&y+map.Y>i*40+80||y+map.Y<i*40+80&&y+Height+map.Y>i*40)) {
            se[3].pause();
            se[3].rewind();
            se[3].play();
            Switch = false;
            needremove = true;
          }
        }
      }
    }
    if (y<Ceiling()||y>Floor()||x < wall(0)||x > wall(1)||needremove == true) {
      return true;
    } else {
      return false;
    }
  }
  void drawing() {
    if (count%15 >= 7) {
      a =0;
    } else {
      a = 1;
    }
    update();
    Break();
    fill(255, 0, 0);
    stroke(255, 255, 0);
    pushMatrix();
    translate(x+p.X-p.x, y);
    imageMode(CENTER);
    rotate(radians(rad+180));
    image(bossmissile[a], 0, 0, 40, 40);
    imageMode(CORNER);
    //rotate(-rad);
    popMatrix();
    stroke(255);
  }
}


void SCkeyPre() {
  if (key =='w' &&tip) {
    if ((p.Down&& p.y-1>p.Ceiling())) {
      down = false;
    }
    up = true;
  }
  if (key == 'a') {
    left = true;
  }
  if (key == 'd') {
    right = true;
  }
  if (key == 's') {
    if (tip) {
      down = true;
      if (p.Down == true && p.y-1>p.Ceiling()) {
        down = false;
      }
    } else {
      up = false;
      down = true;
    }
  }
  if (keyCode == UP) {
    if (GAMEOVER == false && loadmap == true && gameclear == false) {
      if (p.Down == true && p.y-1>p.Ceiling()) {
        p.squat = false;
      }
      up = true;
    } else {
      p.squat = false;
      up = true;
    }
  }
  if (keyCode == LEFT) {
    right = false;
    left = true;
  }
  if (keyCode == RIGHT) {
    mouse = false;
    left = false;
    right = true;
  }
  if (keyCode == DOWN) {
    if (tip) {
      down = true;
      if (p.hasigo == false) {
        p.squat = true;
        if (p.Down == true && p.y-1>p.Ceiling()&&downd) {
          p.squat = false;
          downd = false;
        }
      }
    } else if (downd) {
      up = false;
      down = true;
      downd = false;
    }
  }
  if (key == 'z') {
    zdash = true;
  }
  if (key == 'x'||key ==' ') {
    space = true;
  }
}


void SCkeyRele() {
  if (key == 'w') {
    up = false;
  }

  if (key == 'a') {
    if (changemap == false&&TITLE == false) {
      left = false;
    }
  }

  if (key == 'd') {
    if (changemap == false&&TITLE == false) {
      right = false;
    }
  }
  if (keyCode == UP) {
    up = false;
  }
  if (keyCode == LEFT) {
    if (changemap == false&&TITLE == false) {
      left = false;
    }
  }
  if (keyCode == RIGHT) {
    if ((changemap == false&&TITLE == false)) {
      right = false;
    }
  }
  if (keyCode == DOWN) {
    down = false;
    downd = true;
  }
  if (key == 'x'||key ==' ') {
    space = false;
  }
  if (key == 'z') {
    zdash = false;
  }
}

void ending() {
}

void bossHP() {
  bossHPcount++;
  if (bossHPcount>180) {
    if (bossHPgauge<boss.hp&&bosshpgaugefin == false) {
      se[8].play();
      bossHPgauge+=4;
    } else {
      bosshpgaugefin = true;
      bossHPgauge = boss.hp;
      if (bossHPgauge<0) {
        bossHPgauge = 0;
      }
      if (bossHPcount>300) {
        if (bgm[2].isPlaying() == false) {
          bgm[2].rewind();
          bgm[2].play();
        }
      }
    }
    noStroke();
    rectMode(CENTER);
    fill(150);
    rect(640, 100, 900, 50, 20);
    rectMode(CORNER);
    fill(0);
    rect(210, 85, 850, 30, 25);
    fill(0, 100, 255);
    rect(210, 85, (850.0/500.0)*bossHPgauge, 30, 25);
  }
}

void loading() {
  minim = new Minim(this);
  bgm = new AudioPlayer[5];
  AUI = new AudioPlayer[5];
  se = new AudioPlayer[10];
  changemapnum[1][0] = 2;
  changepointnum[1][0]=0;

  changemapnum[2][1] = 3;
  changepointnum[2][1]=0;

  changemapnum[2][0] = 1;
  changepointnum[2][0]=0;

  changemapnum[3][0] = 2;
  changepointnum[3][0]=1;

  changemapnum[3][1] = 4;
  changepointnum[3][1]=0;
  player = new PImage[50];
  block = new PImage[250];
  enemydata = new PImage[8];
  bossimage = new PImage[10];
  bossmissile = new PImage[3];
  UI = new PImage[10];
  for (int i = 0; i<2; i++) {
    UI[i] = loadImage("UI0"+i+".png");
  }
  for (int i = 0; i<10; i++) {
    block[i] = loadImage("block"+i+".png");
  }
  block[100] = loadImage("block100.png");
  block[101] = loadImage("block101.png");
  block[103] = loadImage("block103.png");
  block[105] = loadImage("switch.png");
  block[106] = loadImage("switched.png");
  block[107] = loadImage("switch2.png");
  block[108] = loadImage("switched2.png");
  block[109] = loadImage("block109.png");
  block[110] = loadImage("block110.png");
  block[111] = loadImage("block111.png");
  block[112] = loadImage("hasigo.png");
  block[150] = loadImage("item0.png");
  block[151] = loadImage("item1.png");
  block[152] = loadImage("item2.png");
  block[153] = loadImage("item3.png");
  block[154] = loadImage("zannki.png");
  block[155] = loadImage("object.png");
  block[156] = loadImage("block156.png");
  block[157] = loadImage("block157.png");
  block[158] = loadImage("block158.png");
  block[159] = loadImage("block159.png");
  block[200] = loadImage("background0.png");
  block[201] = loadImage("background1.png");
  block[202] = loadImage("background2.png");
  block[203] = loadImage("background3.png");
  block[204] = loadImage("background4.png");
  block[205] = loadImage("background5.png");
  block[206] = loadImage("background6.png");
  for (int i = 0; i<50; i++) {
    player[i] = loadImage("player"+i+".png");
  }
  for (int i = 0; i<8; i++) {
    enemydata[i] = loadImage("enemy"+i+".png");
  }
  for (int i = 0; i<3; i++) {
    bossimage[i] = loadImage("boss"+i+".png");
  }
  bossimage[3] = loadImage("bomb0.png");
  bossimage[4] = loadImage("bomb1.png");
  bossimage[5] = loadImage("bomb2.png");
  bossimage[6] = loadImage("bomb3.png");
  bossimage[7] = loadImage("bomb4.png");
  for (int i = 0; i<2; i++) {
    bossmissile[i] = loadImage("BM"+i+".png");
  }
  title = loadImage("title.png");
  gameover = loadImage("GAMEOVER.png");
  GAMECLEAR = loadImage("gameclear.png");
  TIP = loadImage("tip.png");
  GMOV = minim.loadFile("gameover.wav");
  for (int i = 0; i<2; i++) {
    bgm[i] = minim.loadFile("bgm"+i+".wav");
  }
  bgm[2] = minim.loadFile("bossbgm.wav");
  for (int i = 0; i<2; i++) {
    AUI[i] = minim.loadFile("UI"+i+".wav");
  }
  for (int i = 0; i<5; i++) {
    se[i] = minim.loadFile("SE"+i+".wav");
  }
  se[5] = minim.loadFile("coin.wav");
  se[6] = minim.loadFile("coins2.wav");
  se[7] = minim.loadFile("deth.wav");
  se[8] = minim.loadFile("hpgauge.wav");
  se[9] = minim.loadFile("bomb.wav");
}
