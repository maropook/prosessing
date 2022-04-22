

//体を動かす
void bodyAnimation() {
  rotFace = (mouseX - SCREEN_SIZE/2)/25;
  translate(SCREEN_SIZE*0.43, SCREEN_SIZE*9/10);
  rotate(PI * rotFace / 600);
  image(body, SCREEN_SIZE*-0.43, SCREEN_SIZE*-9/10, SCREEN_SIZE, SCREEN_SIZE);
  image(rightArm, SCREEN_SIZE*-0.43, SCREEN_SIZE*-9/10, SCREEN_SIZE, SCREEN_SIZE);
  image(leftArm, SCREEN_SIZE*-0.43, SCREEN_SIZE*-9/10, SCREEN_SIZE, SCREEN_SIZE);

  resetMatrix();
}

void faceAnimation() {
  translate(SCREEN_SIZE*0.43, SCREEN_SIZE*3/5);
  rotate(PI * rotFace / 100);
  image(face, SCREEN_SIZE*-0.43+rotFace*2*SCREEN_SIZE/500, SCREEN_SIZE*-3/5, SCREEN_SIZE, SCREEN_SIZE);
  image(eye[eyeNum], SCREEN_SIZE*-0.43+rotFace*2*SCREEN_SIZE/500, SCREEN_SIZE*-3/5, SCREEN_SIZE, SCREEN_SIZE);
  image(mouth[mouthNum], SCREEN_SIZE*-0.43+rotFace*2*SCREEN_SIZE/500, SCREEN_SIZE*-3/5, SCREEN_SIZE, SCREEN_SIZE);
  resetMatrix();
}


//口のアニメーション
void mouthAnimation() {


  //マイクからの音声入力で反応する
  if (amp.analyze() * 1000 > 10)
  {
    mouthTime = true;
  }

  //口パク実行
  if (mouthTime) {

    //口を開ける
    if (mouthCount && mouthNum < mouth.length) {
      mouthNum++;
    }

    //口を閉じる
    if (!mouthCount && mouthNum > 0) {
      mouthNum--;

      //口パク終了
      if (mouthNum == 0) {
        mouthTime = false;
        mouthCount = true;
      }
    }

    //口が完全に開いた
    if (mouthNum == mouth.length-1) {
      mouthCount = false;
    }
  }
}

//目のアニメーション
void eyeAnimation() {

  //瞬きする時間間隔判定
  if ((millis() - eyeTimer)/500  > eyeRandom)
  {
    eyeTime = true;
  }

  //瞬き実行
  if (eyeTime) {

    //目を閉じる
    if (eyeCount && eyeNum < eye.length) {
      eyeNum++;
    }

    //目を開ける
    if (!eyeCount && eyeNum > 0) {
      eyeNum--;

      //瞬き終了
      if (eyeNum == 0) {
        eyeTime = false;
        eyeCount = true;
        eyeTimer = millis();
        eyeRandom = int(random(21)) + 10;
      }
    }

    //目が完全に閉じた
    if (eyeNum == eye.length-1) {
      eyeCount = false;
    }
  }
}
