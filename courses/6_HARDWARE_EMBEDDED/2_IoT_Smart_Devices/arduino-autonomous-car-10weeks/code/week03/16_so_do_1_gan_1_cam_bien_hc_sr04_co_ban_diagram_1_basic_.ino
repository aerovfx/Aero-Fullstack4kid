// arduino-autonomous-car-10weeks · Tuần 03 · Bài 16: Sơ đồ 1: Gắn 1 Cảm biến HC-SR04 cơ bản / Diagram 1: Basic 1 HC-SR04 Wiring.
const unsigned long intervalMs = 900;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("16 - Sơ đồ 1: Gắn 1 Cảm biến HC-SR04 cơ bản / Diagram 1: Basic 1 HC-SR04 Wiring"); }
}
