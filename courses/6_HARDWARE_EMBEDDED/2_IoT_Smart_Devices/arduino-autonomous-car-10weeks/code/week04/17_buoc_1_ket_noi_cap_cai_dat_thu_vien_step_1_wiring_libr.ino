// arduino-autonomous-car-10weeks · Tuần 04 · Bài 17: Bước 1: Kết Nối Cáp & Cài Đặt Thư Viện / Step 1: Wiring & Library Setup.
const unsigned long intervalMs = 950;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("17 - Bước 1: Kết Nối Cáp & Cài Đặt Thư Viện / Step 1: Wiring & Library Setup"); }
}
