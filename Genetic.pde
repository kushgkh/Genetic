class Genetic
{
    Board peep;
    float score(Member m)
    {
      Board b = new Board();
      AI first = new AI(0 , b);
      AI second = new AI(1 , b);
      
      
      float score = 0;

      int[] res = simulateGame(m ,first , b);
      
      score += res[1];
      if(res[0] != 4)
      {
          score += (res[0]- 0.5) * 10;
      }
      
      
      res = simulateGame(m ,second , b);
      
      score += res[1];
      if(res[0] != 4)
      {
          score += (-res[0] + 0.5) * 10;
      }
      
      return score + 9;         
    }
    
    int[] simulateGame(Member m, AI a , Board b)
    {
        b.clear();
        int turn = 0;
        int it = 0;
        while(b.win() == -1)
        {
          
            if(turn == a.value)
            {
              b.update(a.move(b.state) , turn);
            }
            else
            {
              b.update(m.move(b) , turn);
            }
            turn = 1-turn;
            it++;
            
            
        }
        peep = b;
        
        int[] res = new int[2];
        res[0] = b.win();
        res[1] = turn;
        return res;
    }
    
    Member mix(Member a, Member b)
    {
        float[][] newWeights = new float[9][9];
        for(int i = 0 ; i < 9 ; i++)
        {
          for(int j  = 0 ; j < 9 ; j++)
          {
            
             int rand = int(random(2));
             if(rand == 0)
               newWeights[i][j] = a.weights[i][j];
             else
               newWeights[i][j] = b.weights[i][j];
             
          }
        }
        return new Member(newWeights);
      
    }
    
    Member generate(int popSize , int generations)
    {
       Member[] population = new Member[popSize];
       Member best = null;
       
       for(int  i = 0 ; i < popSize; i++)
       {
          population[i] = new Member();
       }
       for(int  gen = 0; gen < generations ; gen++)
       {
         
         ArrayList<Integer> al = new ArrayList<Integer>();
         float totalFitness = 0;
         println("Generation " + gen);
         int maxIndex = -1;
         float maxScore = -1;
         for(int  i = 0 ; i < popSize; i++)
         {
           
           float score = score(population[i]);
           if(score > maxScore)
           {
             maxIndex = i;
             maxScore = score;
           }
           
           totalFitness += score;
           for(int  j = 0 ; j < score; j++)
           {
             al.add(i);
           }
         }
         best = population[maxIndex];
         
         
         for(int  i = 0 ; i < popSize; i++)
         {
            int a = int(random(al.size()));
            int b = int(random(al.size()));
            population[i] = mix(population[al.get(a)] , population[al.get(b)]);
            
         }
         
         println("Average fitness of the population: " + totalFitness/popSize);
         println("Best Fitness of population: " + maxScore);
      
       }
       return best;
    }
  
}







class Member
{
  float[][] weights;
  
  float[] res;
  
  Member()
  {
    weights = new float[9][9];
    for(int i = 0 ; i < 9 ; i++)
    {
      for(int j  = 0 ; j < 9 ; j++)
      {
         weights[i][j]  = random(-1,1); 
      }
    }
    
  }
  
  Member(float[][] vals)
  {
    weights = vals;
    
  }
  
  int move(Board b)
  {
    res = new float[9];
    for(int i = 0 ; i < 9 ; i++)
    {
      for(int j  = 0 ; j < 9 ; j++)
      {
        res[j] += weights[i][j] * b.state[i];     
      }
    }
    
    int maxIndex = 0;
    
    
    for(int i = 0 ; i < 9 ; i++)
    {
      res[i] = sig(res[i]);
      if(res[maxIndex] < res[i] && b.state[i] == -1)
      {
        maxIndex = i;
      }
    }
    return maxIndex;
    
  }
  
  float sig(float input)
  {
    return pow(2.7 , input)  / (pow(2.7 , input) + 1);
    
  }
  
}
