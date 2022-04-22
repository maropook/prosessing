import processing.sound.*;
 
//マイク
AudioIn in;
//音量を取得してくれるもの
Amplitude amp;
 
//ウインドウのサイズ
int SCREEN_SIZE = 500;
 
PImage fase;
int rotFase;
 
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
 
PImage leftFoot;
PImage rightFoot;
PImage body;
 
PImage rightHand;
PImage leftHand;
int rotRigthHand;
int rotLeftHand;
 
PImage tail;
 
 
void setup() {
  
  frameRate(60);
  PFont font = createFont("Yu Gothic",64,true);
  textFont(font);
  
  size(500,500);
  
  //マイク設定
  in = new AudioIn(this);
  in.start();
  
  // 音量の取得を開始
  amp = new Amplitude(this);
  amp.input(in);
  
  
  //目の処理
  eyeNum = 0;
  eyeCount = true;
  eyeTimer = millis();
  eyeRandom = 0;
  eye = new PImage[5];
  eye[0] = loadImage ("eye.png");
  eye[1] = loadImage ("eye1.png");
  eye[2] = loadImage ("eye2.png");
  eye[3] = loadImage ("eye3.png");
  eye[4] = loadImage ("eye4.png");
  
  mouthNum = 0;
  mouthCount = true;
  mouth = new PImage[5];
  mouth[0] = loadImage("mouth4.png");
  mouth[1] = loadImage("mouth3.png");
  mouth[2] = loadImage("mouth2.png");
  mouth[3] = loadImage("mouth1.png");
  mouth[4] = loadImage("mouth.png");
    
  fase = loadImage ("face.png");
  rotFase = 1;
  
  body = loadImage("body.png");
  
  rightHand = loadImage("rightHand.png");
  leftHand = loadImage("leftHand.png");
  rotRigthHand = 0;
  rotLeftHand = 0;
  
  leftFoot = loadImage("leftFoot.png");
  rightFoot = loadImage("rightFoot.png");
  tail = loadImage("tail.png");
}
 
void draw() {
  
  //目の処理
  eyeAnimation();
  
  //口の処理
  mouthAnimation();
  
  background(255,205,147);
  
  //尻尾の処理
  tailAnimation();
  image(rightFoot,0,0,SCREEN_SIZE,SCREEN_SIZE);
  image(leftFoot,0,0,SCREEN_SIZE,SCREEN_SIZE);
  
  //体と手の処理
  bodyAnimation();
  
  //顔の処理
  faseAnimation();
}
 
//尻尾を動かす
void tailAnimation() {
  
  //座標軸変更
  translate(SCREEN_SIZE*0.43, SCREEN_SIZE*4/5);
  
  rotate(PI * (-rotFase*1.5 + 10) / 500);
  
  image(tail,SCREEN_SIZE*-0.43, SCREEN_SIZE*-4/5,SCREEN_SIZE,SCREEN_SIZE);
  
  //座標軸の初期化
  resetMatrix();
}
 
//体を動かす
void bodyAnimation() {
  
  //マウスのx座標で回転させるようにセット
  //これは仮設定です
  rotFase = (mouseX - SCREEN_SIZE/2)/25;
  
  //座標軸変更
  translate(SCREEN_SIZE*0.43, SCREEN_SIZE*9/10);
  
  //座標回転
  rotate(PI * rotFase / 600);
  
  //体の表示
  image(body,SCREEN_SIZE*-0.43, SCREEN_SIZE*-9/10,SCREEN_SIZE,SCREEN_SIZE);
  
  //腕の表示
  //※腕を動かすならアニメーションにした方が良さげという結論に至る
  image(rightHand,SCREEN_SIZE*-0.43, SCREEN_SIZE*-9/10,SCREEN_SIZE,SCREEN_SIZE);
  image(leftHand,SCREEN_SIZE*-0.43, SCREEN_SIZE*-9/10,SCREEN_SIZE,SCREEN_SIZE);
  
  
  //座標軸の初期化
  resetMatrix();
}
 
//頭を動かす
void faseAnimation() {
  
  //座標を移動させる
  translate(SCREEN_SIZE*0.43, SCREEN_SIZE*3/5);
  
  //座標回転
  rotate(PI * rotFase / 100);
  
  //顔、目、口の表示
  image(fase,SCREEN_SIZE*-0.43+rotFase*2*SCREEN_SIZE/500,SCREEN_SIZE*-3/5,SCREEN_SIZE,SCREEN_SIZE);
  image(eye[eyeNum],SCREEN_SIZE*-0.43+rotFase*2*SCREEN_SIZE/500,SCREEN_SIZE*-3/5,SCREEN_SIZE,SCREEN_SIZE);
  image(mouth[mouthNum],SCREEN_SIZE*-0.43+rotFase*2*SCREEN_SIZE/500,SCREEN_SIZE*-3/5,SCREEN_SIZE,SCREEN_SIZE);
  
  //座標軸の初期化
  resetMatrix();
}
 
//口のアニメーション
void mouthAnimation() {
 
  
  //マイクからの音声入力で反応する
  if(amp.analyze() * 1000 > 10)
  {
    mouthTime = true;
  }
  
  //口パク実行
  if(mouthTime) {
    
    //口を開ける
    if(mouthCount && mouthNum < mouth.length){
      mouthNum++;
    }
  
    //口を閉じる
    if(!mouthCount && mouthNum > 0){
      mouthNum--;
    
      //口パク終了
      if(mouthNum == 0) {
        mouthTime = false;
        mouthCount = true;
      }
    }
  
    //口が完全に開いた
    if(mouthNum == mouth.length-1){
      mouthCount = false; 
    }
  }
}
 
//目のアニメーション
void eyeAnimation() {
  
  //瞬きする時間間隔判定
  if((millis() - eyeTimer)/1000  > eyeRandom)
  {
    eyeTime = true;
  }
  
  //瞬き実行
  if(eyeTime) {
    
    //目を閉じる
    if(eyeCount && eyeNum < eye.length){
      eyeNum++;
    }
  
    //目を開ける
    if(!eyeCount && eyeNum > 0){
      eyeNum--;
    
      //瞬き終了
      if(eyeNum == 0) {
        eyeTime = false;
        eyeCount = true;
        eyeTimer = millis();
        eyeRandom = int(random(21)) + 10;
      }
    }
  
    //目が完全に閉じた
    if(eyeNum == eye.length-1){
      eyeCount = false; 
    }
  }
}
