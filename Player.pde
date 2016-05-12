public class Player
{
  private int l_c;
  private int l_r;
  private String direction;
  PImage Image;
  
  public Player(int playerInitY, int playerInitX, int h)
  {
    l_c = playerInitY;
    l_r = playerInitX;
    direction = "left";
    Image = loadImage("kidwithcap - Copy.jpg");
  }
  
  public int getC()
  {
    return l_c;
  }
  public int getR()
  {
    return l_r;
  }
  public String getDirection()
  {
    return direction;
  }
  
  public void move(int c, int r)
  {
    l_c = c;
    l_r = r;
  }
  
  public void placePlayer()
  {
    image(Image,playerInitY*20,playerInitX*20);
  }
 

}
