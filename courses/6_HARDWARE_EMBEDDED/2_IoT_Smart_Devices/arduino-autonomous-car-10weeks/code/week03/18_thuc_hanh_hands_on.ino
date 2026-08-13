// arduino-autonomous-car-10weeks · Tuần 03 · Bài 18: Thực Hành / Hands-On.
const unsigned long intervalMs = 1000;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("18 - Thực Hành / Hands-On"); }
}
