void gameover() {

  //IF YOU LOSE====================================================
  if (myShip.lives <= 0) {

    spacespace.resize(1600, 1000); 
    image(spacespace, 50, 100);
    textFont(font);
    fill(255);
    text ("GAME OVER", 200, 200);
    textFont(font1);

    text("[Press Enter to try again!]", 140, 250);

  
  } else if (myShip.points == 3) {// IF YOU WIN ============================

    spacespace.resize(1600, 1000); 

    textFont(font);
    fill (355);

    image(spacespace, 50, 100);

    image(win[curpic], 400, 400, 500, 200);

    curpic++;
    if (curpic>= 12) {
      curpic=0;
    }
    textFont(font);
    fill (255);


    text ("YOU WIN!", 200, 200);
    textFont(font1);

    text("[Press Enter to try again!]", 140, 250);
  }
  //IF PRESSED WILL CREATE NEW THINGS!!
  if (keyCode == ENTER) {

    myObjects.add(new UFO());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    mode = INTRO;
  }
}
