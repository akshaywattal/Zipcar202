//Implementing interface Adapter
public class ZipCarLoginScreenAdapter extends ZipCarDisplayAdapter{
  private ZipCarLoginScreen zipCarLoginScreen; 
  
  public ZipCarLoginScreenAdapter(ZipCarLoginScreen newZipCarLoginScreen){
    this.zipCarLoginScreen = newZipCarLoginScreen;     
  }
  
  public void displayImage(String image, int x, int y){
    this.zipCarLoginScreen.displayImage(image,x,y);
  }
}
