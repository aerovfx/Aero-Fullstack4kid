// arduino-autonomous-car-10weeks · Tuần 08 · Bài 20: Chuẩn bị môi trường tuần 08.
const unsigned long intervalMs = 1100;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("20 - Chuẩn bị môi trường tuần 08"); }
}
