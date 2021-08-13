
int x=150;
float y=610;
float yy=590;
int xx=370;
int r=5;
int rr=5;
int xs=900;//my goal
int s=970;//you goal
int ss=8;//you speed
int sss=16;//my speed
PImage img1,img2,img3;
void setup(){
size(1000,1000);
background(155);
rectMode(CENTER);
imageMode(CENTER);
textAlign(CENTER);
textSize(50);
fill(255,0,0);
img1=loadImage("boom.png");
img2=loadImage("boat.jpg");





}

void draw(){
 background(255);
 image(img2,500,500,1000,1000);
 fill(255,0,0);
 strokeWeight(10);
 stroke(255,0,0);
 line(1000,600,800,780);
 stroke(255);
 strokeWeight(1);
  rr=xx/15;
  r=(x+270)/15;
  rect(x,y,r,r);
  fill(0,0,255);
  rect(xx,yy,rr,rr);
  if(x<xs){xx=xx+ss;yy=yy+0.1;}
  if(x>=xs){//rect(250,250,500,500);
  image(img1,xx,yy-50);fill(0);text("YOU WIN",250,250);}
if(xx>=s){image(img1,x,y-50);fill(0);text("YOU LOSE",250,250);}
}

void keyPressed(){
  if(xx<s){
  
  switch(keyCode){
    case RIGHT:x=x+sss;y=y+0.6;
    break;

  }}}
    
