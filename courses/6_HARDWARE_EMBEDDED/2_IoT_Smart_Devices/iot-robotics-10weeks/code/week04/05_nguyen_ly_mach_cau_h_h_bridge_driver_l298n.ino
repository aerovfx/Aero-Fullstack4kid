// iot-robotics-10weeks · Tuần 04 · Bài 05: Nguyên Lý Mạch Cầu H (H-Bridge Driver L298N).
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - Nguyên Lý Mạch Cầu H (H-Bridge Driver L298N)"); }
}
