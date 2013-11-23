//Screen Class
public class ZipCarPinScreen extends ZipCarAppScreen{
  private String inputKey;
  
  private PassCodeKeyPad psKeyPad;
  private ZipCarPinStateMachine zipCarPinStateMachine;
  
  public ZipCarPinScreen(){
    psKeyPad = new PassCodeKeyPad();
    zipCarPinStateMachine = new ZipCarPinStateMachine();
  }
  
  public void displayImage(String imgName, int xloc, int yloc){
    image(image, 0, 0, xloc, yloc);
  }
  
  //Takes input form the PIN Screen
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
