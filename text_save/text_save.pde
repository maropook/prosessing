
import java.io.FileOutputStream;//prosessingからファイルに書き込めるようにするライブラリ
///右の白いボタンが押されたらランダムな数字がテキストファイルに書き込まれて，
//それを取得して点数順に並べて表示する
//起動してすぐはボタンを押しても反応しないかも,10秒くらい待ったほうがいいかも
//うまくいけば，ボタンを押したら「printlnで〇〇を書き込みました」って出てくる

String textScoreData[] = null;//スコアが書き込んであるtextファイルを一行づつ格納する
String  file;
void setup() {
  size(400, 800);
  String  initFile = dataPath("") + "\\test.txt"; //書き込むtextファイルの置いてあるところ
  file = initFile;
  textScoreData = loadStrings( file );//スコアが書き込んであるtextファイルをロードする

  if ( textScoreData == null ) {//textファイルロード失敗
    println( "\n"+file + " 読み込み失敗" );
    exit();
  }
  textScoreData=reverse(sort(textScoreData));//textファイルに書き込まれたスコアを大きい順に並び替える
}


void draw() {

  background(144);
  for ( int i = 0; i < textScoreData.length; i++ ) {
    fill(0);
    text( String.valueOf(i+1)+"位　"+  textScoreData[i], 20, 10 + i*20 );  //textファイルの行数ごとに画面に表示
  }
  fill(255);
  strokeWeight(3);
  rect(200, 10, 50, 20);//新しいscoreの数字をtextファイルに書き込む&読み込むボタン
}
