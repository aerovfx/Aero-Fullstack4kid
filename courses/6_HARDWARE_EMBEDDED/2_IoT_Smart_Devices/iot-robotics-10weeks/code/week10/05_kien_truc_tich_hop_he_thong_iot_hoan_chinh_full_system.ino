// iot-robotics-10weeks · Tuần 10 · Bài 05: Kiến Trúc Tích Hợp Hệ Thống IoT Hoàn Chỉnh / Full System Architecture.
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - Kiến Trúc Tích Hợp Hệ Thống IoT Hoàn Chỉnh / Full System Architecture"); }
}
