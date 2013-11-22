  import controlP5.*;
  
public class AppScreenFactory {
  private ControlP5 cp5;
  
  public AppScreenFactory(ControlP5 newcp5){
    this.cp5 = newcp5;
  }
  
public ZipCarAppScreen makeAppScreen(String screenName){
  ZipCarAppScreen newZipCarAppScreen = null;
  
  if(screenName.equals("pinscreen")){
    return new ZipCarPinScreen();
  } 
  else if(screenName.equals("home")){
    return new ZipCarHomeScreen();
  }
  else if(screenName.equals("login")){
    return new ZipCarLoginScreen(cp5);
  }
  else if(screenName.equals("newmember")){
    return new ZipCarSignUpScreen();
  }
  else if(screenName.equals("newlogin")){
    return new ZipCarNewMemberLoginScreen();
  }
  else if(screenName.equals("reserve")){
    return new ZipCarReserveScreen();
  }
  else if(screenName.equals("cars")){
    return new ZipCarFindCarScreen();
  }
  else if(screenName.equals("reserveconfirm")){
    return new ZipCarConfirmCarScreen();
  }
  else if(screenName.equals("reservenotification")){
    return new ZipCarReserveNotifScreen();
  }
  else if(screenName.equals("drive")){
    return new ZipCarDriveScreen();
  }
  else if(screenName.equals("myzipcar")){
    return new ZipCarMyZipcarScreen();
  }  
  else if(screenName.equals("logout")){
  return new ZipCarLogoutScreen();
  }
  else
    return null;
  }

}
