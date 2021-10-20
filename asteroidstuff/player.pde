class Player extends Ship {
  
  
  int framecount;

  Player (int size, float positX, float positY, int lives) {
    loc = new PVector (positX, positY);
    myShip.immune = true;
    framecount = 0;
  }
void act() {
  super.act();
  
  if (myShip.immune = true){
  fill(#17B3FF);
  timer ++;
   if (framecount >= 100) {
    myShip.immune = false;
    framecount = 0;
    
    
   }
   else{
    fill (255);
     
     
  
   }
  }
}

     }
    
  
  
  
