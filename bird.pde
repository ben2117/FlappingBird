class Flapper {
  
  float yPos;
  float xPos;
  float velocity;
  boolean alive;
  
  float gravity = 200;
  float fForce = -300;
  
  int i;
  
  Flapper(){
    yPos = height / 2;
    xPos = 150;
    velocity = 0;
    alive = true;
  }
  
  void updatePosition ( boolean flaping )
  {
   
    if(flaping){
       velocity += fForce;
    }
    else {
      //print("velocity " + velocity + "\n");
      velocity += gravity * (1 / frameRate);
    }
    yPos += velocity * (1 / frameRate);
    //print("position " +position + "\n"); 
  }
  
  void drawFlap(){
    
    pushMatrix();
    translate( this.xPos, this.yPos);
    //drawAnimation(xPos, yPos);
    popMatrix();
    //print (flapping + ("\n"));
  
  }
}
