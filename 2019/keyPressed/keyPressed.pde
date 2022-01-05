import ddf.minim.*;
Minim minim;
AudioPlayer player;



void setup(){
  size(600,600);
  img=loadImage("kaeru.png");
  img.resize(110,110);
  img1=loadImage("kaeru2.jpg");
  img1.resize(600,600);
  img2=loadImage("kaeru1.jpg");
  minim=new Minim(this);
  player=minim.loadFile("oto1.mp3");
  
}
int x=250;
int y=250,vy,vx;
PImage img,img1,img2;


void draw(){

image(img1,0,0);
x+=vx;
y+=vy;
//vy++;
//if(y>500)y=500;
image(img2,x,y);

}
void keyPressed(){
 if(keyCode==RIGHT)vx=10;
 if(keyCode==LEFT)vx=-10;
 if(keyCode==UP)vy=-10;
 if(keyCode==DOWN)vy=+10;
 if(keyCode==ENTER)
 player.rewind();
 player.play();
}
void keyReleased(){
  if(keyCode==RIGHT)vx=0;
 if(keyCode==LEFT)vx=0;
 if(keyCode==UP)vy=0;
 if(keyCode==DOWN)vy=0;

}
  
