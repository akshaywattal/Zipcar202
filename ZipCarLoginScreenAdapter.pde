public class ZipCarLoginScreenAdapter extends ZipCarTouchAdapter{
  private ZipCarLoginScreen zipCarLoginScreen; 
  
  public ZipCarLoginScreenAdapter(ZipCarLoginScreen newZipCarLoginScreen){
    this.zipCarLoginScreen = newZipCarLoginScreen;     
  }
  
  public void touch(int x, int y){
    this.zipCarLoginScreen.touch(x,y);
  }
}
