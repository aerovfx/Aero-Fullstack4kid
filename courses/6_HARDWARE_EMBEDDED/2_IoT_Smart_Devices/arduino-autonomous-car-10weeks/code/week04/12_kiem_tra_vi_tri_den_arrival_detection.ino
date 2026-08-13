// arduino-autonomous-car-10weeks · Tuần 04 · Bài 12: Kiểm Tra Vị Trí Đến (Arrival Detection).
const unsigned long intervalMs = 700;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("12 - Kiểm Tra Vị Trí Đến (Arrival Detection)"); }
}
