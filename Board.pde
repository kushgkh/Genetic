class Board
{
  int[] state;
  float[] prediction;
  Drawer draw;
  
  Board()
  {
    draw = new Drawer();
    state = new int[9];
    prediction = new float[9];
    for(int i = 0 ; i < 9 ; i++)
    {
      state[i] = -1;
      prediction[i] = 0;
    }
    drawBoard();
  }
   
  
  void clear()
  {
    state = new int[9];
    for(int i = 0 ; i < 9 ; i++)
    {
      state[i] = -1;
    }
    drawBoard();
  }
  
  
  void scores(float[] arr)
  {
    prediction = arr;
  }
  
  void normalize(float[] arr, float min , float max)
  { 
    float range = max - min;
    for(int  i = 0 ; i < 9 ; i++)
    {
       if(arr[i] >= min)
         arr[i] = (arr[i] - min) / range;   
       else
         arr[i] = 0;
    }
  }
  
  boolean update(int sq , int val)
  {
    if(state[sq] != -1)
    {
      return false;
    }
    
      
    state[sq] = val; 
    draw.move(sq , val);
    return true;
  }
  
  void drawBoard()
  {
   
    background(255);
    
    draw.board();
    for(int i  = 0 ; i < 9 ; i++)
    {
      int x = i % 3;
      int y = i / 3;
      draw.drawBox(x,y,prediction[i]);
      draw.move(i , state[i]);
    }
    
  }
  
  
  int win()
  {
    
    for(int i = 0 ; i < 3; i++)
    {
      if(state[i * 3 + 0] == state[i * 3 + 1] && state[i * 3 + 0] == state[i * 3 + 2] && state[i * 3 + 0] != -1)
        return state[i * 3 + 0];   
    }
    
    for(int i = 0 ; i < 3; i++)
    {
      if(state[i] == state[3 + i] && state[i] == state[6 + i] && state[i] != -1)
        return state[i];   
    }
    
    if(state[0] == state[4] && state[0] == state[8] && state[0] != -1)
    {
      return state[0];

    }
    
    if(state[2] == state[4] && state[2] == state[6] && state[2] != -1)
    {
      return state[2];

    }
    
    int ret = 4;
    
    for(int i = 0 ; i < 9 ; i++)
     {
       if(state[i] == -1)
       {
         ret = -1;
       }
     }
    

    return ret;
  }
}
