// iot-robotics-10weeks · Tuần 01 · Bài 06: Tổng Quan Kiến Trúc Vi Điều Khiển ESP32 / ESP32 Architecture.
const unsigned long intervalMs = 400;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("06 - Tổng Quan Kiến Trúc Vi Điều Khiển ESP32 / ESP32 Architecture"); }
}
