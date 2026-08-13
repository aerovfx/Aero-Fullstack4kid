// arduino-autonomous-car-10weeks · Tuần 05 · Bài 06: Cảm biến MPU-6050 (IMU).
const unsigned long intervalMs = 400;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("06 - Cảm biến MPU-6050 (IMU)"); }
}
