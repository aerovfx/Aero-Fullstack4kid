// iot-robotics-10weeks · Tuần 10 · Bài 13: Thuật ngữ quan trọng tuần 10.
const unsigned long intervalMs = 750;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("13 - Thuật ngữ quan trọng tuần 10"); }
}
