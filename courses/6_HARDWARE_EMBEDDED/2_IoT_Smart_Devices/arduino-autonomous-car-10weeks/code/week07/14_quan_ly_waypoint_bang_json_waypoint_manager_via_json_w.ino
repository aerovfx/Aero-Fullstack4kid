// arduino-autonomous-car-10weeks · Tuần 07 · Bài 14: Quản Lý Waypoint Bằng JSON / Waypoint Manager via JSON (waypointmanager.py).
const unsigned long intervalMs = 800;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("14 - Quản Lý Waypoint Bằng JSON / Waypoint Manager via JSON (waypointmanager.py)"); }
}
