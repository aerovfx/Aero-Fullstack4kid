// arduino-autonomous-car-10weeks · Tuần 09 · Bài 04: Bản Đồ Lưới Trạng Thái (Occupancy Grid Map).
const unsigned long intervalMs = 300;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("04 - Bản Đồ Lưới Trạng Thái (Occupancy Grid Map)"); }
}
