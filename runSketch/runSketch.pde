String[] lines;

void setup () {
  lines = loadStrings("data.csv");
  String[]t=split(lines[1], ",");
  printArray(t);
  println(paceToMinutes(t[3]));
}
float paceToMinutes(String pace){
  String[] parts = split(pace, ":");
  float mins = float(parts[0]);
  float secs = float(parts[1]);
  return mins + secs/60;
}
