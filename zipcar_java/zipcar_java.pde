  import controlP5.*;

ControlP5 cp5;

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
ZipCarAppScreen zipCarReserveScreen;
ZipCarAppScreen zipCarDriveScreen;
ZipCarAppScreen zipCarMyZipcarScreen;

//Declaring objects for Command pattern
ZipCarMenuCommand slot1;
ZipCarMenuCommand slot2;
ZipCarMenuCommand slot3;

ZipCarTouchAdapter newAdapter;
private Pin pin;

PImage imgHome;
PImage imgCarMenu;
PImage imgLogin;
PImage imgRemote;
PImage imgReserve;
PImage imgDatePicker;
PImage imgLoading;
PImage imgFindCar;
PImage imgConfirmCar;
PImage imgReserveNotification;
PImage imgNewMember;
PImage imgNewLogin;
private static int mainScreenFlag=0;
private static int touchScreenFlag=0;
private static int loginScreenFlag=0;
private static int reserveScreenFlag=0;
private static int inDatePicker=0;
private static int findCarFlag=0;
private static int carDetailsFlag=0;

void setup() {
 size(300,550);
 smooth();
 cp5 = new ControlP5(this);

 factory = new AppScreenFactory();
 pinScreen = factory.makeAppScreen("pinscreen");
 zipCarHomeScreen = factory.makeAppScreen("home");
 zipCarLoginScreen = factory.makeAppScreen("login");
 zipCarReserveScreen = factory.makeAppScreen("reserve");
 zipCarDriveScreen = factory.makeAppScreen("drive");
 zipCarMyZipcarScreen = factory.makeAppScreen("myzipcar");

 slot1 = new ZipCarMenuCommand(zipCarReserveScreen);
 slot2 = new ZipCarMenuCommand(zipCarDriveScreen);
 slot3 = new ZipCarMenuCommand(zipCarMyZipcarScreen);
 
 pin = Pin.getInstance();

 newAdapter = new ZipCarLoginScreenAdapter((ZipCarLoginScreen)zipCarLoginScreen); 
 
 pinScreen.setImage("keypad.png");
 zipCarHomeScreen.setImage("home.png");
 zipCarLoginScreen.setImage("login.png");
 
 //Fate to be decided
 //zipCarReserveScreen.setImage("reserve.png");
 //zipCarDriveScreen.setImage("drive.png");
 //zipCarMyZipcarScreen.setImage("myzipcar.png");
 
 imgLogin   = loadImage("login.png");
 imgReserve = loadImage("reserve.png");
 imgDatePicker = loadImage("datepicker.png");
 imgFindCar =  loadImage("cars.png");
 imgLoading = loadImage("loading.png");
 imgConfirmCar= loadImage("reserveconfirm.png");
 imgReserveNotification = loadImage("reservenotification.png");
 imgNewMember = loadImage("newmember.png");
 imgNewLogin = loadImage("newlogin.png");
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
      zipCarLoginScreen.displayImage("login.png", 300, 550);
      loginScreenFlag=1;
      cp5.addTextfield("username").setPosition(100,148).setSize(180,20)
      .setFont(font).setColor(color(0,0,0)).setColorBackground(color(245,245,245));
      cp5.addTextfield("password").setPosition(100,195).setSize(180,20)
      .setFont(font).setColor(color(0,0,0)).setColorBackground(color(245,245,245));
      //Hardcoded adapter
      newAdapter.touch(2,3);
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
     image(imgNewMember,0,0,300,550);
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
      image(imgNewLogin,0,0,300,550);
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
      inDatePicker=1;
    }
    
    //Command Pattern Menu2
    else if (loginScreenFlag==1 && reserveScreenFlag==1 && (mouseX>110 && mouseX <175 && mouseY >500 && mouseY<550)) {
      slot2.execute("drive.png", 300, 550);
      cp5.remove("starts");
      cp5.remove("ends");
      cp5.remove("location");
      cp5.remove("cars");
      findCarFlag=0;
      inDatePicker=1;
    }
    
    //Command Pattern Menu3
    else if (loginScreenFlag==1 && reserveScreenFlag==1 && (mouseX>195 && mouseX <260 && mouseY >500 && mouseY<550)) {
      slot3.execute("myzipcar.png", 300, 550);
      cp5.remove("starts");
      cp5.remove("ends");
      cp5.remove("location");
      cp5.remove("cars");
      findCarFlag=0;
      inDatePicker=1;
    }
        
    else if (loginScreenFlag==1 && reserveScreenFlag==1 && ((mouseX>265 && mouseX <280 && mouseY >125 && mouseY<158) || 
    (mouseX>265 && mouseX <275 && mouseY >160 && mouseY<195)) && inDatePicker==0) {
      image(imgDatePicker,0,310,300,200);
      inDatePicker=1;
    }
    
    else if (inDatePicker==1 && reserveScreenFlag==1 && (mouseX>248 && mouseX <280 && mouseY >320 && mouseY<340)){
      image(imgReserve,0,0,300,550);
      getReserveScreen();
      inDatePicker=0;
    }
    else if (reserveScreenFlag==1 && findCarFlag==0 && inDatePicker==0 && (mouseX>20 && mouseX <280 && mouseY >310 && mouseY<370)){
      //image(imgLoading,0,0,300,550);
      inDatePicker=1;
      cp5.remove("starts");
      cp5.remove("ends");
      cp5.remove("location");
      cp5.remove("cars");
      image(imgFindCar,0,0,300,550);
      findCarFlag=1;
    }
    
    else if (reserveScreenFlag==1 && findCarFlag==1 && inDatePicker==1 && (mouseX>20 && mouseX <70 && mouseY >30 && mouseY<60)){
      getReserveScreen();
      inDatePicker=0;
      findCarFlag=0;
    }
    else if (reserveScreenFlag==1 && findCarFlag==1 && inDatePicker==1 && (mouseX>10 && mouseX <300 && mouseY >105 && mouseY<170)){
      image(imgConfirmCar,0,0,300,550);
      carDetailsFlag=1;
    }
    else if (reserveScreenFlag==1 && findCarFlag==1 && inDatePicker==1 && carDetailsFlag==1 && (mouseX>20 && mouseX <280 && mouseY >240 && mouseY<270)){
      image(imgReserveNotification,0,0,300,550);
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

