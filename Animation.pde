
class Animation {
  
  PShape flapping;
  PShape gliding;
  
  boolean flap;
  int count;
  
  Animation () {
    flapping = loadShape("birdFlap.svg");
    gliding = loadShape("birdGlide.svg");
    flap = false;
    count = 0;
  }
  
  void update () {
    
  }
  
  void drawAnimation (float posX, float posY) {
  
   if (flap) {
     shape ( flapping, posX, posY, 40,40 );
     if (count > 10) {
       count = 0;
       flap = false;
     }
   }
   if (!flap) {
     shape (gliding, posX, posY, 40,40 );  
     if (count > 10) {
       count = 0;
       flap = true;
     }
   }
   count ++;
  }
    
}
