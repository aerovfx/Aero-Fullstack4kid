// arduino-autonomous-car-10weeks · Tuần 05 · Bài 02: Tiếng Việt (Vietnamese).
const unsigned long intervalMs = 200;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("02 - Tiếng Việt (Vietnamese)"); }
}
