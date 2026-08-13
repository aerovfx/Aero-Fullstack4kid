// iot-robotics-10weeks · Tuần 10 · Bài 19: Xử lý trường hợp biên tuần 10.
const unsigned long intervalMs = 1050;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("19 - Xử lý trường hợp biên tuần 10"); }
}
