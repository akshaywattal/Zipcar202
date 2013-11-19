public class NoPinDigits extends ZipCarPinState{
  
  ZipCarPinStateMachine pinStateMachine;
  
  public NoPinDigits(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  void delete()  {System.out.println("No digit to delete");}
  
  void enterDigit(String inputKey){
    pinStateMachine.setPinState(pinStateMachine.OnePinDigitState(inputKey));
  }
  
  void validPin() {System.out.println("Enter 4 more digits");}
  
  void invalidPin() {System.out.println("Enter 4 more digits");}
}
