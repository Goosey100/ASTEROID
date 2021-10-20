class fire extends GameObject {
    int t; //transparency/opacity
    PVector nudge;
  public fire(PVector loc, PVector direct) {
   
    super.loc = new PVector(loc.x, loc.y); 
    vel = new PVector(direct.x, direct.y);
    t = 255; 
    vel.rotate(radians(180)+random(-0.5, 0.5)); 
    vel.setMag(5);
 
  }

  
   fire() {
     lives = 1;
     size = int(random(5,12));
     t    = int(random (200,255));
     loc = myShip.loc.copy();
     nudge = myShip.direct.copy();
     nudge.rotate(PI);
     nudge.setMag(30);
   loc.add(nudge);
     vel= myShip.direct.copy();
    vel.rotate(PI+random(-0,5)); //180
     vel.setMag(3);
   }
   
   void show() {
       noStroke();
     fill (118,224,255,t);
     square (loc.x,loc.y,size);
   }
   void act() {
     super.act();
     t = t - 15;
     if (t <= 0) lives = 0;
   }
  
  }
  
