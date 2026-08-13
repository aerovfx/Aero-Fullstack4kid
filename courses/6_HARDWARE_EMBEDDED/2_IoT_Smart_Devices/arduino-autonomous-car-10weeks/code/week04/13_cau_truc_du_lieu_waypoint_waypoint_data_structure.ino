// arduino-autonomous-car-10weeks · Tuần 04 · Bài 13: Cấu Trúc Dữ Liệu Waypoint / Waypoint Data Structure.
const unsigned long intervalMs = 750;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("13 - Cấu Trúc Dữ Liệu Waypoint / Waypoint Data Structure"); }
}
