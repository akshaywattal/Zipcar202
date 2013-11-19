public static class Pin {

    private boolean authenticated = false ;
    private static Pin instance;
    private int touchScreenFlag=0;

    private Pin()
    {
    }

    public static Pin getInstance() {
        if (instance == null) {
            instance = new Pin();
        }
        return instance;
    }

    public boolean getAuthentication(){
        return this.authenticated ;
    }
    
    public void setAuthentication(boolean authentication){
        this.authenticated = authentication;
    }
    
    public int getTouchScreenFlag(){
        return this.touchScreenFlag ;
    }
    
    public void setTouchScreenFlag(int value){
        this.touchScreenFlag = value;
    }
     
}
 

