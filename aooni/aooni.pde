/*import ddf.minim.*;
 import ddf.minim.analysis.*;
 
 import ddf.minim.effects.*;
 import ddf.minim.signals.*;
 import ddf.minim.spi.*;
 import ddf.minim.ugens.*;
 Minim minim=new Minim(this);
 AudioPlayer player2;
 AudioPlayer player1;*/

PImage img1, img2, img3, img4, img11, 
  img12, img21, img22, img31, img32, img41, 
  img42, imgt1, imgao1, imgao2;
float player_x=200;
float player_y=350;

float aooni_x=400;
float aooni_y=400;

float player_speed=4;

int player_life=200;
int framerate=0;

int f=45;

float ss=3;//oni speed
float ff=1;
float titime, player_speedy, player_speedx;

float s=6;
void setup() {
  frameRate(60);
  //player1=minim.loadFile("aooni run.wav");
  //player2=minim.loadFile("remixoni.mp3");
  img1=loadImage("onimaee.png");
  img2=loadImage("onihidarii.png");
  img3=loadImage("onimigii.png");
  img4=loadImage("oniusiroo.png");
  img11=loadImage("onimae1.png");
  img12=loadImage("onimae2.png");
  imgt1=loadImage("takesi.png");
  img41=loadImage("oniusiroo1.png");
  img42=loadImage("oniusiro2.png");
  imgao1=loadImage("onikao.png");
  img21=loadImage("onihidari1.png");
  img22=loadImage("onihidari2.png");
  img31=loadImage("onimigi1.png");
  img32=loadImage("onimigi2.png");
  imgao2=loadImage("onikao1.png");

  size(600, 600);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
}

void draw() {
  if (framerate>120)framerate=0;
  player_x+=player_speedx;
  player_y+=player_speedy;
  //player1.play();
  //player2.play();
  frameRate(60);
  background(225);
  fill(255, 255, 0);
  image(imgt1, player_x, player_y);
  text("LIFE"+player_life, 510, 10);



  framerate++;


  fill(255, 0, 0);

  if (aooni_x>player_x) {
    aooni_x=aooni_x-ss;
    switch(framerate/30) {
    case 0:
      image(img2, aooni_x+5, aooni_y-15, 60, 180);
      break;
    case 1:
      image(img21, aooni_x+4, aooni_y-7, 70, 160);
      break;
    case 2:
      image(img2, aooni_x+5, aooni_y-15, 60, 180);
      break;
    default:
      image(img22, aooni_x, aooni_y-15, 70, 160);
      break;
    }
  }

  if (aooni_x<player_x) {
    aooni_x=aooni_x+ss;//image(img3,aooni_x-10,aooni_y,70,170); 
    switch(framerate/30) {
    case 0:
      image(img3, aooni_x-5, aooni_y, 80, 180);
      break;
    case 1:
      image(img31, aooni_x, aooni_y, 70, 160);
      break;
    case 2:
      image(img3, aooni_x-5, aooni_y, 80, 180);
      break;
    default:
      image(img32, aooni_x, aooni_y, 70, 160);
      break;
    }
  }

  if ((player_x-aooni_x<=ff)&&(player_x-aooni_x>=-ff)) {
    if (aooni_y>player_y) {
      aooni_y=aooni_y-ss;
      switch(framerate/30) {
      case 0:
        image(img4, aooni_x+3, aooni_y, 80, 180);
        image(imgao2, aooni_x+5, aooni_y-8, 100, 180);
        break;
      case 1:
        image(img41, aooni_x-3, aooni_y, 70, 160);
        image(imgao2, aooni_x+5, aooni_y-8, 100, 180);
        break;
      case 2:
        image(img4, aooni_x+3, aooni_y, 80, 180);
        image(imgao2, aooni_x+5, aooni_y-8, 100, 180);
        break;
      default:
        image(img42, aooni_x+3, aooni_y, 70, 170);
        image(imgao2, aooni_x+5, aooni_y-8, 100, 180);
        break;
      }
    }
  }

  if ((player_x-aooni_x<=ff)&&(player_x-aooni_x>=-ff)) {
    if (aooni_y<player_y) {
      aooni_y=aooni_y+ss;

      switch(framerate/30) {
      case 0:
        image(img1, aooni_x+5, aooni_y-15, 80, 200);
        image(imgao1, aooni_x+11, aooni_y+15, 113, 250);
        break;

      case 1:
        image(img11, aooni_x, aooni_y-15, 100, 200);
        image(imgao1, aooni_x+11, aooni_y+15, 113, 250);
        break;
      case 2:
        image(img1, aooni_x+5, aooni_y-15, 80, 200);
        image(imgao1, aooni_x+11, aooni_y+15, 113, 250);
        break;
      default:
        image(img12, aooni_x-3, aooni_y-15, 100, 200);
        image(imgao1, aooni_x+11, aooni_y+15, 113, 250);
        break;
      }
    }
  }

  fill(200, 0, 0, 100);
  if ((player_x-aooni_x<=f)&&(player_x-aooni_x>=-f))
  {
    if ((player_y-aooni_y<=f)&&(player_y-aooni_y>=-f

      )) {
      rect(300, 300, 600, 600);
      player_life--;
    }
  }//life down


  fill(0, 255, 0);
  if (player_life<=170)fill(255, player_life, 0);
  rect(570, 0, 30, player_life);//LIFE

  if (player_life<=0) {//gameover
    rect(300, 300, 600, 600);
    fill(0);
    background(0, 0, 255);
    fill(255);

    text("Continue?     ENTER", 540, 590);  
    text("GAME OVER", 300, 300);
    if (keyCode==ENTER) {
      player_life=400;
      aooni_x=player_x-190;
      aooni_y=player_y-90;
    }
  }//gameover


  while (player_y<=24)player_y++;
  while (player_y>=574)player_y--;
  while (player_x<=24)player_x++;
  while (player_x>=574)player_x--;
}

void keyPressed() {
  if ((player_y>24)&&(player_y<574)) {
    if ((player_x<574)&&(player_x>24)) {
      switch( keyCode ) {
      case UP:

        player_speedy=-player_speed;
        break;
      case  DOWN:


        player_speedy=player_speed;
        break;
      case LEFT:

        player_speedx=-player_speed;
        break;
      case RIGHT:

        player_speedx=player_speed;
        break;
      default:


        text("HELP!", player_x, player_y-50);
        println( keyCode );
        break;
      };
    };
  }
}


void keyReleased() {
  if (keyCode==RIGHT)player_speedx=0;
  if (keyCode==LEFT)player_speedx=0;
  if (keyCode==UP) player_speedy=0;
  if (keyCode==DOWN)player_speedy=0;
}
