class Walker {
  int x,y;
  int amount = 5;
  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(0);
    ellipse ( x, y, 10, 10);
  }

  void step() {
    
    int choice = int(random(4));
    
    if (choice == 0) {
      x += amount;
    } else if (choice == 1) {
      x-= amount;
    } else if (choice == 2) {
      y+= amount;
    } else {
      y-= amount;
    }

    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
}
