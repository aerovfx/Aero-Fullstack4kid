// arduino-autonomous-car-10weeks · Tuần 07 · Bài 19: Đánh Giá / Assessment Rubric.
const unsigned long intervalMs = 1050;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("19 - Đánh Giá / Assessment Rubric"); }
}
