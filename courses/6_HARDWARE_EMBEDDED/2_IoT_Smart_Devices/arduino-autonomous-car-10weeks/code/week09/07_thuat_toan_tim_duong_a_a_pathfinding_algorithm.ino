// arduino-autonomous-car-10weeks · Tuần 09 · Bài 07: Thuật Toán Tìm Đường A (A Pathfinding Algorithm).
const unsigned long intervalMs = 450;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("07 - Thuật Toán Tìm Đường A (A Pathfinding Algorithm)"); }
}
