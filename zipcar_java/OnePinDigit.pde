public class OnePinDigit extends ZipCarPinState{
  
  private ZipCarPinStateMachine pinStateMachine;
  
  public OnePinDigit(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  public void delete(){
    pinStateMachine.setPinState(pinStateMachine.NoPinDigitState());
  }
  
  public void enterDigit(String inputKey){
    pinStateMachine.setPinState(pinStateMachine.TwoPinDigitsState(inputKey));
  }
  
  public void validPin() {System.out.println("Enter 3 more digits");}
  
  public void invalidPin() {System.out.println("Enter 3 more digits");}
}
