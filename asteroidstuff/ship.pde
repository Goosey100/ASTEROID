class Ship extends GameObject {


  //1. INSTANCE VARIABLES
  PVector direct;
  float shotTimer, threshold, timegone, timer;
  int teletimer;
  int randomshipx, randomshipy;
  boolean immune;

  int counter;
  int pointscreen;
  int telechecker;
  boolean lifechecker;
  boolean teleport;

  //2. CONSTRUCTOR(S)


  Ship() {

    immune = true;
    counter = 0;
    lives = 3;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    direct = new PVector(0, -0.2);
    shotTimer = 0;
    threshold = 60;
    points = 0;
    teleport = false;
    teletimer = 0;
    tkey= false;


    //    lifechecker=lives;
  }

  //3 BEHAVIOUR FUNCTIONS



  void act() {
    super.act();








    //immunity


    if (myShip.immune) {
      fill (#288BEA);
      counter++;
      if (counter >= 90) {
        myShip.immune = false;
        counter = 0;
      }
    } else {
      fill (255);
      int i = 0;
      while (i <myObjects.size() ) {
        GameObject myObj = myObjects.get(i);
        if (myObj instanceof badbullet) {
          if ( dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) < size/2 + myObj.size) {   

            myShip.lives--;
            myObj.lives--;
            immune = true;

            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
            myObjects.add(new particle(loc.x, loc.y));
          }
        }
        i++;
      }
    }






    shotTimer++;
    if (upkey) {
      vel.add(direct);
      myObjects.add(new fire());
      myObjects.add(new fire());
    }
    if (downkey) {

      vel.sub(direct);
    }
    if (leftkey) {

      direct.rotate(-radians(5) );
    }

    if (rightkey) {

      direct.rotate( radians(5) );
    } 
    if (spacekey && shotTimer >= threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;

      //      int i;
      //    i = 0;

      // size.add(new obj());


      shotTimer = 0;
    }
    // TELEPORTATION TIMER THING =====================================================================================

    teletimer++;

    int p=0;

    while (p <myObjects.size() ) {
      GameObject myObj = myObjects.get(p);
      if (myObj instanceof Asteroid) {

        do {
          randomshipx=(int) random (width);
          randomshipy= (int) random (height);
        } while ( dist (randomshipx, randomshipy, myShip.loc.x, myShip.loc.y)>=  myObj.size/2+ myShip.size+ 200);// ASTEROID COLLISION CHECK ========
      }
      p++;
    }



    if (tkey  &&  teletimer >= 800  ) {////// IF T KEY = TRUE AND TIMER COUNT IS READY TO DEPLOY, TELEPORTATION COMMENCE 
      immune = true;
      fill(#FF0004);
      loc = new PVector (randomshipx, randomshipy);
      teletimer = 0;
    } else if (teletimer>=0) {
      tkey = false;
      teletimer ++ ;
    } else {
    }

    if (teletimer >=800) {
      fill(#00FF68);
    } else if  (teletimer <= 0) {
      fill (#FF0022);
    }

    fill (#FF0022);

    if (teletimer >=800) {
      fill(#00FF68);
    } 
    circle (760, 30, 50);
//   text( randomshipx, 100, 500);



    if (myShip.lives <= 0) {
      mode = GAMEOVER;
    }
  }//=================================================

  void show() {



    //  text ("counter" + counter, 50, 200);
    //int i = 0;

    fill(255);
   // SCORE SHOWER:=====================================================================================================================
    text( "LIVES: " + myShip.lives, 80, 50);
    text( "SCORE " + points, 80, 100);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(direct.heading());
    stroke(255);
// IMMUNE TRUTH===============================================================================================================
    if ( myShip.immune == true) {
      fill (#288BEA);
    }
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();
  }
}
