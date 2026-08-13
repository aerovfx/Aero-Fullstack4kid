// arduino-autonomous-car-10weeks · Tuần 02 · Bài 06: b) 4WD / 4-Wheel Drive (Dẫn động 4 bánh).
const unsigned long intervalMs = 400;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("06 - b) 4WD / 4-Wheel Drive (Dẫn động 4 bánh)"); }
}
