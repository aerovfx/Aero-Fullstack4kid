// iot-robotics-10weeks · Tuần 06 · Bài 12: 1: Đóng Gói Chuỗi JSON Cảm Biến Với ArduinoJson.
const unsigned long intervalMs = 700;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("12 - 1: Đóng Gói Chuỗi JSON Cảm Biến Với ArduinoJson"); }
}
