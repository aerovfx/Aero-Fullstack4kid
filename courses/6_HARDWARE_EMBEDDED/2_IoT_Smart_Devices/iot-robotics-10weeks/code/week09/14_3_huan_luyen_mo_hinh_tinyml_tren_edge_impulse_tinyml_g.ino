// iot-robotics-10weeks · Tuần 09 · Bài 14: 3: Huấn Luyện Mô Hình TinyML Trên Edge Impulse (TinyML Gesture Recognition).
const unsigned long intervalMs = 800;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("14 - 3: Huấn Luyện Mô Hình TinyML Trên Edge Impulse (TinyML Gesture Recognition)"); }
}
