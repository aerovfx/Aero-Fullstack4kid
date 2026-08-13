// iot-robotics-10weeks · Tuần 08 · Bài 06: Tiếng Việt.
const unsigned long intervalMs = 400;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("06 - Tiếng Việt"); }
}
