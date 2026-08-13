// arduino-autonomous-car-10weeks · Tuần 10 · Bài 03: Công Cụ & Phần Mềm / Tools & Software.
const unsigned long intervalMs = 250;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("03 - Công Cụ & Phần Mềm / Tools & Software"); }
}
