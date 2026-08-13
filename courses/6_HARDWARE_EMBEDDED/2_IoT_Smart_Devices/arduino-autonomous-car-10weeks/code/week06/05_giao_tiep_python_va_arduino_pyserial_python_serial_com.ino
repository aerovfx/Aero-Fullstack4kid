// arduino-autonomous-car-10weeks · Tuần 06 · Bài 05: Giao tiếp Python và Arduino (pyserial) / Python Serial Communication with Arduino.
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - Giao tiếp Python và Arduino (pyserial) / Python Serial Communication with Arduino"); }
}
