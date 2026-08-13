// arduino-autonomous-car-10weeks · Tuần 03 · Bài 15: Sơ Đồ Kết Nối / Wiring Diagram.
const unsigned long intervalMs = 850;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("15 - Sơ Đồ Kết Nối / Wiring Diagram"); }
}
