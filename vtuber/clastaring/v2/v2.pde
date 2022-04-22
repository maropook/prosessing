import processing.video.*;

Capture cap;

PImage img1;
void setup(){
    area = new float[2000];
  area_x = new float[2000];
  area_y = new float[2000];
  dis = new float[2000];
  map = new int[320][240];
  ce_x = 160;
  ce_y = 120;
  
  size(320, 240);
  frameRate(100);
  String[] cameras = Capture.list();
  for (i = 0; i < cameras.length; i++)
  {
    println(cameras[i]);
  }
  ///////////////////カメラ関係
  cap = new Capture(this, 320, 240);
  cap.start();
  loadPixels();
}

void draw()
{
  if (cap.available() == true)////読み込み成功
  {
    cap.read();          //カメラからの画像を読み込む

    img1 = (PImage)cap;
  }

  if (img1 != null)
  {
    image(img1, 500, 0);
    Clustering(img1);
  }
}
