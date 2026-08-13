// iot-robotics-10weeks · Tuần 08 · Bài 11: Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework.
const unsigned long intervalMs = 650;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("11 - Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework"); }
}
