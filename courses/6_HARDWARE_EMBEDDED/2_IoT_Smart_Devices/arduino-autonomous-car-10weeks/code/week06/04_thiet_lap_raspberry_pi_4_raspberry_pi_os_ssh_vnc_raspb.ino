// arduino-autonomous-car-10weeks · Tuần 06 · Bài 04: Thiết lập Raspberry Pi 4 (Raspberry Pi OS, SSH, VNC) / Raspberry Pi 4 Setup.
const unsigned long intervalMs = 300;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("04 - Thiết lập Raspberry Pi 4 (Raspberry Pi OS, SSH, VNC) / Raspberry Pi 4 Setup"); }
}
