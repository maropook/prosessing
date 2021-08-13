void setup()
{
size(400,800);
img=loadImage("3.png");
img.resize(120,120);
imageMode(CENTER);

}
PImage img;
float x=200,y=600,vx,vy,sy,sx,r;

void draw(){
background(10,200,110);
x+=vx;
y+=vy;
if(x>370||x<30)vx*=-1;
if(y>750||y<30)vy*=-1;

if(x>350)x=350;
if(x<0)x=0;
if(y>750)y=750;
if(y<0)y=0;
image(img,x,y);
vx*=0.99;
vy*=0.99;

}
void mousePressed(){
  sx=mouseX;
  sy=mouseY;
}
void mouseReleased(){
  vx=(sx-mouseX)/3;
  vy=(sy-mouseY)/3;}
