// iot-robotics-10weeks · Tuần 03 · Bài 05: So Sánh Giao Thức UART, I2C và SPI / Serial Protocols Comparison.
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - So Sánh Giao Thức UART, I2C và SPI / Serial Protocols Comparison"); }
}
