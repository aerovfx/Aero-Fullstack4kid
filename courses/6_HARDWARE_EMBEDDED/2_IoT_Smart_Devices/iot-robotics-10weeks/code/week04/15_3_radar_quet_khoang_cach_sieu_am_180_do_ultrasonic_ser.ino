// iot-robotics-10weeks · Tuần 04 · Bài 15: 3: Radar Quét Khoảng Cách Siêu Âm 180 Độ (Ultrasonic Servo Radar).
const unsigned long intervalMs = 850;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("15 - 3: Radar Quét Khoảng Cách Siêu Âm 180 Độ (Ultrasonic Servo Radar)"); }
}
