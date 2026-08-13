// arduino-autonomous-car-10weeks · Tuần 05 · Bài 18: Bước 4: Kiểm tra tích hợp hệ thống (System Integration Test & Pre-Run Checklist).
const unsigned long intervalMs = 1000;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("18 - Bước 4: Kiểm tra tích hợp hệ thống (System Integration Test & Pre-Run Checklist)"); }
}
