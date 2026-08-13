// iot-robotics-10weeks · Tuần 05 · Bài 12: 2: Đọc MAC Address Của ESP32.
const unsigned long intervalMs = 700;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("12 - 2: Đọc MAC Address Của ESP32"); }
}
