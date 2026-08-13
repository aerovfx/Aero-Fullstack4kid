// arduino-autonomous-car-10weeks · Tuần 04 · Bài 07: Phân Tích NMEA Với TinyGPS++ / Parsing NMEA with TinyGPS++.
const unsigned long intervalMs = 450;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("07 - Phân Tích NMEA Với TinyGPS++ / Parsing NMEA with TinyGPS++"); }
}
