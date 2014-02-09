
ArrayList<Pipe> pipes = new ArrayList<Pipe>();

Flapper flapper;
boolean flapping;
int birdCount = 0;
int pipeCount = 0;
Walker w;

int r;
int g;
int b;


Fractal fractal;

void setup() {
  size(800, 600);
  
  flapper = new Flapper();
  pipes.add(new Pipe());
  w = new Walker();
  fractal = new Fractal();
  
  r=0;
  g=0;
  b=0;
}

void draw() {
  
  r+= 1;
  g+= 2;
  b+= 3;
  
  if (r == 255)
    r = 0;
  if (g == 255)
    g = 0;
  if (b == 255)
    b = 0;
  
  background(200);
  
  w.step();
  w.render();
 
  fractal.drawFractal(width/2,height/2, 500, r, g, b);
  
  flapper.updatePosition(flapping);
  flapper.drawFlap();
  
  for(int i = 0; i < pipes.size(); i++){
    pipes.get(i).update();
    pipes.get(i).drawPipe();
    if (pipes.get(i).detectColision(flapper.position, 360 + 16)) {
       print ("game over"); 
    }
  }
  
  
  
  if(birdCount > 1){
    flapping = false;
  }
  birdCount++;
  
  if(pipeCount > 200){
    pipes.add(new Pipe());
    pipeCount = 0;
  }
  pipeCount++;
}

void keyPressed () {
 
 if (key == 32) {
   birdCount = 0;
   flapping = true;
 }
  
}

