class Menu{
  
  Menu(){
  }
  
  void show(String function){
    if (function == "play"){
      b1.addActionListener(null);
      
      c.remove(t1);
      c.remove(l1);
      c.remove(b1);
      t1.addActionListener(null);
    }
    else if(function == "back"){
      println("working");
    }
  }
}
