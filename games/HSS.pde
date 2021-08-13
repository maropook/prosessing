//void HSSclass(){
   void HSSkeyPre(){
   if(keyCode == UP){
     up = true;
   }
   if(keyCode == DOWN){
     down = true;
   }
   if(keyCode == RIGHT){
     right = true;
   }
   if(keyCode == LEFT){
     left = true;
   }
   if(key == ' '){
     space = true;
   }
   if(key == 'z'){
     X = true;
   }
 }
 
 void HSSkeyRele(){
   if(keyCode == UP){
     up = false;
   }
   if(keyCode == DOWN){
     down = false;
   }
   if(keyCode == RIGHT){
     right = false;
   }
   if(keyCode == LEFT){
     left = false;
   }
   if(key == ' '){
     space = false;
   }
   if(key == 'z'){
     X = false;
   }
 }
  class HBullet {
  float x, y, addX;
  HBullet(float _x, float _y, float _addX) {
    x = _x;
    y = _y;
    addX = _addX;
  }
  HBullet(float _x, float _y) {
    this(_x, _y, 0);
    x += addX;
  }
  void update() {
    x += addX;
    y -= 15;
  }
  boolean needbreak() {
    if (x<0||x>width||y<0||y>height) {
      return true;
    }
    for (int i = 0; i<e1.size(); i++) {
      if (dist(x, y, e1.get(i).x, e1.get(i).y)<e1.get(i).size/2) {
        broken(x, y);
        e1.get(i).hp--;
        return true;
      }
    }
    for (int i = 0; i<e2.size(); i++) {
      if (dist(x, y, e2.get(i).x, e2.get(i).y)<e2.get(i).size) {
        broken(x, y);
        P.power++;
        e2.get(i).hp--;
        return true;
      }
    }
    return false;
  }

  void drawing() {
    fill(100,200,255);
    rect(x, y, 5, 10);
    fill(255);
  }
}
class HBullet2 extends HBullet {
  float[] distans = new float[30];
  float a = 0.5,speed,addY,dx,dy,rad = 270;
  int num;
  boolean find;
  HBullet2(float _x, float _y) {
    super(_x, _y, 0);
    
    
    
  }
  void update(){
    for (int i = 0; i<e1.size(); i++) {
      distans[i] = dist(x, y, e1.get(i).x, e1.get(i).y);
    }
    for (int i = 0; i<e1.size(); i++) {
      float dist;
      for (int j = 0; j<e1.size(); j++) {
        dist = distans[i]-distans[j];
        if (dist>0) {
          break;
        } else if (j>=e1.size()-1) {
          num = i;
          find = true;
        }
      }
      print("    ");
      if(find){
        find = false;
        break;
      }
    }
    
    if(num<e1.size()){
    dx = e1.get(num).x-x;
    dy = e1.get(num).y-y;
    rad = atan(dy/dx);
    if(dx<0){
      rad+=PI;
    }
    }
    speed += a;
    addX = speed*cos(rad);
    addY = speed*sin(rad);
    x += addX;
    y += addY;
  }
  boolean needbreak(){
    if (x<0||x>width||y<0||y>height) {
      return true;
    }
    for (int i = 0; i<e1.size(); i++) {
      if (dist(x, y, e1.get(i).x, e1.get(i).y)<e1.get(i).size/2) {
        broken(x, y);
        e1.get(i).hp--;
        return true;
      }
    }
    return false;
  }
  void drawing(){
    fill(255,255,160,50);
    rect(x,y,40,40);
    noStroke();
    fill(255);
  }
}
class HE1bullet extends HBullet{
  float rad,addY,speed;
  HE1bullet(float _x,float _y,float _rad,float _speed){
    super(_x,_y,0);
    rad = _rad;
    speed = _speed;
    addX = speed*cos(radians(rad));
    addY = speed*sin(radians(rad));
  }
  
