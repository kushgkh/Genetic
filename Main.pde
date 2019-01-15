

public int mouseBox(int x , int y)
{
  
  int posx = 0;
  int posy = 0;
  
  if(x < 400)
    posx = 0;
  else if(x < 600)
    posx = 1;
  else
    posx = 2;
    
  if(y < 400)
    posy = 0;
  else if(y < 600)
    posy = 1;
  else
    posy = 2;

   return posx + 3 * posy;
}




Board myBoard;
AI p2;
Member m;
int turn = 0;
void setup() {
  
  size(1000,1000);
  
  myBoard = new Board();
  p2 = new AI(int(random(2)) ,myBoard );
 
  Genetic g = new Genetic();
  
  m = g.generate(100,20);
  myBoard.clear();
  
}



void draw() {
  frameRate(12);
 
  
  if(p2.value == turn)
  {
       
       int aiMove = m.move(myBoard);
       myBoard.scores(m.res);
       myBoard.update(aiMove , turn);
       myBoard.drawBoard();
       
       //myBoard.update(p2.move(myBoard.state) , turn);
       //p2.move(myBoard.state);

       int res = myBoard.win();
       if(res == 0)
       {
         println("The X Drawer wins!");
         exit();
       }
       else if(res == 1)
       {
         println("The O Drawer wins!");
          exit();
       }
       else if(res == 4)
       {
         println("Tie Game");
          exit();
       }
       turn = 1-turn;
    
  }
  else if (mousePressed == true) {
    if(myBoard.update( mouseBox(mouseX , mouseY) , turn))
    {
      
       int res = myBoard.win();
       if(res == 0)
       {
         println("The X Drawer wins!");
         exit();
       }
       else if(res == 1)
       {
         println("The O Drawer wins!");
          exit();
       }
       else if(res == 4)
       {
         println("Tie Game");
          exit();
       }       
       turn  = 1 - turn;
         
    }
  }
}
