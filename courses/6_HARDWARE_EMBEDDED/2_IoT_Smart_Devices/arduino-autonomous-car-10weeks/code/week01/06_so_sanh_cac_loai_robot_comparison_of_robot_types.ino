// arduino-autonomous-car-10weeks · Tuần 01 · Bài 06: So Sánh Các Loại Robot / Comparison of Robot Types.
const unsigned long intervalMs = 400;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("06 - So Sánh Các Loại Robot / Comparison of Robot Types"); }
}
