// arduino-autonomous-car-10weeks · Tuần 05 · Bài 20: Câu Hỏi Thảo Luận / Discussion.
const unsigned long intervalMs = 1100;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("20 - Câu Hỏi Thảo Luận / Discussion"); }
}
