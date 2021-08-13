class User {//package class
  Display display;
  PuyoField field;
  Puyo      puyo;
  int flag=1;
  int chainCount=0;
  User(Display display, PuyoField field, Puyo puyo) {
    this.display = display;
    this.field = field;
    this.puyo  = puyo;
  }
  public void show() {//gamen hyouji
    display.showDisplay(field.state, field.next, field.nextnext);
  }
  public void controle(){
      field.state = puyo.move(field.state);// sita sayuu no idou
      field.state = puyo.turn(field.state);// kaiten syori
      if(puyo.check)                       //sousa ga owattara
        flag=3;
  }
  public void puyoFall(){
    field.state = field.puyoFall(field.state);
  }
  
  public boolean chain(){//rensa
    boolean check=false; // false: rensa nasi.   true: rensa ari
    for(int i=1; i<=maxHeight; i++){//gamen nai no subete ni tuite
      for(int j=1; j<=maxWidth; j++){
        if(field.state[i][j]>0){  //0 yori ue katu
          if( 4 <= field.chainSearch(j, i, field.state[i][j]))//kaeriti ga 4 ijou nara rensa dearu
              check = true;//rensa ari
        }
      }
    }
    for(int i=1; i<=maxHeight; i++){
      for(int j=1; j<=maxWidth; j++){
        if(field.state[i][j]<0){
          field.state[i][j] *= -1;//field.chainSearch de nakami ga 0ika ni narunode subete no naiyou wo moto no joutai he modosu
        }
      }
    }
    if(check)
      chainCount++;
    return check;
  }
  
  public void play(){
    switch(flag){
      case 1://gamen ni puyo wo hyouji
        chainCount=0;
        player.puyo = new Puyo(player.field.next);
        player.field.puyoPop();
        flag=2;
        background(255);
        break;
      
      case 2:
        if(keyPressed)
          player.controle();
          background(255);
        break;
      
      case 3: //rakka syori
        delay(300);
        player.puyoFall();
        flag=4;
        background(255);
        break;
        
      case 4://rensa syori
        if(player.chain()){
          delay(500);
          flag=3; //rensa ga tuduku nara rakka syori he
        }
        else{ 
          flag=1; //rensa ga owatara gamen ni puyo wo hyouji
          if(field.state[12][3]!=0){//gameOver hantei
            flag=5;
            chainCount=0;
          }
        }
        background(255);
        break;
        
      case 5://gameover
        display.gameOver();
        if(keyPressed){
          if(key=='r'){
            background(255);
            retry();
            flag=1;
          }
          else if(key=='e')
            exit();
        }
        break;
    }
    display.numberOfChain(chainCount);
    player.show();
    display.showControleKey();
  }
    
    public void retry(){
      for(int i=1; i<=maxHeight+1; i++){
        for(int j=1; j<=maxWidth; j++){
          field.state[i][j]=0;
        }
      }
      for (int i=0; i<500; i++)
        puyoLength[i] = (int)random(1, 4.9);//4 colors
      field.puyoCopy(puyoLength);
      field.firstNextpuyoSet();
      field.puyoPop();
    }
}
//player = ( 50, 75)
//enemy =  (550, 75)

int[] puyoLength = new int[500];
User player;
//User enemy;

int maxWidth=6;
int maxHeight=12; //hyouji suru gamen no size

void setup() {
  size(1000, 680);
  ellipseMode(CORNER);
  for (int i=0; i<500; i++)
    puyoLength[i] = (int)random(1, 4.9);//4 colors
  
  Display   pDis   = new Display(50, 10, 50+310, 10, 50+330, 10+100);
  PuyoField pField = new PuyoField();
  pField.puyoCopy(puyoLength);
  pField.firstNextpuyoSet();
  Puyo pFirst = new Puyo(pField.next);
  player = new User(pDis, pField, pFirst);
  player.show();
  
    
  player.field.puyoPop();
}
void draw() {
  player.play();
}

