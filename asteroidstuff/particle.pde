class particle extends GameObject {
float size;
int t;


 particle() {
   loc = myShip.loc.copy();
   vel = myShip.direct.copy();
   vel.rotate(random(TWO_PI));
vel.setMag(0.4);
size = (10);
lives = 1;
t = 255;
 }
     
     
particle (float x, float y) {
  loc = new PVector (x,y);
  vel= new PVector (1,0);
  vel.rotate (random(TWO_PI));
  vel.setMag(0.4);
  size = 10;
  lives = 1;
  t = 255;
}
   void show() {

fill(#F7A7A9,t);
noStroke();
t = t-3;
rect(loc.x,loc.y,size,size);
   }
   void act() {
     super.act();
 //if (offScreen()) lives = 0;
}
   }
