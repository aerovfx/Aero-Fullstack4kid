// arduino-autonomous-car-10weeks · Tuần 01 · Bài 05: Các cấp độ tự hành (SAE J3016) / Levels of Autonomy (SAE J3016).
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - Các cấp độ tự hành (SAE J3016) / Levels of Autonomy (SAE J3016)"); }
}
