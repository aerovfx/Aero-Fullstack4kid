// arduino-autonomous-car-10weeks · Tuần 03 · Bài 06: Ví dụ Tính Toán / Worked Example.
const unsigned long intervalMs = 400;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("06 - Ví dụ Tính Toán / Worked Example"); }
}
