// arduino-autonomous-car-10weeks · Tuần 07 · Bài 04: Tổng Quan về Hệ Thống Định Vị Toàn Cầu (GPS) / Overview of Global Positioning System (GPS).
const unsigned long intervalMs = 300;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("04 - Tổng Quan về Hệ Thống Định Vị Toàn Cầu (GPS) / Overview of Global Positioning System (GPS)"); }
}
