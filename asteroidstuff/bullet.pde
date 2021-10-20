class Bullet extends GameObject {


  int timer; 

//  boolean badbullet;
  Bullet(
//  boolean badbullet
  ) {
    super(); 
 //   this.badbullet = badbullet; 

  
 
    
    timer = 60;
    lives = 1;
    loc = new PVector(myShip.loc.x, myShip.loc.y);
    vel = new PVector (myShip.direct.x, myShip.direct.y);
    vel.setMag(10);
    size = 6;
  }




  void show() {

    stroke(255);
    //  noFill();
    fill (255);
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
