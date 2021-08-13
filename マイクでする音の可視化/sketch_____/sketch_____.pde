import ddf.minim.*;
Minim minim;
AudioInput in;
int waveH=100;
void setup(){
  size(512,200);
  minim=new Minim(this);
  in=minim.getLineIn(Minim.STEREO,512);
}
void draw(){
  background(0);
  stroke(255);
  for(int i=0;i<in.bufferSize()-1;i++){
    point(i,50+in.left.get(i)*waveH);
    point(i,150+in.right.get(i)*waveH);
  }}
  
  void stop(){
    in.close();
    minim.stop();
    super.stop();
  }
