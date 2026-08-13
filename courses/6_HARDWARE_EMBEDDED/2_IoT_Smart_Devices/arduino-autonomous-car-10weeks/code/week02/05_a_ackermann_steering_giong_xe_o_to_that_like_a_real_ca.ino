// arduino-autonomous-car-10weeks · Tuần 02 · Bài 05: a) Ackermann Steering (Giống xe ô tô thật / Like a real car).
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - a) Ackermann Steering (Giống xe ô tô thật / Like a real car)"); }
}
