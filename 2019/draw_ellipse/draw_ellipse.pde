void setup(){ 
size(500,500); 
background(255); 
noStroke(); 
fill(255,0,0);} 
  
  
int x=0; 
int y=0; 
void draw(){ 
   ellipse(x,y,3,3); 
   x++;y++;if((x==500)||(y==500)) 
{x=0; y=0;background(255);} 
    
} 
 
 
