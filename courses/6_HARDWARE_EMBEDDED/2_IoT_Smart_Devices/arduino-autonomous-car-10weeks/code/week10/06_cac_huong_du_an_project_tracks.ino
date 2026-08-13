// arduino-autonomous-car-10weeks · Tuần 10 · Bài 06: Các Hướng Dự Án / Project Tracks.
const unsigned long intervalMs = 400;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("06 - Các Hướng Dự Án / Project Tracks"); }
}
