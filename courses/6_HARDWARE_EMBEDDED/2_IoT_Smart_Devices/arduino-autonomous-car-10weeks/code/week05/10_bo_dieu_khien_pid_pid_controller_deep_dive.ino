// arduino-autonomous-car-10weeks · Tuần 05 · Bài 10: Bộ Điều Khiển PID (PID Controller Deep Dive).
const unsigned long intervalMs = 600;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("10 - Bộ Điều Khiển PID (PID Controller Deep Dive)"); }
}
