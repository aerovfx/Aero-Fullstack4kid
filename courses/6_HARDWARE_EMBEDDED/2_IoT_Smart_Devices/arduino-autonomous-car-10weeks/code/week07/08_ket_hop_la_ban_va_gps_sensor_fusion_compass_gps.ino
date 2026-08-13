// arduino-autonomous-car-10weeks · Tuần 07 · Bài 08: Kết hợp La Bàn và GPS (Sensor Fusion: Compass & GPS).
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Kết hợp La Bàn và GPS (Sensor Fusion: Compass & GPS)"); }
}
