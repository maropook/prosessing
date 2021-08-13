

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
