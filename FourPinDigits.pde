public class FourPinDigits extends ZipCarPinState{
  
  ZipCarPinStateMachine pinStateMachine;
  
  public FourPinDigits(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  void delete()  {}
  
  void enterDigit(String inputKey) {}
  
  void validPin() {}
  
  void invalidPin(){
    pinStateMachine.setPinState(pinStateMachine.NoPinDigitState());
  }

}
