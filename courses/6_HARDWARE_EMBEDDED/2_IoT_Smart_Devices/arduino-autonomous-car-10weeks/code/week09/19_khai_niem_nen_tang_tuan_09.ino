// arduino-autonomous-car-10weeks · Tuần 09 · Bài 19: Khái niệm nền tảng tuần 09.
const unsigned long intervalMs = 1050;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("19 - Khái niệm nền tảng tuần 09"); }
}
