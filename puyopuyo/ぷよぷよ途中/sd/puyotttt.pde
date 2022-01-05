
public void settings() {
  size(192, 448);
}

int numPuyo=100;
Puyo[] puyo=new Puyo[numPuyo];
int i=0;

void setup() {
  
  background(0);
  for (int i=0; i<puyo.length; i++) {
    puyo[i] =new Puyo( 16, 32+16,4,4,0,0);//object making
  }
 
}

void draw() {
  
  background(0);
  fill(255,0,0,100);
  rect(0,0,192,32*2);
  
  fill(255);
  
  

  frameRate(10);
  for (int i=0; i<puyo.length;i++ ) {
  puyo[i].display();
//puyo[i].move(); 

   print("bbb"+i+"BB");
  for(int j=0;puyo[j].puyoo[puyo[j].y/32][(puyo[j].x)/32]>=1;j++){

     //puyo[j].display();
 puyo[j].move();
      print("wo"+j+"wooo");
    }
    
  }
  
  

 

    
    // puyo[i].check();
  

  
  }



void keyPressed() {

  for (int i=0
  ; i<puyo.length; i++) 

    puyo[i].keya();
    
  
}
