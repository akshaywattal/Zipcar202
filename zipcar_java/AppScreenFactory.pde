public class AppScreenFactory {
  
public ZipCarAppScreen makeAppScreen(String screenName){
        ZipCarAppScreen newZipCarAppScreen = null;
        
       if(screenName.equals("login")){
        return new ZipCarLoginScreen();
       } 
        if(screenName.equals("pinscreen")){
        return new ZipCarPinScreen();
       } 
        return null;




       
}
}
