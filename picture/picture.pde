import processing.video.*;
Capture camera;
void setup(){
  
  
  size(640,480);
  camera=new Capture(this,width,height);
  camera.start();
}

int x,y;

void draw(){
image(camera,0,0);
stroke(255,255,0);
strokeWeight(10);
fill(0);
//ellipse(x,y,10,10);
//ellipse(mouseX-60,mouseY,10,10);
line(x,y,x-200,480);
line(x+100,y,x+300,480);


}
void captureEvent(Capture camera){
  
  camera.read();
}
void mousePressed(){
  
  x=mouseX;
  y=mouseY;
}
int s;
void keyPressed(){
  s++;
  
  
  save("1,png");
}
