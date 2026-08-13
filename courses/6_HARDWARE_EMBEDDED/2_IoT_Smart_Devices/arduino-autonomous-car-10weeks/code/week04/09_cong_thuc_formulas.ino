// arduino-autonomous-car-10weeks · Tuần 04 · Bài 09: Công Thức / Formulas.
const unsigned long intervalMs = 550;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("09 - Công Thức / Formulas"); }
}
