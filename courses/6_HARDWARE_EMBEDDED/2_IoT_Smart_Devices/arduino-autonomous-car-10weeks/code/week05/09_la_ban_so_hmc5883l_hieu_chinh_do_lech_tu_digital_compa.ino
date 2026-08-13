// arduino-autonomous-car-10weeks · Tuần 05 · Bài 09: La bàn số HMC5883L & Hiệu chỉnh Độ Lệch Từ (Digital Compass & Magnetic Declination).
const unsigned long intervalMs = 550;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("09 - La bàn số HMC5883L & Hiệu chỉnh Độ Lệch Từ (Digital Compass & Magnetic Declination)"); }
}
