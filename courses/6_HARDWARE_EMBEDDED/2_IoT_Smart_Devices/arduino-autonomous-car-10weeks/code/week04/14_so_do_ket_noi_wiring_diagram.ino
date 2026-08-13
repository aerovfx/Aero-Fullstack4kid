// arduino-autonomous-car-10weeks · Tuần 04 · Bài 14: Sơ Đồ Kết Nối / Wiring Diagram.
const unsigned long intervalMs = 800;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("14 - Sơ Đồ Kết Nối / Wiring Diagram"); }
}
