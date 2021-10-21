//1-2 Computer Science


class Asteroid extends GameObject {

  Asteroid() {
    lives = 1;
    loc = new PVector (random(0, width), random(0, height));
    vel = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI) );
    size = 100;
  }



  Asteroid(int s, float x, float y) {
    lives = 1;
    loc = new PVector (x, y);
    vel = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI) );
    size = s;
  }



  void show() {
    fill (#607465);
    stroke(255);
    ellipse(loc.x, loc.y, size, size);
  }
  void act() {

    super.act();




    if (loc.x < -30) loc.x = width +30;
    if (loc.x >width +30) loc.x = -30;
    if (loc.y <-30) loc.y = height+30;
    if (loc.y > height+ 30) loc.y = -30;

    if (dist(loc.x, loc.y, myShip.loc.x, myShip.loc.y) <=size/2 + myShip.size) {
      if (myShip.immune == false) {
        myShip.lives--;
        myShip.immune = true; 
        lives--;
      }
    }   

    int check = 20;
    int i = 0;
    while (i <myObjects.size() ) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if ( dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) < size/2 + myObj.size) {   
          myShip.points +=1;
          myObj.lives = 0;
          lives = 0;
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

          //duplication of asteroids
          if (size >= 30) {
            myObjects.add(new Asteroid(size/2, loc.x, loc.y));
            myObjects.add(new Asteroid(size/2, loc.x, loc.y));
          }
        }
      }



      i++;
    }
  }
}
