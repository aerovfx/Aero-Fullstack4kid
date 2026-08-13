// arduino-autonomous-car-10weeks · Tuần 07 · Bài 12: Giao Tiếp Cảm Biến / Sensor Interface (sensors.py).
const unsigned long intervalMs = 700;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("12 - Giao Tiếp Cảm Biến / Sensor Interface (sensors.py)"); }
}
