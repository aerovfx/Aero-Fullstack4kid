// iot-robotics-10weeks · Tuần 03 · Bài 08: Code 1: OLED SSD1306 & MPU6050 Angle Monitor via I2C Bus.
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Code 1: OLED SSD1306 & MPU6050 Angle Monitor via I2C Bus"); }
}
