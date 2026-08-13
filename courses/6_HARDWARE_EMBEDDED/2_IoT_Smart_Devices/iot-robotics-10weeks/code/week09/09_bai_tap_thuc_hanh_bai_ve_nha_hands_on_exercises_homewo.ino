// iot-robotics-10weeks · Tuần 09 · Bài 09: Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework.
const unsigned long intervalMs = 550;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("09 - Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework"); }
}
