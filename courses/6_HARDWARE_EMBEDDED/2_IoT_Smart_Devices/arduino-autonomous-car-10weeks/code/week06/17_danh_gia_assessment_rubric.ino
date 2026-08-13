// arduino-autonomous-car-10weeks · Tuần 06 · Bài 17: Đánh Giá / Assessment Rubric.
const unsigned long intervalMs = 950;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("17 - Đánh Giá / Assessment Rubric"); }
}
