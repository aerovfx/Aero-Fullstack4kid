// iot-robotics-10weeks · Tuần 02 · Bài 10: Code 1: Ultrasonic HC-SR04 Distance Measurement & Moving Average Filter.
const unsigned long intervalMs = 600;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("10 - Code 1: Ultrasonic HC-SR04 Distance Measurement & Moving Average Filter"); }
}
