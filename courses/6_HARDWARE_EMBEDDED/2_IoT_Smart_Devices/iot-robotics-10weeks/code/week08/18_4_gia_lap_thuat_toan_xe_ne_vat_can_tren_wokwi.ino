// iot-robotics-10weeks · Tuần 08 · Bài 18: 4: Giả Lập Thuật Toán Xe Né Vật Cản Trên Wokwi.
const unsigned long intervalMs = 1000;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("18 - 4: Giả Lập Thuật Toán Xe Né Vật Cản Trên Wokwi"); }
}
