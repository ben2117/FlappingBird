
class Pipe{
  
  float[] rect1 = new float[4];
  float[] rect2 = new float[4];
  float speed;
  int pipeDist;
  float pipeHeight;
  
  Pipe(){
    speed = 1;
    pipeDist = 200;
    pipeHeight = random (0, height);
    
    this.rect1[0] = width/2;
    this.rect1[1] = 0;
    this.rect1[2] = 100;
    this.rect1[3] = pipeHeight - pipeDist;
    
    this.rect2[0] = width/2;
    this.rect2[1] = pipeHeight;  
    this.rect2[2] = 100;
    this.rect2[3] = height - pipeHeight;
  }
  
  void update(){
    rect1[0] -= speed;
    rect2[0] -= speed;
  }
  
  void drawPipe(){
    
    fill (240,0,200,150);
    pushMatrix();
    translate ( rect1[0], 0 );
    rect (rect1[0], rect1[1], rect1[2], rect1[3]);
    popMatrix();
    pushMatrix();
    translate ( rect2[0], 0 );
    rect (rect2[0], rect2[1], rect2[2], rect2[3]);
    popMatrix();
    
    
  }
  
  boolean detectColision(float flappyBird, float Width){
   if ( rect1[0] < Width && Width < rect1[0] + 100) {
       if( flappyBird <= pipeHeight - pipeDist){
         return true;
       }
       else return false;
   }
   if ( rect2[0] < Width && Width < rect2[0] + 100) {
       if ( flappyBird >= pipeHeight){
         return true;
       }
       else return false;  
   }
   else 
     return false;
    
  }
  
}

