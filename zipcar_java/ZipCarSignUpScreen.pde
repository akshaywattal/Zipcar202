public class ZipCarSignUpScreen extends ZipCarAppScreen{
  String inputKey;
  
  public void setImage(String imgName){
    image  = loadImage(imgName);
  }
  
  public void displayImage(String imgName, int xloc, int yloc){
    image(image, 0, 0, xloc, yloc);
  }

}
