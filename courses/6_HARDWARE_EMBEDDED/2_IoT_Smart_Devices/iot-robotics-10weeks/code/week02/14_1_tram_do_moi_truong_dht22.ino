// iot-robotics-10weeks · Tuần 02 · Bài 14: 1: Trạm Đo Môi Trường DHT22.
const unsigned long intervalMs = 800;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("14 - 1: Trạm Đo Môi Trường DHT22"); }
}
