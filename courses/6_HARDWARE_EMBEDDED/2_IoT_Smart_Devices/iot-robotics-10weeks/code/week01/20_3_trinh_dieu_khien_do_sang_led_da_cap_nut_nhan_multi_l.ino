// iot-robotics-10weeks · Tuần 01 · Bài 20: 3: Trình Điều Khiển Độ Sáng LED Đa Cấp Nút Nhấn (Multi-level Brightness Controller).
const unsigned long intervalMs = 1100;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("20 - 3: Trình Điều Khiển Độ Sáng LED Đa Cấp Nút Nhấn (Multi-level Brightness Controller)"); }
}
