//Implementing State Pattern state
public class FourPinDigits extends ZipCarPinState{
  
  private ZipCarPinStateMachine pinStateMachine;
  
  public FourPinDigits(ZipCarPinStateMachine newPinStateMachine){
    pinStateMachine = newPinStateMachine;
  }
  
  public void delete()  {}
  
  public void enterDigit(String inputKey) {}
  
  public void validPin() {}
  
  public void invalidPin(){
    pinStateMachine.setPinState(pinStateMachine.NoPinDigitState());
  }

}
