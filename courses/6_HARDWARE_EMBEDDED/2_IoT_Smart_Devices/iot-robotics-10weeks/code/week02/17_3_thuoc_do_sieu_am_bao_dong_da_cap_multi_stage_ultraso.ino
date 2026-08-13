// iot-robotics-10weeks · Tuần 02 · Bài 17: 3: Thước Đo Siêu Âm Báo Động Đa Cấp (Multi-stage Ultrasonic Parking Sensor).
const unsigned long intervalMs = 950;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("17 - 3: Thước Đo Siêu Âm Báo Động Đa Cấp (Multi-stage Ultrasonic Parking Sensor)"); }
}
