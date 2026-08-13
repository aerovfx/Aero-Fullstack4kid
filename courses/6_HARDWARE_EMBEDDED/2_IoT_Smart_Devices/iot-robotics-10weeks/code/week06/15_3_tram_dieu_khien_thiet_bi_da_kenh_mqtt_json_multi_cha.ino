// iot-robotics-10weeks · Tuần 06 · Bài 15: 3: Trạm Điều Khiển Thiết Bị Đa Kênh MQTT JSON (Multi-channel MQTT Controller).
const unsigned long intervalMs = 850;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("15 - 3: Trạm Điều Khiển Thiết Bị Đa Kênh MQTT JSON (Multi-channel MQTT Controller)"); }
}
