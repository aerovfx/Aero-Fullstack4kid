// arduino-autonomous-car-10weeks · Tuần 03 · Bài 20: Bài Thực Hành 2: Radar Chống Va Chạm (Servo Scanner) / Lab 2: Anti-Collision Radar.
const unsigned long intervalMs = 1100;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("20 - Bài Thực Hành 2: Radar Chống Va Chạm (Servo Scanner) / Lab 2: Anti-Collision Radar"); }
}
