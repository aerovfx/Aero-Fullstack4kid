// arduino-autonomous-car-10weeks · Tuần 09 · Bài 13: Bài Tập Thực Hành (Exercises).
const unsigned long intervalMs = 750;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("13 - Bài Tập Thực Hành (Exercises)"); }
}
