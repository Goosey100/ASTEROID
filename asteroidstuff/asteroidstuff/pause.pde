void pause(){


 
 pkey = false; 
    spacespace.resize(1600, 1000);
    image (spacespace, 50, 100);
    textFont( font);
    text ("PAUSE", 300, 300);
    textFont(font1);
    text ("[Press u to unpause]", 200, 350);


    if (ukey == true) {//PAUSE SWITCH BACK TO GAME
      mode = 0;

    }
}
