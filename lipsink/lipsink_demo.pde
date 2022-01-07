
//// マイクの音を扱うためのライブラリをインポート
//import processing.sound.*;
//PImage[] data = new PImage[4];
//// マイク
//AudioIn in;
//// 音量を取得してくれるもの
//Amplitude amp;

//void setup() {
//  size(600, 600);

//  data[0] = loadImage("close.jpg");
//  data[1] = loadImage("half.jpg");
//  data[2] = loadImage("open.jpg");

//  strokeWeight(2);
//  fill(255, 200, 100);

//  // マイクを初期化（おまじない。現時点で深い意味は考えなくてOK）
//  in = new AudioIn(this);
//  in.start();

//  // 音量の取得を開始
//  amp = new Amplitude(this);
//  amp.input(in);
//}

//void draw() {
//  background(255);

//  // マイクの音量を取得して、
//  // 結果を変数 a に入れる
//  float a = amp.analyze();
//  // 音量の数値をコンソールに出力してみる

//  // 音量を円のサイズに反映して描く
//  float sz = a * 1000;


//  int on = int(sz);
//  println(on);
  
//  int openThreshold = 5;//これ以上で半口になる
//  int maxThereshold = 40;//これ以上で大口になる

//  if (on<openThreshold) {
//    image(data[0], 0, 0);
//  } else if (on<maxThereshold) {
//    image(data[1], 0, 0);
//  } else {
//    image(data[2], 0, 0);
//  }

//  //rect(100, 400, openThreshold *10, 50);
//  //rect(100, 400, maxThereshold *10, 50);
//  int barLeft = 100;
//  rect(barLeft , 400, sz*10, 50);

//line(barLeft  + openThreshold *10, 400, barLeft  + openThreshold *10, 450);
//line(barLeft  + maxThereshold *10, 400, barLeft  + maxThereshold *10, 450);


//  //ellipse(
//  //  width / 2, height / 2,
//  //  sz, sz
//  //  );
//}
