void setup(){
  size(600,600);
  
}
int x=250;
int y=250,vy,vx;


void draw(){

background(255);
x+=vx;
y+=vy;
vy++;
if(y>500)y=500;
ellipse(x,y,30,30);

}
void keyPressed(){
 if(keyCode==RIGHT)vx=10;
 if(keyCode==LEFT)vx=-10;
 if(keyCode==UP)vy=-10;
 if(keyCode==DOWN)vy=+10;
}
void keyReleased(){
  if(keyCode==RIGHT)vx=0;
 if(keyCode==LEFT)vx=0;
 if(keyCode==UP)vy=0;
 if(keyCode==DOWN)vy=0;

}
  
