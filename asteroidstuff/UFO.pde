class UFO extends GameObject {

  PVector direct;
  int timer, stopt, twicetime, numbgen;
  int time; 

  UFO() {



    numbgen=(int)random(1, 4);
    loc = new PVector (-50, random(width));
    if (numbgen == 1) {
      loc = new PVector (random(800), -50);
    } else if (numbgen == 2) {
      loc = new PVector (800, random(600));
    } else if (numbgen == 3) {
      loc = new PVector (random(600), 800);
    }
    time = millis();

    vel = new PVector (random(1, 2), random(1, 2));
    direct = new PVector (myShip.loc.x - loc.x, myShip.loc.y-loc.y);
    direct.setMag(5);
    vel.rotate(random(0, TWO_PI));
    size = 40;
    lives = 1;
    timer = 0;
    stopt = 70;
    twicetime=0;
  }

  void show() {
    textSize(40);
    stroke (255, 209, 149);
    fill(#6100E3);
    ellipse (loc.x, loc.y, size, size);
  }


  void act() {
    super.act();
    
      if (mode == INTRO){
 lives = 0;
      }
    
    timer ++;
    twicetime++;

    if (dist(loc.x, loc.y, myShip.loc.x, myShip.loc.y) <=size/2 + myShip.size) {
      if (myShip.immune == false) {
        myShip.lives--;
        myShip.immune = true; 
        lives--;
      }
    }

 
    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        if (dist(loc.x, loc.y, obj.loc.x, obj.loc.y) <=size/2 +obj.size) {
          lives = 0;
          myShip.points++;
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

          obj.lives=0;
          twicetime = 0;
          twicetime++;
          myObjects.add(new UFO() );
        }
      }
      if (lives>0 && timer>stopt) {
   myObjects.add(new badbullet(loc.x,loc.y));
        timer = 0;
      }
      if (lives>0 && twicetime >= random(1000, 1500)) {
        myObjects.add(new UFO());
        lives = 0;
      }
      i++;



      if (mode == GAMEOVER) {
      
        stroke (0);
        fill(0);
      } else if (mode == GAME) {
         stroke (255, 209, 149);
    fill(#FF080C);
      }
    }

    if ((millis()-time)%2 == 5) {
    myObjects.add(new badbullet(loc.x,loc.y));
    }
  }
}
