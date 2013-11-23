//Implementing State Pattern state
public class TwoPinDigits extends ZipCarPinState{
  
  private ZipCarPinStateMachine pinStateMachine;
  
  public TwoPinDigits(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  public void delete(){
    pinStateMachine.setPinState(pinStateMachine.OnePinDigitState("-"));
  }
  
  public void enterDigit(String inputKey){
    pinStateMachine.setPinState(pinStateMachine.ThreePinDigitsState(inputKey));
  }
  
  public void validPin() {System.out.println("Enter 2 more digits");}
  
  public void invalidPin() {System.out.println("Enter 2 more digits");}
}
