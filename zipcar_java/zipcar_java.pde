
import ddf.minim.*;


import controlP5.*;
  
ControlP5 cp5;
Minim minim;
AudioSnippet song;
//AudioInput input;
PFont font = createFont("arial",14);
PFont font2 = createFont("arial",14);

String username;
String password;

//Declaring objects for Factory pattern 
AppScreenFactory factory;
ZipCarAppScreen newZipCarAppScreen = null;
ZipCarAppScreen pinScreen;
ZipCarAppScreen zipCarHomeScreen;
ZipCarAppScreen zipCarLoginScreen;
ZipCarAppScreen zipCarSignUpScreen;
ZipCarAppScreen zipCarNewMemberLoginScreen;
ZipCarAppScreen zipCarReserveScreen;
ZipCarAppScreen zipCarFindCarScreen;
ZipCarAppScreen zipCarConfirmCarScreen;
ZipCarAppScreen zipCarReserveNotifScreen;
ZipCarAppScreen zipCarDriveScreen;
ZipCarAppScreen zipCarMyZipcarScreen;
ZipCarAppScreen zipCarLogoutScreen;

//Declaring objects for Command pattern
ZipCarMenuCommand slot1;
ZipCarMenuCommand slot2;
ZipCarMenuCommand slot3;

//Declaring object for Adapter pattern
ZipCarDisplayAdapter newAdapter;

//Declaring object for Singleton pattern
private Pin pin;

PImage imgDatePicker;

private static int mainScreenFlag=0;
private static int touchScreenFlag=0;
private static int loginScreenFlag=0;
private static int reserveScreenFlag=0;
private static int inDatePicker=0;
private static int findCarFlag=0;
private static int carDetailsFlag=0;
private static int inRemote = 0;
private static int myZipcar=0;

void setup() {
 size(300,550);
 smooth();
 cp5 = new ControlP5(this);

 factory = new AppScreenFactory(cp5);
 pinScreen = factory.makeAppScreen("pinscreen");
 zipCarHomeScreen = factory.makeAppScreen("home");
 zipCarLoginScreen = factory.makeAppScreen("login");
 zipCarSignUpScreen = factory.makeAppScreen("newmember");
 zipCarNewMemberLoginScreen = factory.makeAppScreen("newlogin");
 zipCarReserveScreen = factory.makeAppScreen("reserve");
 zipCarDriveScreen = factory.makeAppScreen("drive");
 zipCarMyZipcarScreen = factory.makeAppScreen("myzipcar");
 zipCarFindCarScreen = factory.makeAppScreen("cars");
 zipCarConfirmCarScreen = factory.makeAppScreen("reserveconfirm"); 
 zipCarReserveNotifScreen = factory.makeAppScreen("reservenotification");
 zipCarLogoutScreen = factory.makeAppScreen("logout");

 slot1 = new ZipCarMenuCommand(zipCarReserveScreen);
 slot2 = new ZipCarMenuCommand(zipCarDriveScreen);
 slot3 = new ZipCarMenuCommand(zipCarMyZipcarScreen);
 
 pin = Pin.getInstance();

 newAdapter = new ZipCarLoginScreenAdapter((ZipCarLoginScreen)zipCarLoginScreen); 
 //for sound
 minim = new Minim(this);
 //song = minim.loadFile("remote.mp3");
 song = minim.loadSnippet("remote.mp3");
 //input = minim.getLineIn();
 
 pinScreen.setImage("keypad.png");
 zipCarHomeScreen.setImage("home.png");
 zipCarLoginScreen.setImage("login.png");
 zipCarSignUpScreen.setImage("newmember.png");
 zipCarNewMemberLoginScreen.setImage("newlogin.png");
 zipCarFindCarScreen.setImage("cars.png");
 zipCarConfirmCarScreen.setImage("reserveconfirm.png");
 zipCarReserveNotifScreen.setImage("reservenotification.png");
 zipCarLogoutScreen.setImage("logout.png"); 
 imgDatePicker = loadImage("datepicker.png");
}

void draw() {
 if(mainScreenFlag==0 && pin.getTouchScreenFlag()==0){
 pinScreen.displayImage("keypad.png", 300, 550);
 }  
}
 
