// arduino-autonomous-car-10weeks · Tuần 09 · Bài 05: Xây Dựng Bản Đồ Khi Đang Di Chuyển (Simultaneous Mapping).
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - Xây Dựng Bản Đồ Khi Đang Di Chuyển (Simultaneous Mapping)"); }
}
