void setup(){
  size(800,600);
  fill(0);
  
}
float x=10;
float y=10;
float dx=2;//speed x
float dy=4;//speed y
int count=0;
float py=50;
int count_death=0;


void draw(){
  
  if(x>width){dx=-2;}
  else if(x<0){dx=2;}
  
  if(y>height){dy=-4;}
  else if(y<0){dy=4;}
  x=x+dx;
  y=y+dy;
  fill(0);
  
  noStroke();
  background(192,192,255);
  ellipse(x,y,6,6);
rect(mouseX,550,py,6);//pad
textSize(30);
text(count,10,480);
text("death"+count_death,10,580);


if(y>=550)
{if(x>=mouseX && x<=mouseX+50)
{dy=-4;count++;}
else{count=0;
x=0;
y=0;
dx=2;
dy=4;
count_death++;
fill(255,0,0);
textSize(200);
text("death",200,300);
background(0);
}
if(count==10){py=25;}
if(count==0){py=75;}
if(count==5){py=50;}

}}
