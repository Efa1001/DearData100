class Km{
  float pace;
  int heartRate;
  String listening;
  
  Km(float p, int hr, String lis){
    pace = p;
    heartRate = hr;
    listening = lis;
  }
  
  void display(float x){
    float barH = map(pace,5, 7.5, 300, 50);
    
    if(listening.equals("music")){
    fill(240,100,60);
  } else if(listening.equals("podcast")){
  fill(60,120,240);
  }else{
    fill(150);
  }
  
  rect(x,height - 50 - barH, 15, barH);
  }
  
}
