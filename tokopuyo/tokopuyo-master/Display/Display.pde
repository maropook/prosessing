class Display {// output class
  int x, y, nextX, nextY, nextnextX, nextnextY;
  Display(int x, int y, int nextX, int nextY, int nextnextX, int nextnextY) {
    this.x = x;
    this.y = y;
    this.nextX = nextX;
    this.nextY = nextY;
    this.nextnextX = nextnextX;
    this.nextnextY = nextnextY;
  }

  public void showDisplay(int[][] state, int[] next, int[] nextnext) {//gamen wo hyouji
    int i, j;
    //mainFlame
    stroke(0);
    line(x, y, x, y+650);
    line(x+300, y, x+300, y+650);
    line(x, y+650, x+300, y+650);

    //nextFlame
    line(nextX, nextY, nextX, nextY+90);
    line(nextX+50, nextY, nextX+50, nextY+100);
    line(nextX, nextY+100, nextX+50, nextY+100);

    //nextnextFlame
    line(nextnextX, nextnextY, nextnextX, nextnextY+100);
    line(nextnextX+50, nextnextY, nextnextX+50, nextnextY+100);
    line(nextnextX, nextnextY+100, nextnextX+50, nextnextY+100);
    
    //gameover mark
    stroke(100,0,0);
    line( x+50*2, y+50*1, x+50*3, y+50*2);
    line( x+50*2, y+50*2, x+50*3, y+50*1);
    
    //mainPuyo
    for (i=1; i<=maxHeight+1; i++) {
      for (j=1; j<=maxWidth; j++) {
        if (state[i][j] > 0)
          puyoDraw(x+50*(j-1), (y+600) - 50*(i-1), state[i][j]);
      }
    }

    //nextPuyo,nextnextPuyo
    for (i=0; i<2; i++) {
      puyoDraw(nextX, nextY-50*(i-1), next[i]);
      puyoDraw(nextnextX, nextnextY-50*(i-1), nextnext[i]);
    }

  }

  public void puyoDraw(int x, int y, int colors) {
    switch(colors) {
    case 1:
      fill(100, 0, 0);//red
      break;
    case 2:
      fill(0, 100, 0);//green
      break;
    case 3:
      fill(0, 0, 100);//blue
      break;
    case 4:
      fill(150, 150, 0);//yellow
      break;
    case 5:
      fill(100, 0, 100);//purple
      break;
    case -5:
      fill(0);
      break;
    case 0:
      fill(255);
      break;
    }
    ellipse(x, y, 50, 50);
  }
  
  public void gameOver(){
    textSize(20);
    text("game over",x+400,y+270);
    text("Retry: r ",x+400,y+300);
    text("Exit: e ",x+400,y+330);
  }
  
  public void numberOfChain(int num){
    if(num!=0){
      textSize(20);
      fill(0);
      text(num+"chain",x+400,y+340);
    }
  }
  
  public void showControleKey(){
    textSize(20);
    fill(0);
    text("right move: d",x+400,y+400);
    text("left move: a",x+400,y+440);
    text("down move: s",x+400,y+480);
    text("right-hand turn: l",x+400,y+520);
    text("left-hand turn: j",x+400,y+560);
  }
}//Display
