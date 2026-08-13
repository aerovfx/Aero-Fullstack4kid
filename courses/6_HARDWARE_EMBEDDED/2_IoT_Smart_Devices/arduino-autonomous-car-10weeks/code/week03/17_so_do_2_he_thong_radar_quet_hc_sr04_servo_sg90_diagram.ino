// arduino-autonomous-car-10weeks · Tuần 03 · Bài 17: Sơ đồ 2: Hệ Thống Radar Quét (HC-SR04 + Servo SG90) / Diagram 2: Scanning Radar System.
const unsigned long intervalMs = 950;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("17 - Sơ đồ 2: Hệ Thống Radar Quét (HC-SR04 + Servo SG90) / Diagram 2: Scanning Radar System"); }
}
