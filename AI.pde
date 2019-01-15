class AI
{
     Board b;
    
     int value;
     int[] vals = new int[9];
     public AI(int val , Board board){
       value = val;
       b = board;
     }
      
      
     int move(int[] board)
     {
        int bestMove = -2;
        int bestScore = -1000000;
      
        for(int i = 0 ; i < 9; i++)
        {
          if(board[i] == -1)
          {
         
            board[i] = value;
            int sc = score(board , 1-value, 1024);
            
            
            if(sc > bestScore)
            {
              bestMove = i;
              bestScore = sc; 
            }
            vals[i] = sc;
            board[i] = -1;
            //println(i + " : " + sc);
          }
          else
            vals[i] = -1025;
            
        }
        
        if(bestMove == -2)
        {
          for(int  i = 0 ; i < 9; i++)
          {
            println(vals[i]);
          }
        }
        
        return bestMove; 
       
       
     }
     int score(int[] board , int turn , int lev)
     {
       
         int res =  b.win();
        
     //  println(board);
        if(res == 4)
          return 0;
        if(res == value)
          return lev;
        if(res == (1-value))
          return -lev;
        int bestScore = 0;
        if(turn == value)
        {
           
          
            bestScore = -1000000;
            
            for(int i = 0 ; i < 9; i++)
            {
              if(board[i] == -1)
              {
                board[i] = turn;
                int sc = score(board , 1-turn , lev/2);
    
                if(sc > bestScore)
                {
                  bestScore = sc; 
                }
                
                board[i] = -1;
              }
                
            }
          
        }
        
        else
        {
            bestScore = 1000000;
            
            for(int i = 0 ; i < 9; i++)
            {
              if(board[i] == -1)
              {
                board[i] = turn;
               
                int sc = score(board , 1-turn , lev/2);
    
                if(sc < bestScore)
                {
                  bestScore = sc; 
                }
                 //println(i + " : " + sc);
                board[i] = -1;
              }
                
            }
          
          
        }
        
        
        return bestScore; 
       
     }
  
}
