public class TwoPinDigits extends ZipCarPinState{
  
  ZipCarPinStateMachine pinStateMachine;
  
  public TwoPinDigits(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  void delete(){
    pinStateMachine.setPinState(pinStateMachine.OnePinDigitState("-"));
  }
  
  void enterDigit(String inputKey){
    pinStateMachine.setPinState(pinStateMachine.ThreePinDigitsState(inputKey));
  }
  
  void validPin() {System.out.println("Enter 2 more digits");}
  
  void invalidPin() {System.out.println("Enter 2 more digits");}
}
