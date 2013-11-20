public class AppScreenFactory {
  
public ZipCarAppScreen makeAppScreen(String screenName){
  ZipCarAppScreen newZipCarAppScreen = null;
  
  if(screenName.equals("pinscreen")){
    return new ZipCarPinScreen();
  } 
  else if(screenName.equals("home")){
    return new ZipCarHomeScreen();
  }
  else if(screenName.equals("login")){
    return new ZipCarLoginScreen();
  }
  else if(screenName.equals("reserve")){
    return new ZipCarReserveScreen();
  }
  else if(screenName.equals("drive")){
    return new ZipCarDriveScreen();
  }
  else if(screenName.equals("myzipcar")){
    return new ZipCarMyZipcarScreen();
  }  
  else
    return null;
  }

}
