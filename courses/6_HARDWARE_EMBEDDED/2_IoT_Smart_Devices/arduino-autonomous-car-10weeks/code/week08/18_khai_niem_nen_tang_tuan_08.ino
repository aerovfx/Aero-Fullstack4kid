// arduino-autonomous-car-10weeks · Tuần 08 · Bài 18: Khái niệm nền tảng tuần 08.
const unsigned long intervalMs = 1000;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("18 - Khái niệm nền tảng tuần 08"); }
}
