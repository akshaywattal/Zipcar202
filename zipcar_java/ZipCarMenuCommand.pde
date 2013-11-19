public class ZipCarMenuCommand extends Command{
  ZipCarAppScreen zipCarAppScreen;
  String imgName;
  int xloc;
  int yloc;
  
  public ZipCarMenuCommand(ZipCarAppScreen newZipCarAppScreen){
    this.zipCarAppScreen = newZipCarAppScreen;
  }
  
  public void execute(String imgName, int xloc, int yloc){
    zipCarAppScreen.setImage(imgName);
    zipCarAppScreen.displayImage(imgName, xloc, yloc);  
  }
}