  void update(){
    x += addX;
    y += addY;
  }
  boolean needbreak(){
    if(x<0||x>width||y<0||y>height){
      return true;
    }
      if (dist(x,y, P.x, P.y)<20) {
        if(P.wait<-40){
        P.needbreak=true;
      }
        return true;
      }
      return false;
  }
  void drawing(){
    noFill();
    stroke(255);
    ellipse(x,y,15,15);
    fill(255);
    noStroke();
  }
}class Enemy{
  int hp;
  boolean needbreak = false;
  float x, y, addX, addY, size,rad;
  Enemy(float _x, float _y, float _size){
    x = _x;
    y = _y;
    size = _size;
  }
  Enemy(float _x, float _y){
    this(_x,_y,20);
  }

  void update() {
    if (hp <= 0||x<0||x>width||y<0||y>height) {
      needbreak = true;
    }
    x+=addX;
    y+=addY;
  }
  void drawing() {
    ellipse(x, y, size, size);
  }
}
class HEnemy1 extends Enemy {
  int frame = 0;
  int set;
  HEnemy1(float _x, float _y, float _size)
  {
    super(_x, _y, _size);
    addY = 0;
    hp = 5;
  }
  HEnemy1(int _set,float _x, float _y, float _size)
  {
    this(_x,_y,_size);
    addY = 0;
    hp = 5;
    set = _set;
  }

  void update()
  {
    if(hp<=0){
      P.power += 5;
      float ran;
      ran = random(0,5);
      if(int(ran) == 1){
        ob.add(new HObject(x,y));
      }
      //SE[4].rewind();
      //SE[4].play();
      needbreak = true;
    }
    if(x<0||x>width||y<0||y>height){
      needbreak = true;
    }
    frame++;
    super.update();
    if (frame<60) {
      addY+=0.05;
    } else if (frame<120) {
      addY-=0.05;
  }else if(frame>180){
          addY-=0.05;
        addX+=0.1*set;
        }
  if(frame == 181){
          e1bull(x,y,int(random(5,15)),5);
        }
      }
  void drawing() {
    fill(255,80,80);
    rect(x, y, size, size);
    fill(255);
  }
}
class HEnemy2 extends Enemy{
  float rage,rate,radX,radY,a,RAX,RAY,set,adrad = 0,speed;
  HEnemy2(int _set,float _x,float _y,float _speed,float _rage,float _rate,int _size,float _rad){
    super(_x,_y,_size);
    rad = _rad;
    speed = _speed;
    if(_set == 1){
      set = 180;
    }
    hp = 1;
    rate = _rate;
    rage = _rage;
    adrad = _rad;
    rad = 0;
  }
  HEnemy2(int _set,float _x,float _y,float _speed,float _rage,float _rate,float _rad){
    this(_set,_x,_y,_speed,_rage,_rate,15,_rad);
  }
  HEnemy2(int _set,float _x,float _y,float _rad){
    this(_set,_x,_y,3,5,10,15,_rad);
  }
  void update(){
    addX = speed*cos(radians(adrad));
    addY = speed*sin(radians(adrad));
    RAX = (rage+1)*cos(radians(adrad+(90)));
    RAY = (rage+1)*sin(radians(adrad+(90)));
    rad+=rate;
    adrad+=rate/10;
    a+=rate;
    if (hp<=0||x<0||x>700||y<-200||y>height) {
      needbreak = true;
    }
    if (dist(x,y, P.x, P.y)<20) {
      if(P.wait<-40){
        P.needbreak=true;
      }
        needbreak = true;
      }
    radX = RAX*cos(radians(rad+set));
    radY = RAY*cos(radians(rad+set));
    x += addX;
    y += addY;
    x += radX;
    y += radY;
    //x += 3;
    //y+= 3;
  }
  void drawing(){
    ellipse(x,y,size,size);
  }
}
class HGrain {
  float x, y, rad, addX, addY;
  int frame = 0,anicount;
  boolean needbreak = false;
  HGrain(float _x, float _y) {
    x = _x;
    y = _y;
    rad = random(0, TWO_PI);
    addX = random(1, 5)*cos(rad);
    addY = random(1, 5)*sin(rad);
    
  }
  void update() {
    frame++;
    if(x<0||x>width||y<0||y>height||frame>13){
      needbreak = true;
    }
    x+=addX;
    y+=addY;
  }
  void drawing() {
    ellipse(x, y, 5, 5);
  }
}
class HGrain2 extends HGrain{
  HGrain2(float _x,float _y,float _rad){
    super(_x,_y);
    rad = _rad;
    addX = 15*cos(radians(rad));
    addY = 15*sin(radians(rad));
  }
  
