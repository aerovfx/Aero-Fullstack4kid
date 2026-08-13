// arduino-autonomous-car-10weeks · Tuần 05 · Bài 07: Sự trôi của Gyroscope và Lọc Dữ Liệu (Gyro Drift & Filtering).
const unsigned long intervalMs = 450;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("07 - Sự trôi của Gyroscope và Lọc Dữ Liệu (Gyro Drift & Filtering)"); }
}
