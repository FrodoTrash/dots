class Brain{
  PVector[] smeri;
  int step = 0;
  
  Brain(int size){
    smeri = new PVector[size];
    randomize();
  }
  
  void randomize(){
    for(int i=0; i<smeri.length; i++){
      float randomAngle = random(2*PI);
      smeri[i] = PVector.fromAngle(randomAngle);
    }
  }
  
  Brain clone(){
    Brain clone = new Brain(smeri.length);
    for(int i=0; i < smeri.length; i++){
      clone.smeri[i] = smeri[i].copy();
    }
    return clone;
  }
  
  
  void mutate(){
    float mutationRate = 0.01;
    for(int i=0; i<smeri.length; i++){
      float rand = random(1);
      if(rand < mutationRate){
        float randomAngle = random(2*PI);
        smeri[i] = PVector.fromAngle(randomAngle);
      }
    }
  }
}
