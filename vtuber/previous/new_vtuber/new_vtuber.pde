import processing.sound.*;
import processing.video.*;

Capture cap;


//マイク
AudioIn in;
//音量を取得してくれるもの
Amplitude amp;


void draw() {

  //目の処理
  eyeAnimation();
  //口の処理
  mouthAnimation();
  //体の処理
  bodyAnimation();
  //頭の処理
  faceAnimation();

  background(224, 214, 255);

  /**/
  //その２からその３に行くまでに消えてたところ
  image(rightArm, 0, 0, 500, 500);
  image(leftArm, 0, 0, 500, 500);
  image(body, 0, 0, 500, 500);
  image(face, 0, 0, 500, 500);
  image(eye[eyeNum], 0, 0, 500, 500);
  image(mouth[mouthNum], 0, 0, 500, 500);
  image(hair, 0, 0, 500, 500);
  image(momiage, 0, 0, 500, 500);
  /* */

  if (cap.available() == true)////読み込み成功
  {
    cap.read();          //カメラからの画像を読み込む
    img1 = (PImage)cap;
  }

  if (img1 != null)
  {
    image(img1, 0, 0);
  }
}
