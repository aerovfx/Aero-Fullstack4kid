// arduino-autonomous-car-10weeks · Tuần 06 · Bài 10: Điều khiển GPIO từ Raspberry Pi / Direct GPIO Control.
const unsigned long intervalMs = 600;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("10 - Điều khiển GPIO từ Raspberry Pi / Direct GPIO Control"); }
}
