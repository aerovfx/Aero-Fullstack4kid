// arduino-autonomous-car-10weeks · Tuần 02 · Bài 07: c) Differential Drive (Dẫn động vi sai / 2 bánh độc lập).
const unsigned long intervalMs = 450;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("07 - c) Differential Drive (Dẫn động vi sai / 2 bánh độc lập)"); }
}
