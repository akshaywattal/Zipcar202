  import controlP5.*;

public class ZipCarLoginScreen extends ZipCarAppScreen{
  String inputKey;
  ControlP5 cp5;
  
  public ZipCarLoginScreen(ControlP5 newcp5){
    this.cp5 = newcp5;
  }
  
  public void setImage(String imgName){
    image  = loadImage(imgName);
  }
  
  //Contains both Image and Text Box, using Adapter to call it.
  public void displayImage(String imgName, int xloc, int yloc){
    image(image, 0, 0, xloc, yloc);
    cp5.addTextfield("username").setPosition(100,148).setSize(180,20)
      .setFont(font).setColor(color(0,0,0)).setColorBackground(color(245,245,245));
    cp5.addTextfield("password").setPosition(100,195).setSize(180,20)
      .setFont(font).setColor(color(0,0,0)).setColorBackground(color(245,245,245));
  }
}
