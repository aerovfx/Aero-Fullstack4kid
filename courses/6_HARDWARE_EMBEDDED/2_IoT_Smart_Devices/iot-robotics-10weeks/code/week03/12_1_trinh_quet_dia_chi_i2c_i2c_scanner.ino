// iot-robotics-10weeks · Tuần 03 · Bài 12: 1: Trình Quét Địa Chỉ I2C (I2C Scanner).
const unsigned long intervalMs = 700;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("12 - 1: Trình Quét Địa Chỉ I2C (I2C Scanner)"); }
}
