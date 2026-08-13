// arduino-autonomous-car-10weeks · Tuần 08 · Bài 19: Thuật ngữ quan trọng tuần 08.
const unsigned long intervalMs = 1050;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("19 - Thuật ngữ quan trọng tuần 08"); }
}
