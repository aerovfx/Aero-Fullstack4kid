// arduino-autonomous-car-10weeks · Tuần 05 · Bài 04: Linh Kiện & Dụng Cụ / Components & Tools.
const unsigned long intervalMs = 300;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("04 - Linh Kiện & Dụng Cụ / Components & Tools"); }
}
