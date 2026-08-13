// arduino-autonomous-car-10weeks · Tuần 04 · Bài 04: Hệ Thống GPS Hoạt Động Như Thế Nào? / How GPS Works: Satellites & Trilateration.
const unsigned long intervalMs = 300;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("04 - Hệ Thống GPS Hoạt Động Như Thế Nào? / How GPS Works: Satellites & Trilateration"); }
}
