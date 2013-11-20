public class ZipCarHomeScreen extends ZipCarAppScreen{
  
  public void setImage(String imgName){
    image  = loadImage(imgName);
  }
  
  public void displayImage(String imgName, int xloc, int yloc){
    image(image, 0, 0, xloc, yloc);
  }
  
}
