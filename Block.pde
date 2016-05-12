public class Block
{
  private int l_c;
  private int l_r;
  private boolean wall;
  
  public Block(int c, int r, boolean w)
  {
    l_c = c;
    l_r = r;
    wall = w;
  }
  
  public int getC()
  {
    return l_c;
  }
  
  public int getR()
  {
    return l_r;
  }
  
  public boolean getWall()
  {
    return wall;
  }
  
  public void SwitchWall()
  {
    if(wall == true)
    {
      wall = false;
    }
    if(wall == false)
    {
      wall = true;
    }
  }
  
  public void placeBlock()
  {
    rect(l_c*20,l_r*20-20,20,20);
    stroke(0);
    if(wall == false)
    {
      fill(192,192,192);
    }
    if(wall == true)
    {
      fill(255,255,255);
    }
  }
}
