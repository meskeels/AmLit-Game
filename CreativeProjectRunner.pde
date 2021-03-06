//0 = wall, 1 = space, 2 = guard, 3 = player
/*

  Here’s your lunch for today, peanut butter and jelly sandwiches.
  Try to avoid speaking to anyone on the way to school.
  But remember… if anyone asks, you’re Chinese.
  
  if caught, show "you're not fooling anyone, we're sending you to the internment camp"
    
  if win, show "You made it to school without being detected, the Emporer would be proud"
    play japanese national anthem
  
  
  We need to finish the initialization of guards based on the array using array list
  We also need to create the interaction between the player and enemies and sort out textbox rendering
  We need to finish camera/player view
  
*/



BlockGroup BG;
int[][] grid;
boolean active;
int playerInitX;
int playerInitY;
int guardNumber;
ArrayList guards;
IntList guardInitX;
IntList guardInitY;
Player P1;
GuardGroup GG;
Guard G;
void setup()
{
  size(800,600);
  background(255,255,255);
  BG = new BlockGroup(40,31);
  active = true; 
  P1 = new Player(1,2,20);
  G = new Guard(0, 0, P1, "");
  guardInitX = new IntList();
  guardInitY = new IntList();
  guards = new ArrayList<Guard>();
  guardNumber = 0;
  GG = new GuardGroup(1);
  
  int[][] grid = 
  {//1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//1
    {0,1,1,1,1,1,0,0,0,0,1,1,0,0,1,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0},//2
    {0,1,1,1,1,1,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0},//3
    {0,0,0,1,1,0,0,0,0,0,1,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0},//4
    {0,0,1,1,1,1,1,1,0,0,1,1,0,0,1,1,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0},//5
    {0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0},//6
    {0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0},//7
    {0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0},//8
    {0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0},//9
    {0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0},//10
    {0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0},//11
    {0,0,0,0,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0},//12
    {0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0},//13
    {0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0},//14
    {0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0},//15
    {0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0},//16
    {0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,1,2,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0},//17
    {0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0},//18
    {0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0},//19
    {0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0},//20
    {0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0},//21
    {0,0,0,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0},//22
    {0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0},//23
    {0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//24
    {0,0,0,0,0,1,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//25
    {0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//26
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//27
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//28
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//29
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},//30
    {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}//31
  };
  
  for(int c = 0; c < 40; c++)
  {
    for(int r = 0; r < 31; r++)
    {
      if(grid[r][c] == 0)
      {
        BG.addBlock(new Block(c,r,false),c,r);
      }
      else if(grid[r][c] == 1|| grid[r][c] == 3 || grid[r][c] == 2)
      {
        if(grid[r][c] == 3)
        {
          playerInitX = r;
          playerInitY = c;
          BG.addBlock(new Block(c,r,true),c,r);
        }
        else if(grid[r][c] == 2)
        {
          guardNumber ++;
          guards.add(new Guard(c, r, P1, "down"));
          guardInitX.append(r);
          guardInitY.append(c);
          BG.addBlock(new Block(c,r,true),c,r);
        }
        else {
        BG.addBlock(new Block(c,r,true),c,r);
        }
      }
    }
  } 
}

void draw()
{
  
  for(int c = 0; c < 40; c++)
  {
    for(int r = 0; r < 31; r++)
    {
      BG.getBlock(c,r).placeBlock();
    }
  }
  G.placeGuard();
  P1.placePlayer();
}