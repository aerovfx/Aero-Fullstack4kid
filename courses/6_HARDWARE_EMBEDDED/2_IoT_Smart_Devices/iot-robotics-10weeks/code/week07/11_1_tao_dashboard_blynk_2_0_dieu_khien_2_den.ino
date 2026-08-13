// iot-robotics-10weeks · Tuần 07 · Bài 11: 1: Tạo Dashboard Blynk 2.0 Điều Khiển 2 Đèn.
const unsigned long intervalMs = 650;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("11 - 1: Tạo Dashboard Blynk 2.0 Điều Khiển 2 Đèn"); }
}
