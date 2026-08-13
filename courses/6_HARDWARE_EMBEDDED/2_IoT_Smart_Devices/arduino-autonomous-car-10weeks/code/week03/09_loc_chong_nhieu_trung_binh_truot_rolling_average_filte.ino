// arduino-autonomous-car-10weeks · Tuần 03 · Bài 09: Lọc Chống Nhiễu Trung Bình Trượt / Rolling Average Filter.
const unsigned long intervalMs = 550;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("09 - Lọc Chống Nhiễu Trung Bình Trượt / Rolling Average Filter"); }
}
