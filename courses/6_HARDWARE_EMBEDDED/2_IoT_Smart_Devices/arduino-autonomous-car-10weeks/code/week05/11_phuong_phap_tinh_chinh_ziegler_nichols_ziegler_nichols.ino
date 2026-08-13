// arduino-autonomous-car-10weeks · Tuần 05 · Bài 11: Phương pháp tinh chỉnh Ziegler-Nichols (Ziegler-Nichols Tuning Method).
const unsigned long intervalMs = 650;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("11 - Phương pháp tinh chỉnh Ziegler-Nichols (Ziegler-Nichols Tuning Method)"); }
}
