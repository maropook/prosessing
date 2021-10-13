void mouseClicked() {
  //白いボタンをクリックすると、ここの処理が実行
  if (mouseX>=200 && mouseX<=250 && mouseY>=10 && mouseY<=20) {
    
    String score =str(int(random(2000, 10000)));
     println (score+"を書き込みました");
    textWrite( file, score + "\n") ;//scoreをテキストファイルに書き込む
    getData();//更新されたテキストファイルのデータを取得し反映させる
    
  }
}
void getData() {
  textScoreData = loadStrings( file );//スコアが書き込んであるtextファイルをロードする
  if ( textScoreData == null ) {
    println( "\n"+file + " 読み込み失敗" );
    exit();
  }
  textScoreData=  reverse(sort(textScoreData));//新しく取得したデータを大きい順に並び替える
}
