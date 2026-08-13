// iot-robotics-10weeks · Tuần 09 · Bài 11: 1: Thu Thập Chuỗi Dữ Liệu Gia Tốc MPU6050.
const unsigned long intervalMs = 650;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("11 - 1: Thu Thập Chuỗi Dữ Liệu Gia Tốc MPU6050"); }
}