void mouseClicked() {
   if(mainScreenFlag==0) {
     pinScreen.touch(mouseX,mouseY);
     pin.setTouchScreenFlag(1);
     if(pin.getAuthentication()){
       zipCarHomeScreen.displayImage("home.png", 300, 550);
       mainScreenFlag=1;
     }   
   }
   
    else if (mainScreenFlag==1 && loginScreenFlag==0 && (mouseX>17 && mouseX <75 && mouseY >25 && mouseY<90)) {
      newAdapter.displayImage("login.png", 300, 550);
      loginScreenFlag=1;
    }
    
    else if (loginScreenFlag==1 && reserveScreenFlag==0 && (mouseX>17 && mouseX <250 && mouseY >250 && mouseY<280)
    && (cp5.get(Textfield.class,"username").getText()).equals("awattal") 
    && (cp5.get(Textfield.class,"password").getText()).equals("1234")) {
      reserveScreenFlag=1;
      cp5.remove("username");
      cp5.remove("password");
      getReserveScreen();
    }
    
    else if (loginScreenFlag==1 && reserveScreenFlag==0 && (mouseX>17 && mouseX <280 && mouseY >295 && mouseY<325)) {
      reserveScreenFlag=3;//for new member registration
      cp5.remove("username");
      cp5.remove("password");
      zipCarSignUpScreen.displayImage("newmember.png", 300, 550);
      cp5.addTextfield("myemail").setPosition(120,106).setSize(150,20)
      .setFont(font).setColor(color(0,0,0)).setColorBackground(color(245,245,245));
      cp5.addTextfield("mynewpassword").setPosition(120,150).setSize(150,20)
      .setFont(font).setColor(color(0,0,0)).setColorBackground(color(245,245,245));
      cp5.addTextfield("myphone").setPosition(120,195).setSize(150,20)
      .setFont(font).setColor(color(0,0,0)).setColorBackground(color(245,245,245));
      reserveScreenFlag=4;
    }
    
    else if(reserveScreenFlag==4 && (mouseX>17 && mouseX <280 && mouseY >300 && mouseY<330))
    {
      zipCarNewMemberLoginScreen.displayImage("newlogin.png", 300, 550);
      cp5.remove("myemail");
      cp5.remove("mynewpassword");
      cp5.remove("myphone");  
      cp5.addTextfield("username").setPosition(100,148).setSize(180,20)
      .setFont(font).setColor(color(0,0,0)).setColorBackground(color(245,245,245));
      cp5.addTextfield("password").setPosition(100,195).setSize(180,20)
      .setFont(font).setColor(color(0,0,0)).setColorBackground(color(245,245,245));
      reserveScreenFlag=0;
    }
    
    //Command Pattern Menu1
    else if (loginScreenFlag==1 && reserveScreenFlag==1 && (mouseX>25 && mouseX <90 && mouseY >500 && mouseY<550)) {
      getReserveScreen();
      findCarFlag=0;
      inDatePicker=0;
      myZipcar=0;
    }
    
    //Command Pattern Menu2
    else if (loginScreenFlag==1 && reserveScreenFlag==1 && (mouseX>110 && mouseX <175 && mouseY >500 && mouseY<550)) {
      slot2.execute("drive.png", 300, 550);
      cp5.remove("starts");
      cp5.remove("ends");
      cp5.remove("location");
      cp5.remove("cars");

      findCarFlag=0;
      inDatePicker=0;
      myZipcar=0;
      //inRemote = 1;
    }
    else if(mouseX>100 && mouseX <185 && mouseY >200 && mouseY<300 && loginScreenFlag==1 && reserveScreenFlag==1){
      //song.play();
      ring();
      }
    
    //Command Pattern Menu3
    else if (loginScreenFlag==1 && reserveScreenFlag==1 && (mouseX>195 && mouseX <260 && mouseY >500 && mouseY<550)) {
      slot3.execute("myzipcar.png", 300, 550);
      cp5.remove("starts");
      cp5.remove("ends");
      cp5.remove("location");
      cp5.remove("cars");
      findCarFlag=0;
      inDatePicker=0;
      myZipcar=1;
    }
       else if(myZipcar==1 && (mouseX>25 && mouseX <260 && mouseY >100 && mouseY<250) ){
         
         zipCarLogoutScreen.displayImage("logout.png", 300, 550);
         
         myZipcar = 2; 
       
       } 
       
       else if(myZipcar==2 && (mouseX>25 && mouseX <260 && mouseY >100 && mouseY<250) ){
       
       pin.setAuthentication(true);
      
      mainScreenFlag=0;
      touchScreenFlag=0;
      loginScreenFlag=0;
      reserveScreenFlag=0;
      inDatePicker=0;
      findCarFlag=0;
      carDetailsFlag=0;
      inRemote = 0;
      myZipcar=0;

       }
    else if (loginScreenFlag==1 && reserveScreenFlag==1 && ((mouseX>265 && mouseX <280 && mouseY >125 && mouseY<158) || 
    (mouseX>265 && mouseX <275 && mouseY >160 && mouseY<195)) && inDatePicker==0) {
      image(imgDatePicker,0,310,300,200);
      inDatePicker=1;
    }
    
    else if (inDatePicker==1 && reserveScreenFlag==1 && (mouseX>248 && mouseX <280 && mouseY >320 && mouseY<340)){
      getReserveScreen();
      inDatePicker=0;
    }
    
    else if (reserveScreenFlag==1 && findCarFlag==0 && inDatePicker==0 && (mouseX>20 && mouseX <280 && mouseY >310 && mouseY<370)){
      inDatePicker=1;
      cp5.remove("starts");
      cp5.remove("ends");
      cp5.remove("location");
      cp5.remove("cars");
      zipCarFindCarScreen.displayImage("cars.png", 300, 550);
      findCarFlag=1;
    }
    
    else if (reserveScreenFlag==1 && findCarFlag==1 && inDatePicker==1 && (mouseX>20 && mouseX <70 && mouseY >30 && mouseY<60)){
      getReserveScreen();
      inDatePicker=0;
      findCarFlag=0;
    }
    
    else if (reserveScreenFlag==1 && findCarFlag==1 && inDatePicker==1 && (mouseX>10 && mouseX <300 && mouseY >105 && mouseY<170)){
      zipCarConfirmCarScreen.displayImage("reserveconfirm.png", 300, 550);
      carDetailsFlag=1;
    }
    
    else if (reserveScreenFlag==1 && findCarFlag==1 && inDatePicker==1 && carDetailsFlag==1 && (mouseX>20 && mouseX <280 && mouseY >240 && mouseY<270)){
      zipCarReserveNotifScreen.displayImage("reservenotification.png", 300, 550);
      //getReserveScreen();
      inDatePicker=0;
      findCarFlag=0; 
      carDetailsFlag=0;
    }
    
}

