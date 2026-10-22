String[] lines;

void setup(){
  size(800,400);
  lines=loadStrings("data.csv");
}

void draw(){
  background(250);
  noStroke();
  fill(100);
  
  for (int i=1; i<lines.length; i++){
    String[] t= split(lines[i], ",");
    float pace = paceToMinutes(t[3]);
    float barH = map(pace, 5, 7.5, 300, 50);
    float x = map(i, 1, lines.length, 50, width-50);
    if (t[9].equals("music")){
    fill(240, 100,60);
    } else if (t[9].equals("podcast")){
    fill(60,120,240);
    }else{
      fill(150);
    }
    rect(x,height - 50 - barH, 15, barH);
  }
}

float paceToMinutes(String pace){
  String[] parts = split(pace, ":");
  float mins = float(parts[0]);
  float secs = float(parts[1]);
  return mins+secs/60;
}

  
