ArrayList<Pipe> pipes = new ArrayList<Pipe>();

Flapper flapper;
boolean flapping;
boolean playing;
int birdCount = 0;
int pipeCount = 0;

Fractal fractal;

void setup() {
  size(800, 600);
  frameRate(60);
  
  flapper = new Flapper();
  pipes.add(new Pipe());
  flapping = false;
  playing = true;
  
  fractal = new Fractal();
}

void draw() { 

  background(254,144,100);
  
  fractal.drawFractal(0,height/2, 700, 0, 0, 0);
  
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
      if(pipes.get(i).rect1[0] < -200){
         pipes.remove(i); 
      }
      //print ("\npipePos = " + pipes.get(i).rect1[0]); 
    }
    if(pipeCount > 300){
      pipes.add(new Pipe());
      pipeCount = 0;
    }
    pipeCount++;
  }
  
  if (!playing) {
     textSize(64);
     textAlign(CENTER);
     fill(255);
     text("Game Over", width/2, height/3); 
  }
  print ("\n");

}

// input
void keyReleased() {
   flapping = true; 
}
void mousePressed() {
   flapping = true; 
}
