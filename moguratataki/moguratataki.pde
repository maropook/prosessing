PImage img;
int x=300,y=300;
void setup(){
  size(600,600);
  img=loadImage("boom.png");
  imageMode(CENTER);
}
void draw(){
  background(255);
  image(img,x,y);
}
void mousePressed(){
  if(dist(x,y,mouseX,mouseY)<50){
    x=(int)random(50,500);
    y=(int)random(50,500);
  }}
