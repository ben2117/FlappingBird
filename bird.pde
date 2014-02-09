class Flapper {
  
  float position;
  float velocity;
  boolean alive;
  
  float frameTime;
  
  float gravity = 10;
  float fForce = -50;
  
  Flapper(){
    position = 360;
    velocity = 0;
    alive = true;
    frameTime = 0.03;
    
  }
  
  void updatePosition ( boolean flaping )
  {
    if(flaping){
       velocity += fForce;
    }
    else {
      //print("velocity " + velocity + "\n");
      velocity += 2;//gravity * frameTime;
    }
    position += velocity * frameTime;
    //print("position " +position + "\n"); 
  }
  
  void drawFlap(){
    pushMatrix();
    translate( 0, this.position);
    fill(200,140,140,200);
    ellipse(360,0,32,32); 
    popMatrix();
    //print (flapping + ("\n"));
  
  }
}
