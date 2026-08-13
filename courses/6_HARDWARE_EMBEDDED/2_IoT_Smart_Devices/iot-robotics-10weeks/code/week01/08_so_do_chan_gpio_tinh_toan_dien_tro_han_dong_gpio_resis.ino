// iot-robotics-10weeks · Tuần 01 · Bài 08: Sơ Đồ Chân GPIO & Tính Toán Điện Trở Hạn Dòng / GPIO & Resistor Calculation.
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Sơ Đồ Chân GPIO & Tính Toán Điện Trở Hạn Dòng / GPIO & Resistor Calculation"); }
}
