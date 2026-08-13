// arduino-autonomous-car-10weeks · Tuần 09 · Bài 11: Code Python / Python Code.
const unsigned long intervalMs = 650;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("11 - Code Python / Python Code"); }
}
