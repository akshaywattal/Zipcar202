public class OnePinDigit extends ZipCarPinState{
  
  ZipCarPinStateMachine pinStateMachine;
  
  public OnePinDigit(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  void delete(){
    pinStateMachine.setPinState(pinStateMachine.NoPinDigitState());
  }
  
  void enterDigit(String inputKey){
    pinStateMachine.setPinState(pinStateMachine.TwoPinDigitsState(inputKey));
  }
  
  void validPin() {System.out.println("Enter 3 more digits");}
  
  void invalidPin() {System.out.println("Enter 3 more digits");}
}
