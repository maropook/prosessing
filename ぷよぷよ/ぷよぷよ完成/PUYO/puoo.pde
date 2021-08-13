int numPuyo=100;

public void settings() {
  size(192, 435, "processing.opengl.PGraphics2D");
}
Puyo[] puyo=new Puyo[numPuyo];
int[][]puyoo={
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, //[0][4]
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, 
  {0, 0, 0, 0, 0, 0}, //11
  {0, 0, 0, 0, 0, 0}, //12
  { 10, 10, 10, 10, 10, 10}, //13
  {10, 10, 10, 10, 10, 10}};


int bum;
int score=0;
int sc=0;
void setup() {
  //size(192, 435, P2D);
  background(0);
  for (int i=0; i<puyo.length; i++) {
    puyo[i] =new Puyo( 16, 32+16, 2, 2, 0, 0);//object making
  }
}

int i=0;
int nowpuyonum=0;
void draw() { 
  background(0);





  stroke(255, 50, 0);
  strokeWeight(7);
  line(70, 75, 90, 95);
  line(70, 95, 90, 75);
  strokeWeight(8);
  stroke(200, 200, 0);
  line(1, 60, 191, 60);
  line(0, 60, 0, 448-14);
  line(0, 448-14, 191, 448-14);
  line(191, 60, 191, 448-14);
  fill(255);


  for (int i=0; i<puyo.length; i++) {
 
    strokeWeight(1);
    stroke(0);
    puyo[i].display();
  }


  fill(0);
  rect(0, 0, 192-32, 32*2-9);
  fill(255);
  textSize(30);
  text("PUYOPUYO", 3, 45);
  textSize(14);
  text("number"+nowpuyonum, 10, 15);
  text("next", 158, 15);



  if (puyo[nowpuyonum].isSTOP==true) {
    puyo[nowpuyonum].check();

    nowpuyonum++;
  }
  puyo[nowpuyonum].move();
}

void keyPressed() {

  for (int i=0; i<puyo.length; i++) 

    if (puyo[i].y>65)
      puyo[i].keya();
}
