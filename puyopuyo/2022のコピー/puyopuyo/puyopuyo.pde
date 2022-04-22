class User {
  Display display;
  PuyoField field;
  Puyo puyo;
  int flag = 1;
  int chainCount = 0;
  User(Display display, PuyoField field, Puyo puyo){
    this.display = display;
    this.field = field;
    this.puyo = puyo;
  }
  public void show(){
    display.showDisplay(field.state, field.next, field.nextnext);
  }
  public void controle(){
    field.state = puyo.move(field.state);
    field.state = puyo.turn(field.state);
    if(puyo.check)
    flag=3;
  }
  public void puyoFall(){
    field.state = field.puyoFall(field.state);
  }
  
  public boolean chain(){
    boolean check = false;
    for(int i = 1; i<=maxHeight; i++){
      for(int j = 1; j<=maxWidth; j++ ){
        if(field.state[i][j]>0){
          if(4 <= field.chainSearch(j,i,field.state[i][j]))
          check = true;
        }}}
        for(int i = 1;i<= maxHeight;i++){
          for(int j = 1; j<= maxHeight; 
