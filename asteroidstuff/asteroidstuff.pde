boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;
ArrayList<GameObject> myObjects;
ArrayList<GameObject> myPain;
int mode;
final int GAME = 0;
final  int PAUSE = 1;
final int GAMEOVER = 2;
final int INTRO = 3;
final int GAMEDEATH=4;

PImage [] back;
PImage [] win;
int currentPic = 0;
int curpic = 0;
String leadingZeroes = "0";
PFont font, font1;
PImage  spacespace;
boolean ukey, pkey, tkey;





void setup() {


  myShip = new Ship();

  myObjects = new ArrayList<GameObject>();
  myPain = new ArrayList<GameObject>();
  myPain.add(myShip);


  myObjects.add(new UFO());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());

  ukey = false;
  pkey = false;
  tkey = false;


  //space pics
  spacespace = loadImage("spacespace.jpg");

  font = createFont ("swag.TTF", 50);
  font1 = createFont ("swag.TTF", 25);

  frameRate (40);
  rectMode (CENTER);
  mode = INTRO;

  back = new PImage[6];
  win = new PImage [12];
  int index1 = 0;
  int index = 0;
  while (index1 < 6) {
    back [index1] = loadImage("back/frame_"+leadingZeroes + (index1) + "_delay-0.09s.gif");
    index1++;
  }

  while (index < 12) {
    if (index < 10) leadingZeroes = "0";
    else leadingZeroes = "";
    win [index] = loadImage("neon/frame_"+leadingZeroes + (index) + "_delay-0.07s.gif");
    index++;
  }






  size(800, 600);
  imageMode(CENTER);






  int lives;
  int score = 0;
}



void draw () {

  //SHIP FUNCTIONS===============================================================
  myShip.show();
  myShip.act();





//MODE FRAMEWORK
  if (mode == INTRO) {//================================
 
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
  } else if (mode == GAME) {//====================
    ukey = false;
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
           if (myShip.lives==0 && mode == GAMEOVER){
      int e = 0;
    while (e < myObjects.size()) {
      GameObject myObj = myObjects.get(e);
      myObj.lives = 0;
      e++;
      myShip.vel = new PVector (0,0);
      myShip.direct = new PVector (0,-0.1);
      
    }
    //RESETTING FOR WINNING
    } else if (myShip.points>=3 && mode == GAMEOVER) {
      int e = 0;
       while (e < myObjects.size()) {
      GameObject myObj = myObjects.get(e);
      myObj.lives = 0;
      e++;
      myShip.vel = new PVector (0,0);
      myShip.direct = new PVector (0,-0.1);
      
       }
    }}
    
   else if (mode == PAUSE) {//=====================================================================
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
  } else if (mode == GAMEOVER) {//============================================================================================

//IF SHIP IS 0 LIFE====================================================
      if (myShip.lives ==0) {
        spacespace.resize(1600, 1000); 
        image(spacespace, 50, 100);
        textFont(font);
        fill(255);
        text ("GAME OVER", 200, 200);
        textFont(font1);

        text("[Press Enter to try again!]", 140, 250);
        
        
      }  else if (myShip.points == 3) {// IF YOU WIN ============================


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
  }

  



void keyPressed() {
  if (keyCode == UP)        upkey = true;
  if (keyCode == DOWN)    downkey = true;
  if (keyCode == LEFT)   leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ' )       spacekey = true;
  if (key == 'u' || key == 'U') ukey = true;

  if (key == 't' || key == 'T') tkey = true;

  if (key == 'p' || key == 'P') pkey = true;
}
void keyReleased() {
  if (mode == GAME) {
    if (keyCode == UP) upkey = false;
    if (keyCode == DOWN) downkey = false;
    if (keyCode == LEFT) leftkey = false;
    if (keyCode == RIGHT) rightkey = false;
    if (keyCode == ' ') spacekey = false;
    if (key == 'u' || key == 'U') ukey = false;
    if (key == 'p' || key == 'P') pkey = false;
    if (key == 't' || key == 'T') tkey = false;
  } else if (mode == INTRO) {

    if (keyCode == ENTER) {
      mode = GAME;
    } else if (mode == GAME) {
      if (tkey == true) {
      }
      } else if (mode == PAUSE) {
        if (ukey == true) {
          mode = 0;
      
        }
        } 
      }
    }

  
