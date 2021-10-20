class badbullet extends GameObject {
int timer;
PVector target;
  badbullet(float x, float y) {  
loc = new PVector (x,y);
vel = new PVector(myShip.loc.x- x,myShip.loc.y-y);
    vel.setMag(10);
    timer = 60;
    size = 6;
    lives= 1;



}

  
  void show() {
  
  
/*
        if (dist(loc.x, loc.y, myShip.loc.x, myShip.loc.y) <=size/2 + myShip.size) {
      if (myShip.immune == false) {
        myShip.lives --;
        myShip.immune = true; 
        lives--;
      }
        }
        */
    
    stroke(255);
 
   fill (#FA3290);ellipse(loc.x,loc.y,size,size);
  }

  void act() {
super.act();

timer--;
if (timer==0){
  lives = 0;
}

  }
  
}
