int SCREEN_SIZE = 500;

PImage face;
int rotFace;

PImage[] mouth;
int mouthNum;
boolean mouthCount;
boolean mouthTime;

PImage[] eye;
int eyeNum;
int eyeRandom;
boolean eyeTime;
boolean eyeCount;
double eyeTimer;

PImage leftArm;
PImage rightArm;
int rotLeftArm;
int rotRightArm;

PImage body;
PImage hair;
PImage momiage;
PImage img1;


int i,j;
float a,b,c,d,e;
int R, G, B;       //赤、緑、青それぞれの値
float area[];      //それぞれのクラスタ番号の面積
float area_x[];    //それぞれのクラスタ番号のxの合計
float area_y[];    //それぞれのクラスタ番号のyの合計
int map[][];       //クラスタリング[x][y]
float minimum;
float dis[];       //前回の重心からの距離
int gg;            //今回の重心の位置(番号）
int I;             //何個あるか
int Line; //行数、クラスタリングの番号
float dis_min;     //最小距離
float m;           //重心の個数
float ce_x, ce_y;  //重心の座標
