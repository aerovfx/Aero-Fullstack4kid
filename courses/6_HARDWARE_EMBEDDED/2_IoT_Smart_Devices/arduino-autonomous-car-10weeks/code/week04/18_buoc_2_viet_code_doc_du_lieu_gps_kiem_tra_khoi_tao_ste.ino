// arduino-autonomous-car-10weeks · Tuần 04 · Bài 18: Bước 2: Viết Code Đọc Dữ Liệu GPS & Kiểm Tra Khởi Tạo / Step 2: Write GPS Reading Code.
const unsigned long intervalMs = 1000;
unsigned long previousMs = 0;
void setup() { Serial.begin(115200); }
void loop() {
  const unsigned long now = millis();
  if (now - previousMs >= intervalMs) { previousMs = now; Serial.println("18 - Bước 2: Viết Code Đọc Dữ Liệu GPS & Kiểm Tra Khởi Tạo / Step 2: Write GPS Reading Code"); }
}
