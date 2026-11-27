class Km{
  float pace;
  int heartRate;
  String listening;
  int run;
  int energy;
  String weather;
  
  Km(float p, int hr, String lis, int r, int eg, String wh){
    pace = p;
    heartRate = hr;
    listening = lis;
    run = r;
    energy = eg;
    weather = wh;
  }
  
  void display(float x, float y, float angle){
    float barH = map(pace,5, 7.5, 270, 60);
    float petalW = map(heartRate, 140, 180, 6, 20);
    petalW = constrain(petalW, 4, 20);
    float alpha = map(energy,3,5,90,255);
    
    if(listening.equals("music")){
    fill(240,100,60,alpha);
  } else if(listening.equals("podcast")){
  fill(60,120,240,alpha);
  }else{
    fill(150,alpha);
  }
  pushMatrix();
  translate(x,y);
  rotate(angle);
  ellipse(barH/2, 0, barH, petalW);
  if (weather.equals("sunny")){
  fill(250,200,0);
  } else if (weather.equals("mild")){
  fill(140,200,120);
  }else if (weather.equals("cloudy")){
  fill(110);
  }else if (weather.equals("rainy")){
  fill(30,60,150);
  }
  ellipse(barH,0,6,6);
  popMatrix();
  }
}
