// iot-robotics-10weeks · Tuần 08 · Bài 12: 🟢 Phần A: Bài Tập Cơ Bản (Basic Level).
const unsigned long intervalMs = 700;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("12 - 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)"); }
}
