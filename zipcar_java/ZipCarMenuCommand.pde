public class ZipCarMenuCommand extends Command{
  ZipCarAppScreen zipCarAppScreen;
  
  public ZipCarMenuCommand(ZipCarAppScreen newZipCarAppScreen){
    this.zipCarAppScreen = newZipCarAppScreen;
  }
  
  public void execute(){
    zipCarAppScreen.touch(2,3);
  }
}
