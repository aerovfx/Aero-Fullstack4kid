// arduino-autonomous-car-10weeks · Tuần 10 · Bài 09: Track C: Robot Hút Bụi (Roomba-style Cleaner).
const unsigned long intervalMs = 550;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("09 - Track C: Robot Hút Bụi (Roomba-style Cleaner)"); }
}