public void getReserveScreen()
{
      slot1.execute("reserve.png", 300, 550);
      cp5.addTextarea("starts").setPosition(80,135).setSize(183,20)
      .setColor(color(0,0,0)).setFont(font2).setColorBackground(color(255,255,255)).setText("    Tue Oct 18,      3.30PM");
      
      cp5.addTextarea("ends").setPosition(80,175).setSize(183,20)
      .setColor(color(0,0,0)).setFont(font2).setColorBackground(color(255,255,255)).setText("    Tue Oct 18,      4.30PM");

      cp5.addTextarea("location").setPosition(80,242).setSize(183,20)
      .setColor(color(0,0,0)).setFont(font2).setColorBackground(color(255,255,255)).setText("       2050 Southwest Expy");
      
      cp5.addTextarea("cars").setPosition(223,285).setSize(40,20)
      .setColor(color(0,0,0)).setFont(font2).setColorBackground(color(255,255,255)).setText(" All");
}

void ring() {
    if (!song.isPlaying()) {
      // The ring() function plays the sound, as long as it is not already playing. 
      // rewind() ensures the sound starts from the beginning.
      song.rewind(); 
      song.play();
    }
  }
  
  public void stop() {
  // The doorbell object must close its sound.
  song.close(); 
  super.stop();
}
