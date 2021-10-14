
class Tetromino{
  int shape[][] = new int[4][2];
  //colはcolorのこと
  //col = 0は背景色
  int col = 0;

  public Tetromino(){
    //ランダムに色を選ぶ
    col = int(random(1, 8));//1~7まで
      if(col == 1){
        shape[1][0] = 1;//水色の一本線
        shape[2][0] = -1;
        shape[3][0] = -2;
      }
      else if(col == 2){
        shape[1][0] = 1;//青の
        shape[2][0] = -1;
        shape[3][0] = -1;
        shape[3][1] = -1;
      }
      else if(col == 3){
        shape[1][0] = 1;
        shape[2][0] = -1;//オレンジ
        shape[3][0] = 1;
        shape[3][1] = -1;
      }
      else if(col == 4){
        shape[1][0] = 1;//黄色のしかく
        shape[2][1] = 1;
        shape[3][0] = 1;
        shape[3][1] = 1;
      }
      else if(col == 5){
        shape[1][0] = -1;//黄緑
        shape[2][1] = -1;
        shape[3][0] = 1;
        shape[3][1] = -1;
      }
      else if(col == 6){
        shape[1][0] = 1;//紫
        shape[2][0] = -1;
        shape[3][1] = -1;
      }
      else{
        shape[1][0] = 1;
        shape[2][1] = -1;
        shape[3][0] = -1;
        shape[3][1] = -1;//あか
      }
  }

  //左に90度回転
  public void rot(){
    for(int i = 0; i < 4; i++){
      int buff = shape[i][0];
      shape[i][0] = shape[i][1];
      shape[i][1] = -buff;
    }
  }
  public int getShapeX(int i){
    return shape[i][0];
  }
  public int getRotShapeX(int i){
    return shape[i][1];
  }
  public int getShapeY(int i){
    return shape[i][1];
  }
    public int getRotShapeY(int i){
    return -shape[i][0];
  }
  public int getMaxX(){
    int i = 0;
    for(int k = 0; k < 4; k++){
      if(shape[k][0] > shape[i][0]) i = k;
    }
    return shape[i][0];
  }
  public int getRotMaxX(){
    int i = 0;
    for(int k = 1; k < 4; k++){
      if(shape[k][1] > shape[i][1]) i = k;
    }
    return shape[i][1];
  }
  public int getMinX(){
    int i = 0;
    for(int k = 0; k < 4; k++){
      if(shape[k][0] < shape[i][0]) i = k;
      }
      return shape[i][0];
    }

  public int getRotMinX(){
    int i = 0;
    for(int k = 0; k < 4; k++){
      if(shape[k][1] < shape[i][1]) i = k;
      }
      return shape[i][1];
    }

  public int getMaxY(){
    int i = 0;
    for(int k = 0; k < 4; k++){
      if(shape[k][1] > shape[i][1]) i = k;
    }
    return shape[i][1];
  }
  public int getMinY(){
    int i = 0;
    for(int k = 0; k < 4; k++){
      if(shape[k][1] < shape[i][1]) i = k;
    }
    return shape[i][1];
  }

  public int getColor(){
    return col;
  }

}
