public class ThreePinDigits extends ZipCarPinState{
  
  ZipCarPinStateMachine pinStateMachine;
  
  public ThreePinDigits(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  void delete(){
    pinStateMachine.setPinState(pinStateMachine.TwoPinDigitsState("-"));
  }
  
  void enterDigit(String inputKey){
    pinStateMachine.setPinState(pinStateMachine.FourPinDigitsState(inputKey));
  }
  
  void validPin() {System.out.println("Enter 1 more digit");}
  
  void invalidPin() {System.out.println("Enter 1 more digit");}
}
