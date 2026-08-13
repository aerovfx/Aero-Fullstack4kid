// arduino-autonomous-car-10weeks · Tuần 08 · Bài 04: Phân Loại Các Chiến Lược Tránh Vật Cản / Classification of Obstacle Avoidance Strategies.
const unsigned long intervalMs = 300;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("04 - Phân Loại Các Chiến Lược Tránh Vật Cản / Classification of Obstacle Avoidance Strategies"); }
}
