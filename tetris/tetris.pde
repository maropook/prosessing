//２次元配列を用意する
//x:0~9, y:0~19
int Grid[][] = new int[10][20];

Tetromino current = new Tetromino();//クラスの宣言 currentという名前のTetrominoクラス
int initPosX = 4;
int initPosY = 0;

//buffer 記憶変数
int timeBuff = 0;
int fallSpeed = 40;

int score = 0;

int blockSize = 13;

void setup(){
  size(200, 375);

  //テキストのフォント設定
  textFont(createFont("Courier", 20));
  //テキストの表示位置設定
  textAlign(CENTER,CENTER);

  current = new Tetromino();//クラスの作成

  initPosX = 4;
  initPosY = 0;
}

void keyPressed(){
  if(keyCode == 37){//←のコード
    boolean stop = false;

    for(int i = 0; i < 4; i++){
      if((current.getShapeX(i) + initPosX) > 0){
        if((current.getShapeY(i) + initPosY) > 0 && current.getShapeY(i) + initPosY < 19){
          if(Grid[(current.getShapeX(i) + initPosX -1)][(current.getShapeY(i) + initPosY)] != 0){  //←方向のブロックに色がついてたら
            stop = true;
          }
        }
      }
      else stop = true;
    }
    //←方向に移動
    if(!stop) initPosX--;
  }

  //回転
  if(keyCode == 38){//↑のコード
    boolean rotFlag = false;
    boolean minFlag = false;
    boolean maxFlag = false;
    int count = 0;
    int countMin = 0;
    int countMax = 0;

      for(int i = 0; i < 4; i++){
        if(current.col != 4){
          if(((current.getShapeY(i) + initPosY)>0) && ((current.getShapeY(i) + initPosY) < 19)){  //上にはみ出していない時
            if(((current.getRotShapeX(i) + initPosX) >= 0) && ((current.getRotShapeX(i) + initPosX) < 10)){  //回転した時にはみ出していない時
              if(Grid[(current.getRotShapeX(i) + initPosX)][(current.getRotShapeY(i) + initPosY)] == 0 || Grid[(current.getRotShapeX(i) + initPosX)][(current.getRotShapeY(i) + initPosY)] == current.col){
                count++;
              }
            }
          }
          if((current.getRotShapeX(i) + initPosX) < 0) minFlag = true;
          if((current.getRotShapeX(i) + initPosX) > 9) maxFlag = true;
        }
      }

      if(minFlag == true){
        for(int i = 0; i < 4; i++){
        if(((current.getShapeY(i) + initPosY)>0) && ((current.getShapeY(i) + initPosY) < 19)){  //上にはみ出していない時
            if(Grid[(current.getRotShapeX(i) - current.getRotMinX())][(current.getRotShapeY(i) + initPosY)] == 0 || Grid[(current.getRotShapeX(i) - current.getRotMinX())][(current.getRotShapeY(i) + initPosY)] == current.col){
              countMin++;
            }
          }
        }
      }

      if(maxFlag == true){
        for(int i = 0; i < 4; i++){
        if(((current.getShapeY(i) + initPosY)>0) && ((current.getShapeY(i) + initPosY) < 19)){  //上にはみ出していない時
            if(Grid[(current.getRotShapeX(i) - current.getRotMaxX() + 9)][(current.getRotShapeY(i) + initPosY)] == 0 || Grid[(current.getRotShapeX(i) - current.getRotMaxX() + 9)][(current.getRotShapeY(i) + initPosY)] == current.col){
              countMax++;
            }
          }
        }
      }

      if(count >3) rotFlag = true;
      if(countMin >3) rotFlag = true;
      if(countMax >3) rotFlag = true;

    if(current.col != 4){//正方形のブロックは回転させない
      if(rotFlag == true){
        current.rot();
        //壁際で回転した時の処理
       if((current.getMinX() + initPosX) < 0) initPosX -= (current.getMinX() + initPosX);
       if((current.getMaxX() + initPosX) > 9) initPosX -= (current.getMaxX() + initPosX -9);
       if((current.getMinY() + initPosY) < 0) initPosY -= (current.getMinY() + initPosY);
       if((current.getMaxY() + initPosY) > 19) initPosY -= (current.getMaxY() + initPosY -19);
      }
    }
  }

  if(keyCode == 39){//→のコード
  boolean stop = false;

    for(int i = 0; i < 4; i++){
      if(current.getShapeX(i) + initPosX < 9){
        if((current.getShapeY(i) + initPosY) > 0 && current.getShapeY(i) + initPosY < 19){
          if(Grid[current.getShapeX(i) + initPosX +1][current.getShapeY(i) + initPosY] != 0){  //→方向のブロックに色がついてたら
            stop = true;
          }
        }
      }
      else stop = true;
    }  
      //→方向に移動
      if(!stop) initPosX++;
  }
  if(keyCode == 40){//↓のコード
    score++;
    initPosY++;
  }
}

