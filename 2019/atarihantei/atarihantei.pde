import ddf.minim.*;
Minim minim;
AudioPlayer player;


void setup() {
  size(400, 400);
 
  img1=loadImage("1.jpg");
  img2=loadImage("2.jpg");
  img3=loadImage("3.jpg");
  imageMode(CENTER);
  minim=new Minim(this);
  player=minim.loadFile("1.mp3");
}
PImage img1, img2,img3;
int x=200,y=200;
void draw() {
   background(245);




  image(img1, x, y, 150, 100);



    if(dist(x, y, mouseX, mouseY)<40) {
      x=(int)random(50,350);
      y=(int)random(50,350);
      player.play() ;
      player.rewind();
      //image(img2, x, y, 150, 150);
    }
      
     //image(img3,mouseX,mouseY,60,60);
    }
  
