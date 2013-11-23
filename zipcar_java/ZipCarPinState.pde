//Implementing State Pattern
public abstract class ZipCarPinState
{
    public abstract void delete();
    public abstract void enterDigit(String inputKey);
    public abstract void validPin();
    public abstract void invalidPin();

}