  void update(){
    super.update();
    needbreak = false;
  }
  void drawing(){
    if(frame%2 == 0){
      anicount++;}
      if(anicount%3 == 0){
        noStroke();
        fill(255);
      }
      else if(anicount%3 == 1){
        noFill();
        noStroke();
      }
      else{
        noFill();
        stroke(255);
      }
    
    ellipse(x,y,20,20);
    noStroke();
    strokeWeight(1);
    fill(255);
  }
}
class HObject{
  float x,y;
  boolean needbreak = false;
  HObject(float _x,float _y){
    x = _x;
    y = _y;
  }
  void update(){
    if(dist(x,y,P.x,P.y)<18){
      P.power+=100;
      needbreak = true;
    }
    if (x<0||x>width||y<0||y>height) {
      needbreak = true;
    }
    y++;
  }
  void drawing(){
    fill(70,70,255);
    stroke(255);
    textSize(20);
    rect(x,y,20,20,7);
    noStroke();
    fill(255);
    text("P",x-6,y+6);
  }
}
class HPlayer {
  boolean die = false, needbreak = false;
  int frame = 0, wait = 0, ver = 1,count = 0,power = 0,interval = 5;
  float x, y, add, RT = 0;
  HPlayer(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void deth() {
  }
  void update() {
    frame++;
    wait--;
    if(power<0){
      power = 0;
    }
    if(power>200){
      ver = 2;
    }
    if(power>1000){
      ver = 3;
    }
    if (up) {
      y -= 7;
    }
    if (down) {
      y+=7;
    }
    if (right) {
      x+=7;
    }
    if (left) {
      x-=7;
    }
    if(x<10){
      x = 10;
    }
    if(x>700){
      x = 700;
    }
    if(y<10){
      y = 10;
    }
    if(y>height-10){
      y = height-10;
    }
  }
  void drawing() {
    if (needbreak) {
      power -= 100;
      ver = 1;
      Pbroken();
      wait = 90;
      needbreak = false;
      Se[2].rewind();
      Se[2].play();
    } else if (wait <0) {
      if ((space||X)&&frame%interval == 0) {
        count++;
        Se[1].rewind();
        Se[1].play();
        if (ver>3) {
          ver = 3;
        }
        if (ver == 0) {
          bull.add(new HBullet(x, y, 0));
        }
        if (ver == 1) {
          bull.add(new HBullet(x-5, y, 0));
          bull.add(new HBullet(x+5, y, 0));
        }
        if (ver == 2) {
          bull.add(new HBullet(x, y, 0.5));
          bull.add(new HBullet(x, y, -0.5));
          bull.add(new HBullet(x, y, 2));
          bull.add(new HBullet(x, y, -2));
        }
        if (ver == 3) {
          bull.add(new HBullet(x-7, y, 0));
          bull.add(new HBullet(x+7, y, 0));
          bull.add(new HBullet(x, y, 1));
          bull.add(new HBullet(x, y, -1));
          bull.add(new HBullet(x, y, 2));
          bull.add(new HBullet(x, y, -2));
          if(count%5==0){
          bull2.add(new HBullet2(x+30,y));
          bull2.add(new HBullet2(x-30,y));
          }
        }
        if(ver == 4){
          interval = 2;
          bull.add(new HBullet(x-7, y, 0));
          bull.add(new HBullet(x+7, y, 0));
          bull.add(new HBullet(x, y, 1));
          bull.add(new HBullet(x, y, -1));
          bull.add(new HBullet(x, y, 2));
          bull.add(new HBullet(x, y, -2));
          if(count%5==0){
          bull2.add(new HBullet2(x+30,y));
          bull2.add(new HBullet2(x-30,y));
        }
        }
      }
      fill(255);
      triangle(x,y-12,x-10,y+6,x+10,y+6);
      fill(255,10,10);
      ellipse(x, y, 10, 10);
      fill(255);
      
    } else if (wait > 0&&wait<30) {
      RT += 5;
      fill(255);
      triangle(350,y-12-RT,350-10,y+6-RT,350+10,y+6-RT);
      fill(255,10,10);
      ellipse(350, height-RT, 10, 10);
      fill(255);
    } else {
      x = 350;
      y = height-RT;
      RT = 0;
    }
  }
}
class Spawn {
  int Enum, ev, maxnum, frame = 0;
  float x = 0, y = 0, addX = 0, addY = 0, size = 10, rage = 0, rate = 0, set = 1;
  float rad;
  Spawn() {
    
  }

