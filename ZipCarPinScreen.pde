public class ZipCarPinScreen extends ZipCarAppScreen{
  String inputKey;
  
  PassCodeKeyPad psKeyPad;
  ZipCarPinStateMachine zipCarPinStateMachine;
  
  public ZipCarPinScreen(){
    psKeyPad = new PassCodeKeyPad();
    zipCarPinStateMachine = new ZipCarPinStateMachine();
  }
  
  public void setImage(String imgName){
    image  = loadImage(imgName);
  }
  
  public void displayImage(String imgName, int xloc, int yloc){
    image(image, 0, 0, xloc, yloc);
  }
  
  public void touch(int x, int y){
    inputKey=psKeyPad.keyPress(x,y);
    if (inputKey.equals(""));
      //Do Nothing
    else if (inputKey.equals("-"))
      zipCarPinStateMachine.delete();
    else
      zipCarPinStateMachine.enterDigit(inputKey);
  }

}
