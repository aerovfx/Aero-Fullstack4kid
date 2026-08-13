// iot-robotics-10weeks · Tuần 10 · Bài 14: Chuẩn bị môi trường tuần 10.
const unsigned long intervalMs = 800;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("14 - Chuẩn bị môi trường tuần 10"); }
}
