// iot-robotics-10weeks · Tuần 03 · Bài 17: 4: Giả Lập MPU6050 + OLED SSD1306 Trên Wokwi Online.
const unsigned long intervalMs = 950;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("17 - 4: Giả Lập MPU6050 + OLED SSD1306 Trên Wokwi Online"); }
}
