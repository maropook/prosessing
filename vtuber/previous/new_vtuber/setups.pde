
void setup() {


  PFont font = createFont("Meiryo", 50);
  textFont(font);
 frameRate(100);

//サイズ(500,500)に変更の可能性あり
  size(500,500);

  face = loadImage("face.PNG");
  rotFace = 1;

  mouth = new PImage[4];
  mouth[0] = loadImage("mouth0.PNG");
  mouth[1] = loadImage("mouth1.PNG");
  mouth[2] = loadImage("mouth2.PNG");
  mouth[3] = loadImage("mouth3.PNG");
  //mouth[4] = loadImage("mouth4.PNG");
  //mouth[5] = loadImage("mouth5.PNG");
  //mouth[6] = loadImage("mouth6.PNG");
  //mouth[7] = loadImage("mouth7.PNG");

  eye = new PImage[4];
  eye[0] = loadImage("eye0.PNG");
  eye[1] = loadImage("eye1.PNG");
  eye[2] = loadImage("eye2.PNG");
  eye[3] = loadImage("eye3.PNG");

  leftArm = loadImage("leftArm.PNG");
  rotLeftArm = 0;
  rightArm = loadImage("rightArm.PNG");
  rotRightArm = 0;

  body = loadImage("body.PNG");
  hair = loadImage("hair.PNG");
  momiage = loadImage("momiage.PNG");


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

  mouthNum = 0;
  mouthCount = true;
  
  //カメラ設定
  frameRate(100);
  String[] cameras = Capture.list();
 for (i = 0; i < cameras.length; i++)
 {
   println(cameras[i]);
 }
 ///////////////////カメラ関係
  cap = new Capture(this, 160,120);
  cap.start();
  loadPixels();
  
  //webカメラの色設定
  area = new float[2000];
  area_x = new float[2000];
  area_y = new float[2000];
  dis = new float[2000];
  map = new int[320][240]; 
  ce_x = 160;
  ce_y = 120;
 
}
