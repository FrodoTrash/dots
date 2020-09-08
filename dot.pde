class Dot{
  PVector location;
  PVector speed;
  PVector pospesek;
  
  Brain brain; 
  float fitness = 0;
  
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;

  
  Dot(){
    brain = new Brain(400);
  
    location = new PVector(width/2, height-10);
    speed = new PVector(0, 0);
    pospesek = new PVector(0, 0);
  }


  void show(){
    if(isBest){
      fill(0,255,0);
      ellipse(location.x, location.y, 9, 9);
    }
    else{
      fill(0);
      ellipse(location.x, location.y, 4, 4);
    }
  }

  void move(){
    if(brain.smeri.length > brain.step){
      pospesek = brain.smeri[brain.step];
      brain.step++;
    }
    else 
      dead = true;
     
    speed.add(pospesek);
    speed.limit(5);
    location.add(speed);
  }


  void update(){
    if(!dead && !reachedGoal){
      move();
      
      if(location.x<2 || location.y<2 ||  location.x>width-2 || location.y>height -2)
        dead = true;
      else if(dist(location.x, location.y, goal.x, goal.y) <5)
        reachedGoal= true;
      else if(location.x < 700 && location.y < 310 && location.x > 100 && location.y > 300) //100 x, 300 y, 600 dolzina, 10 visina
        dead = true;
      //else if(location.x < 500 && location.y < 150 && location.x > 50 && location.y > 300) // dolzina, ,visina
        //dead = true;
    }
  }


  void calculateFitness(){
    if(reachedGoal)
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
      
    else{
      float distanceToGoal = dist(location.x, location.y, goal.x, goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  }
  
  /*OLD FITNESS FUNCTION*/
  /*
    if(reachedGoal)
      fitness = 1.0/(float)(brain.step * brain.step);
      
    else{
      float distanceToGoal = dist(location.x, location.y, goal.x, goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
  */


  Dot gimmeBaby(){
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
  }
}
