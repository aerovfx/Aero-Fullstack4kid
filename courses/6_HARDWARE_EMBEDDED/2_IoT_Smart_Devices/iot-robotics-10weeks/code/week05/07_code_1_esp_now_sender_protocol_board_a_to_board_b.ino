// iot-robotics-10weeks · Tuần 05 · Bài 07: Code 1: ESP-NOW Sender Protocol (Board A to Board B).
const unsigned long intervalMs = 450;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("07 - Code 1: ESP-NOW Sender Protocol (Board A to Board B)"); }
}
