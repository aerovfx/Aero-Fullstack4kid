// iot-robotics-10weeks · Tuần 10 · Bài 08: Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix.
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix"); }
}
