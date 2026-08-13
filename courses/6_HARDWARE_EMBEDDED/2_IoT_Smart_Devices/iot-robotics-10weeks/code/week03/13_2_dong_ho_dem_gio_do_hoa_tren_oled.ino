// iot-robotics-10weeks · Tuần 03 · Bài 13: 2: Đồng Hồ Đếm Giờ Đồ Họa Trên OLED.
const unsigned long intervalMs = 750;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("13 - 2: Đồng Hồ Đếm Giờ Đồ Họa Trên OLED"); }
}
