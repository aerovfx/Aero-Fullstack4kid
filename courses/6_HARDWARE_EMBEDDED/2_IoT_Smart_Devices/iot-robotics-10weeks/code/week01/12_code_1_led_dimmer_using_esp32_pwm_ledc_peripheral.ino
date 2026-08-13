// iot-robotics-10weeks · Tuần 01 · Bài 12: Code 1: LED Dimmer using ESP32 PWM (LEDC Peripheral).
const unsigned long intervalMs = 700;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("12 - Code 1: LED Dimmer using ESP32 PWM (LEDC Peripheral)"); }
}
