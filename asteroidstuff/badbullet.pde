class badbullet extends GameObject {
  int timer;
  PVector target;
  badbullet(float x, float y) {  
    loc = new PVector (x, y);
    vel = new PVector(myShip.loc.x- x, myShip.loc.y-y);
    vel.setMag(10);
    timer = 60;
    size = 10;
    lives= 1;
  }


  void show() {

    stroke(255);

    fill (#E80971);
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    super.act();

    timer--;
    if (timer==0) {
      lives = 0;
    }
  }
}
