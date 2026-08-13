// iot-robotics-10weeks · Tuần 09 · Bài 18: Đánh Giá / Assessment Rubric.
const unsigned long intervalMs = 1000;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("18 - Đánh Giá / Assessment Rubric"); }
}