  void e1spawn(int _ev, int _maxnum, float _x, float _y) {
    frame++;
    if (e1.size()<_maxnum) {
      if (frame%_ev == 0) {
        e1.add(new HEnemy1(int(random(-1, 2)), _x, _y, 20));
      }
    }
  }
  void e1spawn(int _ev, int _maxnum) {
    e1spawn(_ev, _maxnum, x, y);
  }
              //毎に、　　　長さ、　　　X　　　　　Y　　　　速さ、　　　　間隔、　　　　振れ幅、　　角速度。
  void e2spawn(int _ev, int _maxnum, float _x, float _y,float _speed,int _eachevery, float _rage, float _rate,float _rad) {
    frame++;
    if (frame%_ev == 0) {
      x = _x;
      y = _y;
      rad = _rad;
      rad = degrees(rad);
      rad -= 45;
    }
    if (frame%_ev<_maxnum) {
      if(frame%_eachevery == 0){
      e2.add(new HEnemy2(1, x, y,_speed, _rage, _rate, rad));
      e2.add(new HEnemy2(-1, x, y,_speed, _rage, _rate, rad));
      }
    }
  }
  void e2spawn(int _ev, int _maxnum, float _x, float _y,float _speed,int _eachevery, float _rage, float _rate) {
    frame++;
    if (frame%_ev == 0) {
      x = _x;
      y = _y;
      rad = int(random(45,135));
    }
    if (frame%_ev<_maxnum) {
      if(frame%_eachevery == 0){
      e2.add(new HEnemy2(1, x, y,_speed, _rage, _rate, rad));
      e2.add(new HEnemy2(-1, x, y,_speed, _rage, _rate, rad));
      }
    }
  }
  void e2spawn(int _ev, int _maxnum, float _x, float _y,float _speed,int _eachevery) {
    e2spawn(_ev, _maxnum, _x, _y,_speed,_eachevery, 1, 5);
  }
}
//}

//void HSSFanctions(){
  void MAIN(){
    rectMode(CENTER);
  noStroke();
  
 framecount++;
  if(framecount%60 == 0){
    time--;
    if(time<0){
      time = 0;
    }
  }
  translate(290,0);
  background(0);
  Frame();
  if(time>0){
    P.update();
  addenemy();
  UI();
  }else{int X = 335;
  FIL+=2;
    for(int i = 0;i < 400;i++){
      if (0<e1.size()) {
        broken(e1.get(0).x,e1.get(0).y);
          e1.remove(0);
        P.power++;
      }
      if (0<e2.size()) {
        broken(e2.get(0).x,e2.get(0).y);
          e2.remove(0);
          P.power++;
      }
    }
    if(P.power>9&&P.power<100){
      X = 320;
    }
    if(P.power>99&&P.power<1000){
      X = 305;
    }
    if(P.power>999&&P.power<10000){
      X = 285;
    }
    if(P.power>9999&&P.power<100000){
      X = 270;
    }
    fill(240,FIL);
    textSize(50);
    text(P.power,X,400);
    if(keyPressed&&FIL>255){
      HSS = false;
      SC = true;
      rectMode(CORNER);
    }
  }
  P.drawing();
    enemydraw(); 
}

void broken(float _x, float _y) {
  for (int i = 0; i<10; i++) {
    gra.add(new HGrain(_x,_y));
  }
}

void Pbroken(){
  gr2.add(new HGrain2(P.x,P.y,45));
  gr2.add(new HGrain2(P.x,P.y,135));
  gr2.add(new HGrain2(P.x,P.y,225));
  gr2.add(new HGrain2(P.x,P.y,315));
}

void e1bull(float x,float y,float num,float speed){
  float rate = 360/num;
  for(int i = 0;i<num;i++){
    e1bull.add(new HE1bullet(x,y,rate*i,speed));
  }
}

void addenemy(){
  if(P.ver == 1){
  spawn.e1spawn(90,5,random(20,700),0);
  spawn2.e2spawn(180,80,random(20,700),0,3,10,1.5,5);
    }
    if(P.power > 200&&P.power<=1000){
      spawn.e1spawn(60,7,random(20,700),0);
      spawn2.e2spawn(150,120,random(20,700),0,5,5,5,7);
    }
    if(P.power>1000&&P.power<3000){
      float X = random(20,700),radian = atan((P.y-0)/(P.x-X));
      if(P.x-X<0){
        radian+=PI;
      }
      spawn.e1spawn(30,12,random(20,700),0);
      spawn2.e2spawn(75,75,X,0,5,3,5,7,radian);
      X = random(20,700);
      spawn3.e2spawn(75,75,X,0,5,3,5,7,radian);
    }
    if(P.power>3000){
      float X = random(20,700),radian = atan((P.y-0)/(P.x-X));
      if(P.x-X<0){
        radian+=PI;
      }
      spawn.e1spawn(30,12,random(20,700),0);
      spawn2.e2spawn(75,75,X,0,5,2,5,7,radian);
      X = random(20,700);
      spawn3.e2spawn(75,75,X,0,3,2,5,7,radian);
      X = random(20,700);
      spawn4.e2spawn(75,75,X,0,7,2,3,8,radian);
    }
}

void enemydraw(){
 for (int i = 0; i<400; i++) {
    if(i<ob.size()){
      ob.get(i).update();
      ob.get(i).drawing();
      if(ob.get(i).needbreak){
        ob.remove(i);
      }
    }
    if(i<bull.size()){
      bull.get(i).update();
      bull.get(i).drawing();
      if (bull.get(i).needbreak()) {
        broken(bull.get(i).x,bull.get(i).y);
        bull.remove(i);
      }
    }
    if(i<bull2.size()){
      bull2.get(i).update();
      bull2.get(i).drawing();
      if (bull2.get(i).needbreak()) {
        bull2.remove(i);
      }
    }
    if(i<gra.size()){
    gra.get(i).update();
      gra.get(i).drawing();
      if(gra.get(i).needbreak){
        gra.remove(i);
      }
    }
    if(i<gr2.size()){
      gr2.get(i).update();
      gr2.get(i).drawing();
      if(gr2.get(i).needbreak){
        gr2.remove(i);
      }
    }
      if (i<e1.size()) {
        e1.get(i).update();
        e1.get(i).drawing();
        if (e1.get(i).needbreak) {
          e1.remove(i);
        }
      }
      if (i<e2.size()) {
        e2.get(i).update();
        e2.get(i).drawing();
        if (e2.get(i).needbreak) {
          e2.remove(i);
        }
      }
      if(i<e1bull.size()){
        e1bull.get(i).update();
        e1bull.get(i).drawing();
        if(e1bull.get(i).needbreak()){
          e1bull.remove(i);
        }
      }
    } 
}


void Frame(){
  fill(190);
  rect(-145,height/2,290,height);
  rect(850,height/2,290,height);
  
  noFill();
  stroke(150);
  strokeWeight(20);
  rect(width/2-291,height/2-1,width,height,20);
  stroke(240);
  strokeWeight(12);
  rect(width/2-291,height/2-1,width,height,20);
  noStroke();
  fill(255);
  strokeWeight(1);
}
void UI(){
  fill(50,100,255);
  textSize(30);
  text("POWER",730,50);
  text(P.power,850,50);
  fill(255);
  fill(0);
  text("TIME",730,700);
  text(time,850,700);
}
//}