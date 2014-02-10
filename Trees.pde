class Trees
{
 
  float trunkLength;
  float theta;
  
  float colour;
  float colourChange;
  boolean colourIncrease;
  
  int i;
  
  Trees () {
    trunkLength = 256;
    colourChange = 20;
    colourIncrease = true;
    
    i = 0;
    
  }
  
 void drawTrees () { 
   
   colour = 0;
   stroke(colour);
   strokeWeight (2);
   
   translate(width/2,height - 128);
   float trunkTop = random(-trunkLength/8, trunkLength/8);
   line(0,0,trunkTop,-trunkLength);
   translate(trunkTop,-trunkLength);
   branch(trunkLength, 0);
 } 
  
  void branch(float h, int branchCount) {
   // variables for tree
    h *= random( 0.4, 0.8);
    float angle = random(0, 80);
    theta = radians (angle);
     
    
    if (h > 2 && i > branchCount) {
      
      colour = (branchCount * colourChange);
      stroke(colour);
      
      pushMatrix();    
      rotate(theta);   
      line(0, 0, 0, -h);  
      translate(0, -h); 
      branch(h, branchCount++);  
      popMatrix();  
      
      // other branches
      colour = (branchCount * colourChange);
      stroke(colour);
      
      pushMatrix();
      rotate(-theta);
      line(0, 0, 0, -h);
      translate(0, -h);
      branch(h, branchCount++);
      popMatrix();
      
    }
  } 
  
  
}
