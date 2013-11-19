public class ZipCarMyZipcarScreen extends ZipCarAppScreen{
  String inputKey;
  
  /*public ZipCarPinScreen(){
    psKeyPad = new PassCodeKeyPad();
    zipCarPinStateMachine = new ZipCarPinStateMachine();
  }*/
  
  public void setImage(String imgName){
    image  = loadImage(imgName);
  }
  
  public void displayImage(String imgName, int xloc, int yloc){
    image(image, 0, 0, xloc, yloc);
  }
  
  public void touch(int x, int y){
      System.out.println("Touch and Write");
  }

}
