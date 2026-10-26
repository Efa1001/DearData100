ArrayList<Km> kms = new ArrayList<Km>();

void setup() {
  size(800, 400);
  String[] lines = loadStrings("data.csv");

  for (int i = 1; i < lines.length; i++) {
    String[] t = split(lines[i], ",");
    if (t.length >= 10) {
      float pace = paceToMinutes(t[3]);
      int heartRate = int(t[4]);
      String listening = t[9];
      kms.add(new Km(pace, heartRate, listening));
    }
  }
}

void draw() {
  background(250);
  noStroke();
  for (int i = 0; i < kms.size(); i++) {
    float x = map(i, 0, kms.size(), 50, width - 50);
    kms.get(i).display(x);
  }
}

float paceToMinutes(String pace) {
  String[] parts = split(pace, ":");
  float mins = float(parts[0]);
  float secs = float(parts[1]);
  return mins + secs / 60;
}
