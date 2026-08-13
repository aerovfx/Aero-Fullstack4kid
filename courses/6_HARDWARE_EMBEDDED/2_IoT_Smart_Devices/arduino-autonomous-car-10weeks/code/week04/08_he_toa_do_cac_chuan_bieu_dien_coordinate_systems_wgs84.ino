// arduino-autonomous-car-10weeks · Tuần 04 · Bài 08: Hệ Tọa Độ & Các Chuẩn Biểu Diễn / Coordinate Systems: WGS84, Decimal Degrees vs DMS.
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Hệ Tọa Độ & Các Chuẩn Biểu Diễn / Coordinate Systems: WGS84, Decimal Degrees vs DMS"); }
}
