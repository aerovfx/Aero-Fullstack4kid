// arduino-autonomous-car-10weeks · Tuần 06 · Bài 19: Khởi động và mục tiêu tuần 06.
const unsigned long intervalMs = 1050;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("19 - Khởi động và mục tiêu tuần 06"); }
}
