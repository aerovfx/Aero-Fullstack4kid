// arduino-autonomous-car-10weeks · Tuần 03 · Bài 13: Xây Dựng Hệ Thống Quét Lidar Với Servo / Building a Lidar-like Scanner with Servo.
const unsigned long intervalMs = 750;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("13 - Xây Dựng Hệ Thống Quét Lidar Với Servo / Building a Lidar-like Scanner with Servo"); }
}
