// arduino-autonomous-car-10weeks · Tuần 01 · Bài 16: Bước 4: Chạy Code Arduino Đầu Tiên / Step 4: First Arduino Run.
const unsigned long intervalMs = 900;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("16 - Bước 4: Chạy Code Arduino Đầu Tiên / Step 4: First Arduino Run"); }
}
