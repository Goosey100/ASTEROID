void intro() {
  
  fill (255);
  
 myShip.loc = new PVector (width/2, height/2);
        myShip.direct = new PVector (0, -0.1);
 myShip.immune = true;
    myShip.lives = 3;
    myShip.points = 0;

    image (spacespace, 50, 100);
    spacespace.resize(1600, 1000);
    rectMode (CENTER);
    textSize( 80);
    textFont (font);
    text ( "Asteroid Game!", 120, 180);
    textFont (font1);
    text ("[Press ENTER to start!]", 140, 430);
}
