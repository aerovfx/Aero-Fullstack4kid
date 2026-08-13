// arduino-autonomous-car-10weeks · Tuần 04 · Bài 05: Giao Tiếp Với Module NEO-6M & Giao Thức UART / Communicating with NEO-6M via UART.
const unsigned long intervalMs = 350;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("05 - Giao Tiếp Với Module NEO-6M & Giao Thức UART / Communicating with NEO-6M via UART"); }
}
