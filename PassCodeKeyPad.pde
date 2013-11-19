public class PassCodeKeyPad{

public String keyPress(int mouseX, int mouseY){
    if(mouseX>25 && mouseX <90 && mouseY >155 && mouseY<230){
      System.out.println("Entered 1");
      return "1";
    }
    else if(mouseX>110 && mouseX <175 && mouseY >155 && mouseY<230){
      System.out.println("Entered 2");
      return "2";
    }
    else if(mouseX>195 && mouseX <260 && mouseY >155 && mouseY<230){
      System.out.println("Entered 3");
      return "3";
    }
    else if(mouseX>25 && mouseX <90 && mouseY >245 && mouseY<315){
      System.out.println("Entered 4");
      return "4";
    }
    else if(mouseX>110 && mouseX <175 && mouseY >245 && mouseY<315){
      System.out.println("Entered 5");
      return "5";
    }
    else if(mouseX>195 && mouseX <260 && mouseY >245 && mouseY<315){
      System.out.println("Entered 6");
      return "6";
    }
    else if(mouseX>25 && mouseX <90 && mouseY >330 && mouseY<400){
      System.out.println("Entered 7");
      return "7";
    }
    else if(mouseX>110 && mouseX <175 && mouseY >330 && mouseY<400){
      System.out.println("Entered 8");
      return "8";
    }
    else if(mouseX>195 && mouseX <260 && mouseY >330 && mouseY<400){
      System.out.println("Entered 9");
      return "9";
    }
    else if(mouseX>110 && mouseX <175 && mouseY >415 && mouseY<485){
      System.out.println("Entered 0");
      return "0";
    }
    else if(mouseX>195 && mouseX <260 && mouseY >515 && mouseY<530){
      System.out.println("Deleted Digit");
      return "-";
    }
    return "";
  } 

}
