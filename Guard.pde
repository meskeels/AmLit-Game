public class Guard
{
  private int l_c;
  private int l_r;
  private float distance;
  private String direction;
  
  public Guard(int c, int r, Player p1, String d)
  {
    l_c = c;
    l_r = r;
    distance = sqrt(pow(p1.getC()-l_c,2) + pow(p1.getR()-l_r,2));
    direction = d;
  }
  
  public int getC()
  {
    return l_c;
  }
  
  public int getR()
  {
    return l_r;
  }
  
  public float getDistance()
  {
    return distance;
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
  
}
