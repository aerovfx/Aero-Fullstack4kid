// iot-robotics-10weeks · Tuần 06 · Bài 08: Code 1: ESP32 MQTT Telemetry Publisher & Subscriber.
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Code 1: ESP32 MQTT Telemetry Publisher & Subscriber"); }
}
