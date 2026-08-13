// iot-robotics-10weeks · Tuần 08 · Bài 09: Code 1: Autonomous Obstacle Avoidance Robot Algorithm.
const unsigned long intervalMs = 550;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("09 - Code 1: Autonomous Obstacle Avoidance Robot Algorithm"); }
}
