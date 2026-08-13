// arduino-autonomous-car-10weeks · Tuần 08 · Bài 05: Các Thuật Toán Bug: Bug0, Bug1, Bug2 (Bug Algorithms).
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - Các Thuật Toán Bug: Bug0, Bug1, Bug2 (Bug Algorithms)"); }
}
