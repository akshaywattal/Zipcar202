public abstract class ZipCarAppScreen{
  protected PImage image;
  
  public void touch(int x, int y)  {};
  
  //These methods must be overridden by subclasses
  abstract public void displayImage(String imgName, int xloc, int yloc);
  
  //This is template method, which cannot be overwritten
  final void setImage(String imgName){
    image  = loadImage(imgName);
  }

}
