// iot-robotics-10weeks · Tuần 01 · Bài 18: 2: Điều Khiển Bật/Tắt 2 LED Độc Lập Bằng 2 Nút Nhấn.
const unsigned long intervalMs = 1000;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("18 - 2: Điều Khiển Bật/Tắt 2 LED Độc Lập Bằng 2 Nút Nhấn"); }
}
