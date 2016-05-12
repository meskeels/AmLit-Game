public class GuardGroup
{
  private Guard[] GuardG
  
  public GuardGroup(int limit)
  {
    GuardG = new Guard[limit];
  }
  
  public void addGuard(Guard g, int l)
  {
    GuardG[l] = g;
  }
  
  public Guard getGuard(int l)
  {
    return GuardG[l];
  }
  
  public int getSize()
  {
    return GuardG.length;
  }
}
