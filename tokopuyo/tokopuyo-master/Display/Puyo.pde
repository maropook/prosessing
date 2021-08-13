class Puyo {// puyo no system  class    ('puyo' ha sousa ga dekiru hutatu no kyuutai wo sasu)
  int[] keyPuyo= { maxHeight+1, 3, 0 }  , subPuyo = { maxHeight+2, 3, 0 }; //{ y, x, puyoColor}
  int cou=0;
  boolean check = false;
  int hasamattyomu=0;
  Puyo(int[] data) {
    keyPuyo[2] = data[0];
    subPuyo[2] = data[1];
  }

  
  public int[][] move(int[][] state) {
      if (keyPressed) {
        if (key=='a') {                                                                                         //hidari idou
          if (keyPuyo[0] == subPuyo[0]) {
            if (keyPuyo[1] > subPuyo[1]) {
              if( (state[subPuyo[0]][subPuyo[1]-1]==0) && (subPuyo[1]-1 >= 1)) {
                state[keyPuyo[0]][keyPuyo[1]] = 0;
                keyPuyo[1] -= 1;
                subPuyo[1] -= 1;
              }
            }else if (keyPuyo[1]< subPuyo[1]) {
              if( (state[keyPuyo[0]][keyPuyo[1]-1]==0) && (keyPuyo[1]-1 >= 1) ){
                state[subPuyo[0]][subPuyo[1]] = 0;
                keyPuyo[1] -= 1;
                subPuyo[1] -= 1;
              }
            }
          } else if (keyPuyo[1] == subPuyo[1]) {
            if ( ((keyPuyo[1]-1) >= 1) && (state[keyPuyo[0]][keyPuyo[1]-1] == 0) && (state[subPuyo[0]][subPuyo[1]-1] == 0) ) {//idousaki ni nanimo nakereba
              state[keyPuyo[0]][keyPuyo[1]] = 0;
              state[subPuyo[0]][subPuyo[1]] = 0;
              keyPuyo[1] -= 1;
              subPuyo[1] -= 1;
            }
          }
        }
        
        else if (key=='d') {                                                                                      //migi idou
          if (keyPuyo[0] == subPuyo[0]) {            //yoko ni hutatu naranndeiru toki
            if (keyPuyo[1] < subPuyo[1]) {           //keyPuyo ga hidarigawa no toki
              if( (state[subPuyo[0]][subPuyo[1]+1]==0) && (subPuyo[1]+1 <= maxWidth) ){                      // gamen nai no idou naraba
                state[keyPuyo[0]][keyPuyo[1]] = 0;   //genzaiti wo kirei ni site
                keyPuyo[1] += 1;                    //genzaiti wo idou
                subPuyo[1] += 1;
              }
            }else if (keyPuyo[1]> subPuyo[1]) {    //subPuyo ga hidarigawa no toki
              if( (state[keyPuyo[0]][keyPuyo[1]+1]==0) && (keyPuyo[1]+1 <= maxWidth) ){
                state[subPuyo[0]][subPuyo[1]] = 0;
                keyPuyo[1] += 1;
                subPuyo[1] += 1;
              }
            }
          } else if (keyPuyo[1] == subPuyo[1]) {
            if ( ((keyPuyo[1]+1) <= maxWidth) && (state[keyPuyo[0]][keyPuyo[1]+1] == 0) && (state[subPuyo[0]][subPuyo[1]+1] == 0) ) {//idousaki ni nanimo nakereba
              state[keyPuyo[0]][keyPuyo[1]] = 0;
              state[subPuyo[0]][subPuyo[1]] = 0;
              keyPuyo[1] += 1;
              subPuyo[1] += 1;
            }
          }
        }
        
       else if (key=='s') {            //sita idou
         if (keyPuyo[0] == subPuyo[0]) {
             if( (state[keyPuyo[0]-1][keyPuyo[1]] == 0) && (state[subPuyo[0]-1][subPuyo[1]] == 0) ){ //idousaki ni nanimo nai naraba
               state[keyPuyo[0]][keyPuyo[1]] = 0;   //ima iru basyo wo kirei ni site
               state[subPuyo[0]][subPuyo[1]] = 0;
               keyPuyo[0] -= 1;                     //genzaiti wo idou
               subPuyo[0] -= 1;
             }
             else{
               check = true; // sousa syuuryou
             }
         }else if(keyPuyo[0] > subPuyo[0]){
            if( (subPuyo[0]-1 >= 1) && (state[subPuyo[0]-1][subPuyo[1]] == 0) ){
               state[keyPuyo[0]][keyPuyo[1]] = 0;
               keyPuyo[0] -= 1;
               subPuyo[0] -= 1;
            }
            else{
              check = true; // sousa syuuryou
            }  
         }else if(keyPuyo[0] < subPuyo[0]){
           if( (keyPuyo[0]-1 >= 1) && (state[keyPuyo[0]-1][keyPuyo[1]] == 0) ){
             state[subPuyo[0]][subPuyo[1]] = 0;
             keyPuyo[0] -= 1;
             subPuyo[0] -= 1;
           }
           else{
             check = true; // sousa syuuryou
           }  
         }
       }//s
     }
     state[subPuyo[0]][subPuyo[1]] = subPuyo[2];
     state[keyPuyo[0]][keyPuyo[1]] = keyPuyo[2];
     return state;
  }
  
  public int[][] turn(int[][] state){
    if(keyPressed){
      if(key=='l'){                         // tokei mawari
        cou++;
        state[subPuyo[0]][subPuyo[1]]=0;
        cou = cou%4;
        
        if(cou==1){
          if(state[keyPuyo[0]][keyPuyo[1]+1]==0){
            subPuyo[0] = keyPuyo[0];
            subPuyo[1] = keyPuyo[1]+1;
          }
          else if( (state[keyPuyo[0]][keyPuyo[1]+1]!=0) && (state[keyPuyo[0]][keyPuyo[1]-1]!=0)){//ryougawa ni puyo ga attara
            hasamattyomu++;
            cou++;
            if(hasamattyomu%2 == 0){
              int temp;
              temp = subPuyo[0]; 
              subPuyo[0] = keyPuyo[0];//y jiku wo koukann
              keyPuyo[0] = temp;
              cou=2;
            }
          }
          else if(state[keyPuyo[0]][keyPuyo[1]+1]!=0){//idousaki ni puyoga attara
            state[keyPuyo[0]][keyPuyo[1]]=0;
            subPuyo[0] = keyPuyo[0];
            subPuyo[1] = keyPuyo[1];
            keyPuyo[1] = keyPuyo[1]-1;
          }
        }
        else if(cou==2){
          if(state[keyPuyo[0]-1][keyPuyo[1]]!=0){//idousaki ni puyoga attara
            if( (keyPuyo[0]+1) <= maxHeight+1 ){             //jougen wo koenaiyouni
              state[subPuyo[0]][subPuyo[1]]=0;
              subPuyo[0] = keyPuyo[0];
              subPuyo[1] = keyPuyo[1];
              keyPuyo[0] = keyPuyo[0]+1;
            }
          }
          else{
            subPuyo[0] = keyPuyo[0] -1; 
            subPuyo[1] = keyPuyo[1];
          }
        }
        else if(cou==3){
          if(state[keyPuyo[0]][keyPuyo[1]-1]==0){
            subPuyo[0] = keyPuyo[0];
            subPuyo[1] = keyPuyo[1]-1;
          }
          else if( (state[keyPuyo[0]][keyPuyo[1]+1]!=0) && (state[keyPuyo[0]][keyPuyo[1]-1]!=0)){//ryougawa ni puyo ga attara
            hasamattyomu++;
            cou--;
            if(hasamattyomu%2 == 0){
              int temp;
              temp = subPuyo[0]; 
              subPuyo[0] = keyPuyo[0];//y jiku wo koukann
              keyPuyo[0] = temp;
              cou=2;
            }
          }
          else if(state[keyPuyo[0]][keyPuyo[1]-1]!=0){//idousaki ni puyoga attara
            state[subPuyo[0]][subPuyo[1]]=0;
            subPuyo[0] = keyPuyo[0];
            subPuyo[1] = keyPuyo[1];
            keyPuyo[1] = keyPuyo[1]+1;
          }
        }
        else if(cou==0){
          subPuyo[0] = keyPuyo[0]+1;
          subPuyo[1] = keyPuyo[1];
        }
      }
    }
      if(key=='j'){                        //han tokei mawari
        state[subPuyo[0]][subPuyo[1]]=0;
        cou--;
        if(cou==-1){
          cou=3;    //reset
        }
        if(cou==1){
          if(state[keyPuyo[0]][keyPuyo[1]+1]==0){
            subPuyo[0] = keyPuyo[0];
            subPuyo[1] = keyPuyo[1]+1;
          }
          else if( (state[keyPuyo[0]][keyPuyo[1]+1]!=0) && (state[keyPuyo[0]][keyPuyo[1]-1]!=0)){//ryougawa ni puyo ga attara
            hasamattyomu++;
            cou++;
            if(hasamattyomu%2 == 0){
              int temp;
              temp = subPuyo[0]; 
              subPuyo[0] = keyPuyo[0];//y jiku wo koukann
              keyPuyo[0] = temp;
              cou=2;
            }
          }
          else if(state[keyPuyo[0]][keyPuyo[1]+1]!=0){//idousaki ni puyoga attara
            state[subPuyo[0]][subPuyo[1]]=0;
            subPuyo[0] = keyPuyo[0];
            subPuyo[1] = keyPuyo[1];
            keyPuyo[1] = keyPuyo[1]-1;
          }
        }
        else if( cou==2){
          if(state[keyPuyo[0]-1][keyPuyo[1]]!=0){//idousaki ni puyoga attara
            if( (keyPuyo[0]+1) <= maxHeight+1){
              state[subPuyo[0]][subPuyo[1]]=0;
              subPuyo[0] = keyPuyo[0];
              subPuyo[1] = keyPuyo[1];
              keyPuyo[0] = keyPuyo[0]+1;
            }
          }
          else{
            subPuyo[0] = keyPuyo[0] -1; 
            subPuyo[1] = keyPuyo[1];
          }
        }
        else if( cou==3){
          if(state[keyPuyo[0]][keyPuyo[1]-1]==0){
            subPuyo[0] = keyPuyo[0];
            subPuyo[1] = keyPuyo[1] -1;
          }
          else if( (state[keyPuyo[0]][keyPuyo[1]+1]!=0) && (state[keyPuyo[0]][keyPuyo[1]-1]!=0)){//ryougawa ni puyo ga attara
            hasamattyomu++;
            cou--;
            if(hasamattyomu%2 == 0){
              int temp;
              temp = subPuyo[0]; 
              subPuyo[0] = keyPuyo[0];//y jiku wo koukann
              keyPuyo[0] = temp;
              cou=2;
            }
          }
          else if(state[keyPuyo[0]][keyPuyo[1]-1]!=0){//idousaki ni puyoga attara
            state[subPuyo[0]][subPuyo[1]]=0;
            subPuyo[0] = keyPuyo[0];
            subPuyo[1] = keyPuyo[1];
            keyPuyo[1] = keyPuyo[1]+1;
          }
        }
        else if( cou==0){
          subPuyo[0] = keyPuyo[0]+1;
          subPuyo[1] = keyPuyo[1];
        }
      }
      state[subPuyo[0]][subPuyo[1]] = subPuyo[2];           //bannmenn ni kiroku
      state[keyPuyo[0]][keyPuyo[1]] = keyPuyo[2];           //bannmenn ni kiroku
      key=0;//key no syokika
    return state;
  }//turn
}
