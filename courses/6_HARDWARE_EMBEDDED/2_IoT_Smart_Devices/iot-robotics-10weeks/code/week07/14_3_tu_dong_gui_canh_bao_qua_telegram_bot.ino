// iot-robotics-10weeks · Tuần 07 · Bài 14: 3: Tự Động Gửi Cảnh Báo Qua Telegram Bot.
const unsigned long intervalMs = 800;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("14 - 3: Tự Động Gửi Cảnh Báo Qua Telegram Bot"); }
}
