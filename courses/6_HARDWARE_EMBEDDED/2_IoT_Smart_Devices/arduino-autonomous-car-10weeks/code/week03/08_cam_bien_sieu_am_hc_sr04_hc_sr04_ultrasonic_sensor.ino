// arduino-autonomous-car-10weeks · Tuần 03 · Bài 08: Cảm Biến Siêu Âm HC-SR04 / HC-SR04 Ultrasonic Sensor.
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Cảm Biến Siêu Âm HC-SR04 / HC-SR04 Ultrasonic Sensor"); }
}
