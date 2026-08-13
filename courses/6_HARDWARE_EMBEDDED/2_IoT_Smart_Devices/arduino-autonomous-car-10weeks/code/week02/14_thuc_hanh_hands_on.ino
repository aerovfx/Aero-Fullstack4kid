// arduino-autonomous-car-10weeks · Tuần 02 · Bài 14: Thực Hành / Hands-On.
const unsigned long intervalMs = 800;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("14 - Thực Hành / Hands-On"); }
}
