// arduino-autonomous-car-10weeks · Tuần 08 · Bài 09: Cỗ Máy Trạng Thái Tránh Vật Cản / Avoidance Behavior State Machine.
const unsigned long intervalMs = 550;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("09 - Cỗ Máy Trạng Thái Tránh Vật Cản / Avoidance Behavior State Machine"); }
}
