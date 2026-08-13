// arduino-autonomous-car-10weeks · Tuần 03 · Bài 05: Tính Khoảng Cách Từ Thời Gian Tiếng Vang / Calculating Distance from Echo Time.
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - Tính Khoảng Cách Từ Thời Gian Tiếng Vang / Calculating Distance from Echo Time"); }
}
