// arduino-autonomous-car-10weeks · Tuần 06 · Bài 11: Giao diện điều khiển Web (Flask) / Web Interface with Flask.
const unsigned long intervalMs = 650;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("11 - Giao diện điều khiển Web (Flask) / Web Interface with Flask"); }
}