void draw(){
  background(0);
  noStroke();
  for(int i = 0; i < 10; i++){
    for(int k = 0; k < 20; k++){
      if(Grid[i][k] == 0) fill(100);
      else if(Grid[i][k] == 1) fill(50, 150, 255);
      else if(Grid[i][k] == 2) fill(0, 0, 255);
      else if(Grid[i][k] == 3) fill(255, 150, 0);
      else if(Grid[i][k] == 4) fill(255, 255, 0);
      else if(Grid[i][k] == 5) fill(100, 255, 0);
      else if(Grid[i][k] == 6) fill(150, 0, 150);
      else fill(255, 0, 0);
      //15pxごとに13pxの正方形を描く
      rect(i * 15 + 25, k *15 + 25, blockSize,blockSize);
    }
  }

  //
  displayCurrent();

  timeBuff++;

  //何フレーム毎に落ちるか設定
  if(timeBuff > fallSpeed){
    timeBuff = 0;
    initPosY++;
  }

  verifyGrid();

  text("Score : " + score, width/2, 345);
}


//------------------------------------------------------------------------------
//ここから関数とクラス

void lost(){
  fill(0,150);
  rect(0, 0, width, height);
  fill(255);
  text("Score : " + score, 100, 345);
  noLoop();//これでプログラム終了にする
}

void verifyGrid(){
  boolean stop = false;

   //stopするかの判定
   for(int i = 0; i < 4; i++){
     if((current.getShapeY(i)+initPosY) <19){
       if(Grid[(current.getShapeX(i) + initPosX)][(current.getShapeY(i) + initPosY + 1)] != 0){ 
         stop = true;
       }
     }
      if(current.getShapeY(i) + initPosY == 19){
        stop = true;
      }
   }


   if(stop){
     //グリッドの色を塗り替えるか終了
     for(int i = 0; i < 4; i++){
       if((current.getShapeY(i)+initPosY) < 0){
         lost();
       }
       else Grid[(current.getShapeX(i) + initPosX)][(current.getShapeY(i) + initPosY)] = current.getColor();
     }

     int count = 0;

     //横一列に色がついていたら、ブロックを消す
     for(int y = 0; y < 20; y++){
       boolean destroy = true;

       for(int x = 0; x < 10; x++){
         if(Grid[x][y] == 0) destroy = false;
       }

       if(destroy){
         count++;
         for(int y2 = y-1; y2 > -1; y2--){
           for(int x = 0; x < 10; x++){
             Grid[x][y2+1] = Grid[x][y2];
           }
         }
       }
     }

     if(count > 0){
     if(count == 1) score += 40;
     else if(count == 2) score += 100;
     else if(count == 3) score += 300;
     else score += 1200;
   }

   //再設定
  current = new Tetromino();//クラスの作成
  //初期位置に戻す
  initPosX = 4;
  initPosY = 0;

    for(int i = 0; i < 4; i++){
      if(current.getShapeY(i) + initPosY < 19){
        if((current.getShapeY(i) + initPosY) > 0 && current.getShapeY(i) + initPosY < 19){
          if(Grid[current.getShapeX(i) + initPosX][current.getShapeY(i) + initPosY + 1] != 0){  //→方向のブロックに色がついてたら
            lost();
          }
        }
      }
   }

  }//ここまでif(stop)
}

void displayCurrent(){
  if(current.getColor() == 0) fill(100);
  else if(current.getColor() == 1) fill(50, 150, 255);
  else if(current.getColor() == 2) fill(0, 0, 255);
  else if(current.getColor() == 3) fill(255, 150, 0);
  else if(current.getColor() == 4) fill(255, 255, 0);
  else if(current.getColor() == 5) fill(100, 255, 0);
  else if(current.getColor() == 6) fill(150, 0, 150);
  else fill(255, 0, 0);

  for(int i = 0; i < 4; i++){
    rect((current.getShapeX(i) + initPosX)*15 + 25, (current.getShapeY(i) + initPosY)*15 + 25, blockSize, blockSize);
  }
}
