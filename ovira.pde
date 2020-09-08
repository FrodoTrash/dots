class Ovira{
  int x; //lokacija x
  int y; //lokacija y
  int a; //dolzina a
  int b; //dolzina b
  
  Dot dot;
  //ovira(int x, int y, int a, int b){
  //}
  
  
  void staticLine(){
    rect(100,300,600,10);
  }
  
  void postaviStatic(int x, int y, int a, int b){
     rect(x,y,a,b);
     //fill(0,0,255);
  }
  
  
  void postaviDynamic(int x, int y, int a, int b){ 
    rect(x,y,a,b);
    
  }
  
  
  void postaviLethal(){
  
  }
  
}
