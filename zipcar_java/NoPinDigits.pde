//Implementing State Pattern state
public class NoPinDigits extends ZipCarPinState{
  
  private ZipCarPinStateMachine pinStateMachine;
  
  public NoPinDigits(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  public void delete()  {System.out.println("No digit to delete");}
  
  public void enterDigit(String inputKey){
    pinStateMachine.setPinState(pinStateMachine.OnePinDigitState(inputKey));
  }
  
  public void validPin() {System.out.println("Enter 4 more digits");}
  
  public void invalidPin() {System.out.println("Enter 4 more digits");}
}
