//CONTROLS: P to pause, U to unpause. Arrow keys to move. Return button to begin game, return button to restart.

//NOTE: the losing code so that gameover flashes on the screen doesn't seem to be working; a bug occurs.


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
intro ();
  } else if (mode == GAME) {//====================
   
   game ();
  } else if (mode == PAUSE) {//=====================================================================
    pause();
  } else if (mode == GAMEOVER) {//============================================================================================
    gameover();
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
    }
  }else if (mode == GAME) {
      
      
    } else if (mode == PAUSE) {
      if (ukey == true) {
        mode = 0;
      }
  
    }
      }
  
