class Flapper {
  
  float yPos;
  float xPos;
  float velocity;
  boolean alive;
  
  float frameTime;
  
  float gravity = 10;
  float fForce = -70;
  
  int i;
  
  Flapper(){
    yPos = height / 2;
    xPos = 150;
    velocity = 0;
    alive = true;
    frameTime = 0.1;  
  }
  
  void updatePosition ( boolean flaping )
  {
   
    if(flaping){
       velocity += fForce;
    }
    else {
      //print("velocity " + velocity + "\n");
      velocity += gravity * frameTime;
    }
    yPos += velocity * frameTime;
    //print("position " +position + "\n"); 
  }
  
  void drawFlap(){
    
    pushMatrix();
    translate( this.xPos, this.yPos);
    fill(255 ,255,255,240);
    ellipse(0,0,32,32); 
    popMatrix();
    //print (flapping + ("\n"));
  
  }
}
