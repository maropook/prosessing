
  
class Puyo {
  int x, xx, y, yy, R, r, aa, aaa, point, 
    cou, count;
  int[][] puyoo={
    {0,0,0,0,0,0},
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, //[0][5]
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, 
    {0, 0, 0, 0, 0, 0}, 
    //{0, 0, 0, 0, 0, 0}};
  { 1, 1, 1, 1, 1, 1}};
      //(16,16)(48 80 112 144 176 
      // x   y
      //  1      2  3 4    5    6
      //new Puyo[13]y    x[6];
      Puyo( int yp, int yyp, 
      int aa, int aaa, int cou, int count) {//,16,,32,16,0,2,2)

      y=yp;
      yy=yyp;
      this.aaa=aaa;
      this.aa=aa;
      this.cou=cou;
      this.count=count;

      R=32;
      r=16;
    }
    void check() {

      puyoo[yy/R][(xx)/R]=10;
      puyoo[y/R][(x)/R]=10;


      println(puyoo[yy/R][xx/R]);
    }


    void move() {


      x=aaa*R+r+cou;
      xx=aa*R+r;//ziku sita


 
        if ( puyoo[yy/R][(xx)/R]<1) {

          yy++;
          if (keyCode==DOWN) {

            yy=yy+2;
          }



          if (puyoo[y/R][(x)/R]<1) {
            y++;

            if (keyCode==DOWN) {
              y=y+2;
            }
          }
        
      }
    }




    void display() {
      
      fill(255);
       



      ellipse(x, y, R, R-3);//ziku
      
      ellipse(xx, yy, R, R-3);
    }





    void keya() {
      if ( puyoo[yy/R][x/R]<1) {



        if (puyoo[y/R][x/R]<1) {



         // if ((y<height-R)&&(yy<height-R)) {
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
