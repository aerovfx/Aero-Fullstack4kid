// iot-robotics-10weeks · Tuần 05 · Bài 14: 3: Tay Cầm Điều Khiển Xe Robot Từ Xa Bằng ESP-NOW (ESP-NOW Remote Controller).
const unsigned long intervalMs = 800;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("14 - 3: Tay Cầm Điều Khiển Xe Robot Từ Xa Bằng ESP-NOW (ESP-NOW Remote Controller)"); }
}
