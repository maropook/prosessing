
int numPuyo=100;

public void settings() {
  size(192, 435, P2D);
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
class Puyo {
  int x, xx, y, yy, R, r, aa, aaa, point, 
    cou, count, colorr, colorrr, coo;
  boolean isSTOP=false;

  Puyo( int yp, int yyp, 
    int aa, int aaa, int cou, int count) {//16,32+16,16,0,2,2)

    y=yp;
    yy=yyp;
    this.aaa=aaa;
    this.aa=aa;
    this.cou=cou;
    this.count=count;
    colorr=int(random(0, 3));
    colorrr=int (random(0, 3));
    R=32;
    r=16;
  }
  void check() {

    puyoo[yy/R-1][(xx)/R]=1;
    puyoo[y/R-1][(x)/R]=1;

  }

  void move() {


    x=aaa*R+r+cou;
    xx=aa*R+r;//ziku sita midori


    if (y<81) {
      y++;
      yy++;
    }
    if (y>80) { 

      if ( puyoo[yy/R][(xx)/R]<1) {

        yy++; 
        if (keyCode==DOWN) {

          yy=yy+3;
        }
      }


      if (puyoo[y/R][(x)/R]<1) {
        y++;//kiiro munou

        if (keyCode==DOWN) {
          y=y+3;
        }
      }
    }
  }




  void display() {


    int max=200;
    int a=1;
    int b=1;
    int c=1;
    int dd=1;
    int e=1;
    int f=1;

    if (colorrr==0) {

      dd=0;
    }

    if (colorrr==1)

      e=0;

    if (colorrr==2)

      f=0;


    if (colorr==0) {
      a=0;
    }

    if (colorr==1)
      b=0;


    if (colorr==2)
      c=0;


    int d=R-1;
    if (puyoo[2][2]>0) {
      fill(250, 90, 20);
      rect(0, 0, 500, 5000);
      fill(0);
      textSize(26);
      text("GAME OVER", 20, 200);
    }




    if (y>d) {
      if ( ((( puyoo[y/R][x/R]>=1) &&((count==2)||(count==3)))||

        (((puyoo[yy/R][xx/R]>=1) )&&((count==4)||(count==0)))))


      {
        isSTOP=true;
      }


      if (d<y) {    
        if ( (( puyoo[yy/R][xx/R]>=1) &&(puyoo[y/R][(x)/R]>=1)))
          isSTOP=true;
      }
    }


    //if(colorr==3)



    fill(max*b, max*a, max*c);
    ellipse(176, 28, 20, 20);
    fill(max*dd, max*e, max*f);
    ellipse(176, 48, 20, 20);



    //fill(255);
    fill(max*b, max*a, max*c);
    ellipse(x, y, R, R-3);//ziku sita saki 


    fill(max*dd, max*e, max*f);
    ellipse(xx, yy, R, R-3);
  }





  void keya() {
    if ( puyoo[yy/R][xx/R]<1) {



      if (puyoo[y/R][x/R]<1) {



        switch(keyCode) {
        case RIGHT:
          if
            ((x<=width-R)&&(xx<width-R)) {
            aaa++;
            aa++;
          }

          break;

        case LEFT:
          if ((aaa>=1)&&(aa>=1)) {
            aa--;
            aaa--;
          }

          break;
        case UP:
          if ((xx>=R)&&(xx<=192-R)) {
            if (count<=4)count++;
            if (count==5)count=1;
            if (count==1) {

              cou=32;
              y=y+R;
            }
            if (count==2) {
              cou=0;
              y=y+R;
            }
            if (count==3) {

              cou=-32;

              y=y-R;
            }
            if (count==4) {
              cou=0;
              y=y-R;
            }
          }
          break;
        case DOWN:

          break;
        }
      }
    }
  }
}
