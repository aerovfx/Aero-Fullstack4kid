// arduino-autonomous-car-10weeks · Tuần 03 · Bài 10: Chiến Lược Đặt Mảng 3 Cảm Biến / 3-Sensor Array Placement Strategy.
const unsigned long intervalMs = 600;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("10 - Chiến Lược Đặt Mảng 3 Cảm Biến / 3-Sensor Array Placement Strategy"); }
}
