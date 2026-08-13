// arduino-autonomous-car-10weeks · Tuần 01 · Bài 08: Kiến Trúc Phần Cứng (Hardware Layers).
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Kiến Trúc Phần Cứng (Hardware Layers)"); }
}
