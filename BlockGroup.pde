public class BlockGroup
{
  private Block[][] BlockG;
  
  public BlockGroup(int c, int r)
  {
    BlockG = new Block[c][r];
  }
  
  public void addBlock(Block b, int c, int r)
  {
    BlockG[c][r] = b;
  }
  
  public Block getBlock(int c, int r)
  {
    return BlockG[c][r];
  }
  
  public int getSize()
  {
    return BlockG.length;
  }
}
