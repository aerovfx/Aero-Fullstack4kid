// iot-robotics-10weeks · Tuần 01 · Bài 19: 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level).
const unsigned long intervalMs = 1050;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("19 - 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)"); }
}
