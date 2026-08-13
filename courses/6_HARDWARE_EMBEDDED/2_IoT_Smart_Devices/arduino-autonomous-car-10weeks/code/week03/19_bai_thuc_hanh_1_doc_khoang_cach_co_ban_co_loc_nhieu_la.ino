// arduino-autonomous-car-10weeks · Tuần 03 · Bài 19: Bài Thực Hành 1: Đọc khoảng cách cơ bản có lọc nhiễu / Lab 1: Basic Distance Reading with .
const unsigned long intervalMs = 1050;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("19 - Bài Thực Hành 1: Đọc khoảng cách cơ bản có lọc nhiễu / Lab 1: Basic Distance Reading with "); }
}
