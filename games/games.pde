import ddf.minim.*;
Minim mi = new Minim(this);
Spawn spawn = new Spawn(),spawn2 = new Spawn(),spawn3 = new Spawn(),spawn4 = new Spawn();
AudioPlayer[] Se = new AudioPlayer[5];
HPlayer P = new HPlayer(350,700);
ArrayList<HGrain> gra = new ArrayList<HGrain>();
ArrayList<HGrain2> gr2 = new ArrayList<HGrain2>();
ArrayList<HEnemy1> e1 = new ArrayList<HEnemy1>();
ArrayList<HEnemy2> e2 = new ArrayList<HEnemy2>();
ArrayList<HBullet> bull = new ArrayList<HBullet>();
ArrayList<HBullet2> bull2 = new ArrayList<HBullet2>();
ArrayList<HE1bullet> e1bull = new ArrayList<HE1bullet>();
ArrayList<HObject> ob = new ArrayList<HObject>();
boolean X;
int radian,time = 120,FIL = 0;
float _X;

Minim minim;
AudioPlayer GMOV, clear;
AudioPlayer[] AUI, bgm, se;
Player p;
Boss boss;
ArrayList<Bullet> bullet = new ArrayList<Bullet>();
ArrayList<Bossmissile> Missile = new ArrayList<Bossmissile>();
ArrayList<BossBullet> BB = new ArrayList<BossBullet>();
ArrayList<Object> coin = new ArrayList<Object>();
ArrayList<Cap> cap = new ArrayList<Cap>();
ArrayList<Bomb> bomb = new ArrayList<Bomb>();
ArrayList<Grain> gr = new ArrayList<Grain>();
ArrayList<Enemy0> enemy0 = new ArrayList<Enemy0>();
ArrayList<Enemy1> enemy1 = new ArrayList<Enemy1>();
Bullet bul;
Bossmissile missile;
BossBullet bb;
Enemy0 enemy00;
Enemy1 enemy01;
Map map;
PImage[] player, block;
PImage[]enemydata;
PImage[]bossimage, bossmissile;
PImage gameover, GAMECLEAR, title, TIP;
PImage []UI;
int NUMBER = 0, lastnumber, score = 0, counter, fill = 0, DN=0, changepoint = -1, HP = 100, 
  framecount = 0,fadecount;
int[] Enum = new int[10];
int[][] changemapnum = new int[10][10], changepointnum = new int[10][10], lapnum = new int[54][96];
int[][][] mapdata = new int[10][54][96];
float px = 500, py = height/2;
String mapname = "createmap";
boolean  up = false, down = false, left = false, right = false, zdash = false, space = false, downd, 
  changemap = false, loadmap = false, fade = false, gameclear = false, GAMEOVER = false, TITLE = true, 
  playing, SE = false, mouse = false, tip = false, 
  Switch = false, weapon = false, Boss = false, Bossclear = false,tutorial = true,activ = true,coins,fadeout = false,
  needloadmap = false, main = false;
  
  int bossHPcount = 0,bossHPgauge = 0;
  
  boolean HSS = false,SC = true;
  
  boolean bosshpgaugefin = false;
  
void setup(){
  size(1280, 720);
  loading();
  map = new Map();
  noStroke();
  textFont(createFont("メイリオ",16));
  Se[1] = mi.loadFile("bullets.wav");
  Se[2] = mi.loadFile("deths.wav");
}

void draw(){
  if(SC&&HSS == false){
    time = 120;
    P.power = 0;
    P.ver = 1;
    FIL = 0;
  ScrollgameMain();
  }
  else if(HSS&&SC == false){
    MAIN();
  }
  if(key == 'G'){
    bgm[0].pause();
    bgm[1].pause();
    bgm[0].rewind();
    bgm[1].rewind();
    TITLE = true;
  HSS = true;
  SC = false;
}
}



void keyPressed() {
  if(SC&&HSS == false){
    SCkeyPre();
  }
  else if(HSS&&SC == false){
   HSSkeyPre(); 
  }
}

void keyReleased() {
  if(SC&&HSS == false){
    SCkeyRele();
  }
  else if(HSS&&SC == false){
    HSSkeyRele();
  }
}


void ScrollgameMain(){
  Booleans();
  TITLE();
  Loadmap();
  Main();
  GAMEOVER();
  if(fadeout){
    fade();
  }
  noFill();
  stroke(150);
  strokeWeight(20);
  rect(-1,-1,width,height,20);
  stroke(240);
  strokeWeight(12);
  rect(-1,-1,width,height,20);
  noStroke();
  strokeWeight(1); 
}