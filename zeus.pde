import java.util.*;

Lightning bolt;



void setup() {
   size(500,700);
   frameRate(25);
   back(255);
   bolt= new Lightning((float)Math.random()*500,0,20,20,10);
}
int r = (int)Math.random()*80;
int i=0;
void draw() {
  back(50);
  if(i>=r){
    back(255);
    fill(255,255,255,10);
    rect(0,0,500,700);
    bolt= new Lightning((float)Math.random()*500,0,10,20,10);
    r+=(int)(Math.random()*30)+2;
  }
  i++;
}


class Lightning{
  float x,y,dx,dy;
  int ran;
  Lightning[] nextgen;
  boolean isnext =true;
  
  public float sigmoid(double in){
    return (float)((1/(1+Math.pow(2.718,-(in*0.25))))*3);
  }

  Lightning(float ix1, float iy1, float idx, float idy, int resolution){
    if(resolution-1!=0){
      x=ix1;
      y=iy1;
      dx=idx;
      dy=idy;
      float rdx=dx;
      float rdy=dy;
      ran = (int)(1+Math.random()*resolution/2);
      nextgen = new Lightning[ran];
      for(int i=0;i<ran;i++){

        float ndx=(float)(Math.random()*2*rdx)-dx;
        float ndy=(float)(Math.random()*Math.abs(ndx*rdy/5));
        rdx-=ndx;
        rdy-=ndy;
        nextgen[i] = new Lightning(x+dx,y+dy,ndx,ndy,resolution-1);
        strokeWeight((float)sigmoid(Math.sqrt(dx*dx+dy*dy)));
        nextgen[i].show();
        isnext=false;
        if(x+dx+ndx<350){
          isnext=true;
        }
        
      }
      if(resolution-1!=0){
         isnext=true;
      }
    }
    
  
  }
  
  void show(){
    stroke(255,255,0);
    line(x,y,x+dx,y+dy);

    

  
  
  }
  



}











public void back(int in){
  noStroke();
   fill(50,30,125,in); 
   rect(0,0,500,500);
   fill(155);
   stroke(155);
   for(int j=0;j<500;j+=10){
     //add random seed
      ellipse(500*cos(j),0,(sin(j*0.5)*0.1+cos(j+20))*100,(sin(j)*100)+cos(3*j)*50);
   }
   
   fill(0,50,0,in);
   noStroke();
   rect(0,500,500,200);


}
