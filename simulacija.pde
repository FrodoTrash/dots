import interfascia.*;
import static javax.swing.JOptionPane.*;
GUIController c;
IFButton b1, b2;
IFLabel l1, l2;
IFTextField t1, t2;

Menu menu = new Menu();
//button
int w = 150;
int h = 75;

//settings
int hB = 30;

//speed scroller
HScrollbar scroll;

//neuralNET
Population net;
PVector goal = new PVector(400, 10);

//ovire
Ovira ovire;

//output
PrintWriter output;

void setup(){
  size(800,800);
  background(200);

  //button
  c = new GUIController (this);
  b1 = new IFButton ("PLAY", width/2-(w/2), height/2-(h-2), w, h);
  b2 = new IFButton ("BACK", 25, 50, w, h);
  b1.addActionListener(this);
  c.add (b1);
  //settings
  l1 = new IFLabel("Population size: ", width/2-(w/2)-w, height/2+100);
  t1 = new IFTextField("", width/2-(w/2), height/2+100, 150);
  
  l2 = new IFLabel("FPS: ", width/2-(w/2)-w, height/2+150);
  t2 = new IFTextField("", width/2-(w/2), height/2+150, 150);
  c.add(l1);
  c.add(t1);
  t1.addActionListener(this);
  
 
  //neuralNET
  net = new Population(pop);
  println("DEFAULT POPULATION SET: "+pop);
  
  //speed scroller
  scroll = new HScrollbar(0, height-30, width/2-150, 30, 16);
  
  //ovire
  ovire = new Ovira();
  
  //file saver
  output = createWriter("steps.txt");
  println("File created");
  
}
//fps
float speed = 30; //default

//game
int pop = 1; //default population
boolean startGame = false;

void draw(){
  //simulacija
  frameRate(speed);
  fill(255,255,0);
  background(140); // navadne dots
  text(frameRate, 10,30);
  fill(255,0,0);
  
  if(startGame){
    ellipse(goal.x, goal.y,10,10);
    //ovire.postaviStatic(100,300,600,10); 
    ovire.staticLine();  
    scroll.display();
    scroll.update();
    if(net.allDotsDead()){
      //genetic alghoritim
      output.println("step: " + net.minStep);
      net.calculateFitness();
      net.naturalSelection();
      net.mutateBabies();
      
      //background(140); //ce hoces, da puscajo sled (broken atm)
   }else{
      net.update();
      net.show();
   }
  }
  if(keyPressed)
    if(key == 's'){
      output.flush();
      print("STEPS SAVED");
    }
}

void actionPerformed (GUIEvent e) {
  if (e.getSource() == b1) {
    menu.show("play");
    startGame = true;
    
  } 
  else if (e.getMessage().equals("Completed")) {
    pop = int(t1.getValue());
    println( "POPULATION OF " + pop + " HAS BEEN SET" );
    net = new Population(pop);
    showMessageDialog(null, "Population of " + pop + " has been set.", "Info", INFORMATION_MESSAGE);
  }
}
