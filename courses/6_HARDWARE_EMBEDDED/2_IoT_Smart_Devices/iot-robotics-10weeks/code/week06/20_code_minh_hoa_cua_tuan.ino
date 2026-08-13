// iot-robotics-10weeks · Tuần 06 · Bài 20: code minh họa của tuần.
const unsigned long intervalMs = 1100;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("20 - code minh họa của tuần"); }
}
