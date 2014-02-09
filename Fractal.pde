class Fractal
{
  
  
   
  void drawFractal (float x, float y, float radius, int r, int g, int b)
  {
    stroke (0);
    fill (r++,g++,b++,50);
    ellipse ( x, y, radius, radius);
    if (radius > 2) {
      radius *= 0.99f;
      drawFractal ( x - radius/2, y, radius/2,r,g,b);
      drawFractal ( x + radius/2, y, radius/2,r,g,b);
    }
  } 
   
  
}
