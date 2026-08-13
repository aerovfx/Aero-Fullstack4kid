// iot-robotics-10weeks · Tuần 01 · Bài 13: Code 2: Non-blocking Button Interrupt with Debounce.
const unsigned long intervalMs = 750;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("13 - Code 2: Non-blocking Button Interrupt with Debounce"); }
}
