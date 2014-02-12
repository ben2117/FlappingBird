ArrayList<Pipe> pipes = new ArrayList<Pipe>();

Flapper flapper;
boolean flapping;
boolean playing;
int birdCount = 0;
int pipeCount = 0;
int score = 0;

Fractal fractal;

void setup() {
  size(800, 600);
  frameRate(60);
  
  flapper = new Flapper();
  pipes.add(new Pipe());
  flapping = false;
  playing = true;
  
  fractal = new Fractal();
  textSize(28);
  textAlign(CENTER);
  fill(255);
}

void draw() { 

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
  if (playing) {
    for(int i = 0; i < pipes.size(); i++){
      pipes.get(i).update();
      pipes.get(i).drawPipe();
      if (pipes.get(i).detectColision(flapper.xPos, flapper.yPos)) {
         playing = false; 
      }
      if(pipes.get(i).rect1[0] < -100){
         pipes.remove(i); 
         score++;
      }
      //print ("\npipePos = " + pipes.get(i).rect1[0]); 
    }
    if(pipeCount > 250){
      pipes.add(new Pipe());
      pipeCount = 0;
    }
    pipeCount++;
  }
  
  if (!playing) {
     textSize(64);
     text("Game Over", width/2, height/3); 
  }
  
  text("Score: "+score, width/2, height/1.1); 

}

// input
void keyReleased() {
   flapping = true; 
}
void mousePressed() {
   flapping = true; 
}
