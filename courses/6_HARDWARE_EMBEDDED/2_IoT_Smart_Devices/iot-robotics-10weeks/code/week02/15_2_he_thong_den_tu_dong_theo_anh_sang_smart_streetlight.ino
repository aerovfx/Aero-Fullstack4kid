// iot-robotics-10weeks · Tuần 02 · Bài 15: 2: Hệ Thống Đèn Tự Động Theo Ánh Sáng (Smart Streetlight).
const unsigned long intervalMs = 850;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("15 - 2: Hệ Thống Đèn Tự Động Theo Ánh Sáng (Smart Streetlight)"); }
}
