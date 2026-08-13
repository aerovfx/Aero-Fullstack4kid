// iot-robotics-10weeks · Tuần 05 · Bài 08: Câu Hỏi Thảo Luận / Discussion.
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Câu Hỏi Thảo Luận / Discussion"); }
}
