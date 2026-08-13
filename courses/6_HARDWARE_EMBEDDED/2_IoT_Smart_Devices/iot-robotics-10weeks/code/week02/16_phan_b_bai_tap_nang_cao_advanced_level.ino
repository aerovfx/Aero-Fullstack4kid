// iot-robotics-10weeks · Tuần 02 · Bài 16: 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level).
const unsigned long intervalMs = 900;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("16 - 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)"); }
}
