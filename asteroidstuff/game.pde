void game(){
  
   ukey = false;
   tkey = false;
    image(back[currentPic], 0, 0, 1700, 1500);
    currentPic++;
    if (currentPic>= 6) {
      currentPic=0;
    }

    // SPAWN MYOBJECT
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      myObj.show();
      myObj.act();

      //OBJECT REMOVAL==============================================
      if (myObj.lives == 0) {
        myObjects.remove(i);
      } else 
      i++;
    }


    int a = 0;
    //SHIP ARRAY STUFF=========================================================
    while (a < myPain.size()) {
      GameObject myP = myPain.get(a);
      myP.show();
      myP.act();
      if (myP.lives==0) {
      } else {
        a++;
      }
    }
    int life = 3;
    fill (255);
    // IF I HIT A CERTAIN POINT, GAME WILL END.
    if (myShip.points>= 3) {
      mode = GAMEOVER;
    }
    if (pkey == true) {// IF PKEY IS TRUE, GAME WILL PAUSE
      mode = PAUSE;
    }

    //RESETTING !! THIS IS FOR LOSING.
    if (myShip.lives<=0) {
      int e = 0;
      while (e < myObjects.size()) {
        GameObject myObj = myObjects.get(e);
        myObj.lives = 0;
        e++;
        myShip.vel = new PVector (0, 0);
        myShip.direct = new PVector (0, -0.1);
      }
      //RESETTING FOR WINNING
    } else if (myShip.points>=3 ) {
      int e = 0;
      while (e < myObjects.size()) {
        GameObject myObj = myObjects.get(e);
        myObj.lives = 0;
        e++;
        myShip.vel = new PVector (0, 0);
        myShip.direct = new PVector (0, -0.1);
      }
    }
  
  
}
