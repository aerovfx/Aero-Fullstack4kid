// arduino-autonomous-car-10weeks · Tuần 04 · Bài 02: Linh Kiện & Dụng Cụ / Components & Tools.
const unsigned long intervalMs = 200;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("02 - Linh Kiện & Dụng Cụ / Components & Tools"); }
}
