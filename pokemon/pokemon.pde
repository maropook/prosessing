void setup(){
  size(800,800);
  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
}
int r=200;//my pokemon size
int rr=200;//your pokemon size


void draw(){
background(255);
rect(600,200,r,r);//my pokemon
rect(170,600,rr,rr);//your pokemon
rect(400,200,50,100);
rect(390,600,50,100);
}
