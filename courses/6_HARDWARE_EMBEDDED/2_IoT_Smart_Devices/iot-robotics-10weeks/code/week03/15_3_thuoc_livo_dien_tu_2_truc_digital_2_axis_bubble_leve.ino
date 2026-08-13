// iot-robotics-10weeks · Tuần 03 · Bài 15: 3: Thước Livo Điện Tử 2 Trục (Digital 2-Axis Bubble Level).
const unsigned long intervalMs = 850;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("15 - 3: Thước Livo Điện Tử 2 Trục (Digital 2-Axis Bubble Level)"); }
}
