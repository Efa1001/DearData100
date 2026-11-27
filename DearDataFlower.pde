ArrayList<Km> kms = new ArrayList<Km>();
int fastest = 0;

void setup() {
  size(800, 800);
  String[] lines = loadStrings("data.csv");

  for (int i = 1; i < lines.length; i++) {
    String[] t = split(lines[i], ",");
    if (t.length >= 10) {
      float pace = paceToMinutes(t[3]);
      int heartRate = int(t[4]);
      String listening = t[9];
      int run = int(t[1]);
      int energy = int(t[8]);
      String weather = t[6];
      kms.add(new Km(pace, heartRate, listening, run, energy, weather));
    }
  }
    for (int i=0; i<kms.size(); i++){
      if (kms.get(i).pace < kms.get(fastest).pace) {
        fastest = i;
    }
  }
}

void draw() {
  background(250,246,238);
  noStroke();
  for (int i = 0; i < kms.size(); i++) {
    float angle = i*TWO_PI / kms.size() - HALF_PI;
    float x = width/2 + 110*cos(angle);
    float y = height/2 + 110*sin(angle);
    // run ring segment
    float step = TWO_PI/ kms.size();
    boolean newRun = (i==0) || (kms.get(i).run != kms.get(i-1).run);
    float gapStart = newRun ? 0.03 : 0;     // big gap at a new run, tiny gap between km
    noFill();
    strokeCap(SQUARE);
    strokeWeight(16);
    if (kms.get(i).run % 2 == 0) {
      stroke(205,188,150);    // darker beige
    }else{
      stroke(232,220,195);    // lighter beige
    } 
    arc(width/2, height/2, 194, 194, angle - step/2 + gapStart, angle + step/2 + 0.003);
    noStroke();
    kms.get(i).display(x,y,angle);
    if(i == fastest){
      float tipR = 110 + map(kms.get(i).pace, 5, 7.5, 270, 60)+22;
      float sx = width/2 + tipR * cos(angle);
      float sy = height/2 + tipR * sin(angle);
      stroke(0);
      strokeWeight(1.5);
      fill(240,180,0);
      star(sx, sy, 14, 6);
      noStroke();
  }
  }
  fill(0);
  textSize(24);
  text("100 km: Oct - Nov 2026", 30, 40);

//centre
fill(242,215,140);
stroke(200,170,80);
strokeWeight(1.5);
ellipse(width/2, height/2, 170, 170);
noStroke();

fill(0);
textAlign(CENTER, CENTER);
textSize(26);
text("100 km", width/2, height/2 - 12);
textSize(15);
text("28 Runs", width/2, height/2 + 18);
textAlign(LEFT, BASELINE);

// start marker
stroke(120);
strokeWeight(1);
line(width/2 + 4, height/2 - 112, width/2 + 45, height/2 - 165);
noStroke();
fill(90);
textSize(13);
text("Start (Oct 13)", width/2 + 48, height/2 - 168);

fill(70);
textSize(13);
textAlign(CENTER, BASELINE);
text("Inner ring segments = runs  ·  one petal per km, clockwise from the top", width/2, height-40);
text("Colour = listening(red music · blue podcast · grey silence)  ·  length = speed  ·  width = heart rate  ·  faded = low energy  ·  tip dot = weather", width/2, height - 20);
textAlign(LEFT, BASELINE);
}
float paceToMinutes(String pace) {
  String[] parts = split(pace, ":");
  float mins = float(parts[0]);
  float secs = float(parts[1]);
  return mins + secs / 60;
}
void star(float x, float y, float r1, float r2){
beginShape();
for (int k=0; k<10; k++){
float a = -HALF_PI + k * PI/5;
float r = (k%2==0) ? r1 : r2;
vertex(x+r*cos(a), y+r*sin(a));
}
endShape(CLOSE);
}
