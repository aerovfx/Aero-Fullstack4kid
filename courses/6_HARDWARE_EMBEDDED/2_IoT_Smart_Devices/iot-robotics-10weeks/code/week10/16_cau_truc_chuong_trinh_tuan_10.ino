// iot-robotics-10weeks · Tuần 10 · Bài 16: Cấu trúc chương trình tuần 10.
const unsigned long intervalMs = 900;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("16 - Cấu trúc chương trình tuần 10"); }
}
