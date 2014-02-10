
class Pipe{
  
  float[] rect1 = new float[4];
  float[] rect2 = new float[4];
  float speed;
  int pipeDist;
  int pipeWidth;
  float pipeHeight;
  
  Pipe(){
    speed = 1.1;
    pipeDist = 200;
    pipeHeight = random (0, height - pipeDist);
    pipeWidth = 100;
    
    this.rect1[0] = width;
    this.rect1[1] = 0;
    this.rect1[2] = pipeWidth;
    this.rect1[3] = pipeHeight;
    
    this.rect2[0] = width;
    this.rect2[1] = pipeHeight + pipeDist;  
    this.rect2[2] = pipeWidth;
    this.rect2[3] = height - (pipeHeight - pipeDist);
  }
  
  void update(){
    rect1[0] -= speed;
    rect2[0] -= speed;
  }
  
  void drawPipe(){
    
    fill (0,0,0, 255 - (255 * ( rect1[0] / width)));
    //pushMatrix();
    //translate ( rect1[0], 0 );
    rect (rect1[0], rect1[1], rect1[2], rect1[3]);
    //popMatrix();
    //pushMatrix();
    //translate ( rect2[0], 0 );
    rect (rect2[0], rect2[1], rect2[2], rect2[3]);
    //popMatrix();
    
    
  }
  
  boolean detectColision(float xPos, float yPos){
   if ( rect1[0] < xPos && xPos < rect1[0] + pipeWidth) {
       if( yPos <= rect1[3]){
         return true;
       }
       if ( yPos >= rect2[1] ){
         return true;
       }
       else return false;
   }
   else return false;    
  }
}

