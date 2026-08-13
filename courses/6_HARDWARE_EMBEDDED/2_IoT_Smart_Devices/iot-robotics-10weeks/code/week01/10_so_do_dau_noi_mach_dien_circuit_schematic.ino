// iot-robotics-10weeks · Tuần 01 · Bài 10: Sơ Đồ Đấu Nối Mạch Điện / Circuit Schematic.
const unsigned long intervalMs = 600;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("10 - Sơ Đồ Đấu Nối Mạch Điện / Circuit Schematic"); }
}
