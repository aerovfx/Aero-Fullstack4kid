// arduino-autonomous-car-10weeks · Tuần 10 · Bài 07: Track A: Xe Khảo Sát Vườn / Garden Surveyor.
const unsigned long intervalMs = 450;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("07 - Track A: Xe Khảo Sát Vườn / Garden Surveyor"); }
}
