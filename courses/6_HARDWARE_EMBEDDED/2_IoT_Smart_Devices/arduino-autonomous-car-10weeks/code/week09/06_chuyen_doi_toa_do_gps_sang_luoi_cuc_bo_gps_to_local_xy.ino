// arduino-autonomous-car-10weeks · Tuần 09 · Bài 06: Chuyển Đổi Tọa Độ GPS Sang Lưới Cục Bộ (GPS to Local XY Transformation).
const unsigned long intervalMs = 400;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("06 - Chuyển Đổi Tọa Độ GPS Sang Lưới Cục Bộ (GPS to Local XY Transformation)"); }
}
