// arduino-autonomous-car-10weeks · Tuần 02 · Bài 16: Bước 2: Đi dây điện (Wiring).
const unsigned long intervalMs = 900;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("16 - Bước 2: Đi dây điện (Wiring)"); }
}
