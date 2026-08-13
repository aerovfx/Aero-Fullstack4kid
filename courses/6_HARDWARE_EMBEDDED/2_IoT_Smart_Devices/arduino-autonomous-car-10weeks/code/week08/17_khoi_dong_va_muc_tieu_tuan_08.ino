// arduino-autonomous-car-10weeks · Tuần 08 · Bài 17: Khởi động và mục tiêu tuần 08.
const unsigned long intervalMs = 950;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("17 - Khởi động và mục tiêu tuần 08"); }
}
