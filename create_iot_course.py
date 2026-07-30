import os

BASE_DIR_IOT = "/Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/iot-robotics-10weeks"

lessons_iot = [
    ("Nhập môn Điện tử & Arduino", "Làm quen linh kiện điện tử (Resistor, LED, Breadboard). Giới thiệu vi điều khiển Arduino UNO và Arduino IDE. Chớp tắt LED."),
    ("Lập trình C++ cơ bản cho nhúng", "Biến, kiểu dữ liệu, vòng lặp (for, while). Cấu trúc setup() và loop(). Điều khiển nhiều đèn LED bằng vòng lặp."),
    ("Tín hiệu Số (Digital) & Nút nhấn", "Đọc tín hiệu Digital (HIGH/LOW) từ nút nhấn (Button). Xử lý chống rung phím (Debounce) bằng phần mềm."),
    ("Tín hiệu Tương tự (Analog) & Cảm biến Ánh sáng", "Đọc tín hiệu Analog (0-1023) từ quang trở (LDR). Điều khiển độ sáng đèn tự động theo môi trường (PWM)."),
    ("Màn hình hiển thị & Cảm biến Nhiệt độ", "Sử dụng màn hình LCD/OLED qua giao tiếp I2C. Đọc cảm biến nhiệt độ DHT11 và hiển thị dữ liệu lên màn hình."),
    ("Động cơ Servo & Radar cơ bản", "Điều khiển góc quay (0-180 độ) của động cơ Servo. Kết hợp cảm biến siêu âm HC-SR04 để làm radar phát hiện vật cản."),
    ("Lắp ráp Robot Dò Line (Line Follower)", "Tìm hiểu mạch cầu H (L298N) điều khiển động cơ DC. Sử dụng cảm biến hồng ngoại (IR) để bám vạch đen."),
    ("ESP32 & Nhập môn Internet of Things", "Chuyển sang vi điều khiển ESP32. Kết nối WiFi, tạo một Web Server đơn giản trên ESP32 để điều khiển đèn qua trình duyệt."),
    ("Giao thức MQTT & Gửi dữ liệu lên Cloud", "Sử dụng giao thức MQTT kết nối với Broker (Mosquitto/Adafruit IO). Gửi dữ liệu nhiệt độ lên bảng điều khiển (Dashboard)."),
    ("Hoàn thiện hệ thống Nhà Thông Minh (Smart Home)", "Tích hợp toàn bộ cảm biến (Nhiệt độ, Cửa, Đèn) lên ESP32. Điều khiển và giám sát qua ứng dụng điện thoại (Blynk).")
]

def create_directory(path):
    os.makedirs(path, exist_ok=True)

def write_file(path, content):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

def generate_course(base_dir, title, desc, lessons, project_title, project_desc):
    print(f"Creating course at {base_dir}")
    create_directory(base_dir)
    create_directory(os.path.join(base_dir, "lessons"))
    create_directory(os.path.join(base_dir, "projects"))

    index_content = f"""# {title}

{desc}

## Cấu trúc thư mục
- \`schedule.md\`: Lộ trình chi tiết 10 tuần.
- \`lessons/\`: Các bài giảng lý thuyết và bài tập thực hành.
- \`projects/\`: Đồ án cuối khoá.
"""
    write_file(os.path.join(base_dir, "INDEX.md"), index_content)

    schedule_content = f"# Lộ trình {title} (10 Tuần)\n\n"
    for i, (l_title, l_desc) in enumerate(lessons):
        schedule_content += f"## Tuần {i+1}: {l_title}\n- {l_desc}\n- [Chi tiết bài học](lessons/week{i+1:02d}.md)\n\n"
    write_file(os.path.join(base_dir, "schedule.md"), schedule_content)

    for i, (l_title, l_desc) in enumerate(lessons):
        week_num = i + 1
        lesson_content = f"""# Tuần {week_num}: {l_title}

## 1. Mục tiêu bài học
- {l_desc}

## 2. Hướng dẫn lắp mạch (Wiring)
- Hướng dẫn cắm chân linh kiện trên Breadboard (Sơ đồ Fritzing).

## 3. Mã nguồn C++ (Arduino/ESP32)
- Cung cấp mã nguồn điều khiển vi điều khiển.

## 4. Thử thách (Challenge)
- Bài tập nâng cấp tính năng cho thiết bị.
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_IOT, 
        "Phần Cứng & IoT: Từ Arduino đến Smart Home", 
        "Hành trình bước ra khỏi thế giới phần mềm ảo, tự tay lập trình vi điều khiển C++ (Arduino/ESP32) để điều khiển linh kiện điện tử vật lý, robot và kết nối vạn vật (IoT).",
        lessons_iot,
        "Mô Hình Nhà Kính Thông Minh (Smart Greenhouse)",
        "Xây dựng một hệ thống IoT hoàn chỉnh bằng ESP32. Tự động đọc nhiệt độ, độ ẩm đất. Tự động bơm nước khi đất khô, bật quạt khi trời nóng. Giám sát toàn bộ dữ liệu qua Dashboard trên nền tảng Cloud."
    )
    print("Successfully generated IoT Hardware course.")

if __name__ == "__main__":
    main()
