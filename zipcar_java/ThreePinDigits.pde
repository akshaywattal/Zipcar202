//Implementing State Pattern state
public class ThreePinDigits extends ZipCarPinState{
  
  private ZipCarPinStateMachine pinStateMachine;
  
  public ThreePinDigits(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  public void delete(){
    pinStateMachine.setPinState(pinStateMachine.TwoPinDigitsState("-"));
  }
  
  public void enterDigit(String inputKey){
    pinStateMachine.setPinState(pinStateMachine.FourPinDigitsState(inputKey));
  }
  
  public void validPin() {System.out.println("Enter 1 more digit");}
  
  public void invalidPin() {System.out.println("Enter 1 more digit");}
}
