// arduino-autonomous-car-10weeks · Tuần 01 · Bài 13: Bước 1: An Toàn Nhất Là Không Cấp Nguồn Mù / Step 1: Safety First - No Blind Powering.
const unsigned long intervalMs = 750;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("13 - Bước 1: An Toàn Nhất Là Không Cấp Nguồn Mù / Step 1: Safety First - No Blind Powering"); }
}
