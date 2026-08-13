// iot-robotics-10weeks · Tuần 08 · Bài 13: 1: Lập Trình Các Chuyển Động Động Học Cơ Bản.
const unsigned long intervalMs = 750;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("13 - 1: Lập Trình Các Chuyển Động Động Học Cơ Bản"); }
}
