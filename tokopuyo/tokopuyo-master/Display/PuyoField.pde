class PuyoField {// data controle class 
  int x, y, count=0;
 // int chainExist=0;
  int[] next = {0, 0} , nextnext = {0, 0};
  int[] puyoLengthCopy = new int[500];
  int[][] state = {{-5,-5,-5,-5,-5,-5,-5,-5},//gamen 
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5},
                   {-5,0, 0, 0, 0, 0, 0,-5}}; //kono gyou ha kaiten dekiru youni
  PuyoField() { }

  public void puyoCopy(int[] puyoLength) {
    for (int i=0; i<500; i++) {
      puyoLengthCopy[i] = puyoLength[i];
    }
  }

  public void firstNextpuyoSet() {// saisyo nomi tukau
    next[0] = puyoLengthCopy[count];
    next[1] = puyoLengthCopy[count+1];
    nextnext[0] = puyoLengthCopy[count+2];
    nextnext[1] = puyoLengthCopy[count+3];
    count = 4;
  }
  public void nextpuyoSet(){
    next[0] = nextnext[0];
    next[1] = nextnext[1];
    nextnext[0] = puyoLengthCopy[count];
    nextnext[1] = puyoLengthCopy[count+1];
    count += 2;
    if (count >= 500)
      count -= 499;    // puyoLength ga kowarenai youni
  }
  public void puyoPop() {//gamen jou ni puyo wo dasu
    state[maxHeight+1][3] = next[0];
    state[maxHeight+2][3] = next[1];
    nextpuyoSet();
  }
  public int[][] puyoFall(int[][] state){// rakka syori
    int i,j,temp=0, count=0;
    for(i=1; i <= maxWidth; i++){
      for(j=1; j <= maxHeight+1; j++){
        state[j-count][i] = state[j][i]; //tumeru
        if(state[j][i]==0){
          count++;
        }
        if(count!=0){
          state[j][i]=0;
        }
      }
      count=0;
    }
    return state;
  }
  public int chainSearch(int x, int y, int colors){//rensa wo sagasu
    int amount=0;
    if(colors==state[y][x]){
        state[y][x] *= -1;  //1kai mitara -1 wo kakeru
        amount++;

        if((state[y+1][x] > 0)&& (y+1<=maxHeight)) //0 yori ue no 4houkou ni tuite saiki yobidasi
          amount += chainSearch(x, y+1, colors);
        if(state[y-1][x] > 0)
          amount += chainSearch(x, y-1, colors);
        if(state[y][x+1] > 0)
          amount += chainSearch(x+1, y, colors);
        if(state[y][x-1] > 0)
          amount += chainSearch(x-1, y, colors);
        
        if(amount >= 4){//4tuijou onaji iro ga tonari atteitara 
            chainDelete(x,y,colors);//rensa wo kesite iku
        }
    }
    return amount;
  }
  
  public void chainDelete(int x, int y, int colors){// sagasita rensa wo kesiteiku
        state[y][x] = 0;  //1kai mitara -1 wo kakeru
        if( (colors== abs(state[y+1][x])) && (y+1 <= maxHeight))            //4houkou ni tuite onaji ironara saiki yobidasi 
          chainDelete(x,y+1,colors);
        if(colors== abs(state[y-1][x]))
          chainDelete(x,y-1,colors);
        if(colors== abs(state[y][x+1]))
          chainDelete(x+1,y,colors);
        if(colors== abs(state[y][x-1]))
          chainDelete(x-1,y,colors);
  }
}
