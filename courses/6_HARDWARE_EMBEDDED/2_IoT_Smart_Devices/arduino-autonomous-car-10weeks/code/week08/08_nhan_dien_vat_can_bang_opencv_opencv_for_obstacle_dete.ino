// arduino-autonomous-car-10weeks · Tuần 08 · Bài 08: Nhận Diện Vật Cản Bằng OpenCV / OpenCV for Obstacle Detection.
const unsigned long intervalMs = 500;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("08 - Nhận Diện Vật Cản Bằng OpenCV / OpenCV for Obstacle Detection"); }
}
