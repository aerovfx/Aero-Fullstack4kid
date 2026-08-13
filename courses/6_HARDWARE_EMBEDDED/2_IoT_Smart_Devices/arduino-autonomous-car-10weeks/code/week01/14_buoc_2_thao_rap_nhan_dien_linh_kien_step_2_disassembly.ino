// arduino-autonomous-car-10weeks · Tuần 01 · Bài 14: Bước 2: Tháo Ráp & Nhận Diện Linh Kiện / Step 2: Disassembly & Identification Lab.
const unsigned long intervalMs = 800;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("14 - Bước 2: Tháo Ráp & Nhận Diện Linh Kiện / Step 2: Disassembly & Identification Lab"); }
}
