ArrayList<Pipe> pipes = new ArrayList<Pipe>();

Flapper flapper;
boolean flapping;

float pipeTime = 0;
int score = 0;
Trees tree = new Trees();
Fractal fractal;

void setup() {
  size(800, 600);
  frameRate(60);
  
  flapper = new Flapper();
  pipes.add(new Pipe());
  flapping = false;
  
  fractal = new Fractal();
  textSize(28);
  textAlign(CENTER);
}

void draw() { 
  println(frameRate);
  int m = millis();
  background(254,144,100);
  
  fractal.drawFractal(0,height/2, 700, 0, 0, 0);
  //WHAT HAPPEND TO ALL THE PRETTY COLORS
  // for flapper
  if (flapping) {
    flapper.updatePosition(true);
    flapping = false;
  }
  else {
     flapper.updatePosition(false); 
  }  
  flapper.drawFlap();
  
  
  // for pipes
  if (flapper.alive) {
    for(int i = 0; i < pipes.size(); i++){
      pipes.get(i).update();
      pipes.get(i).drawPipe();
      if (pipes.get(i).detectColision(flapper.xPos, flapper.yPos)) {
         flapper.alive = false; 
      }
      if(pipes.get(i).rect1[0] < -100){
         pipes.remove(i); 
      }
      if (pipes.get(i).updateScore(flapper.xPos)) {
         score++; 
      }
      //print ("\npipePos = " + pipes.get(i).rect1[0]); 
    }
    if(m > 6000 + pipeTime){
      pipes.add(new Pipe());
      pipeTime = m;
    }
    
  }
  
  if (!flapper.alive) {
     textSize(64);
     text("Game Over", width/2, height/3); 
  }
  
  
  fill(255);
  text("Score: "+score, width/2, height/1.1); 

}

// input
void keyReleased() {
  if (flapper.alive) flapping = true; 
}
void mousePressed() {
   if (flapper.alive) flapping = true; 
}
