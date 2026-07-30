import os

BASE_DIR_MOBILE = "/Users/dangvietchung/Aero-Fullstack4kid/courses/10_MOBILE_DEV/react-native-10weeks"
BASE_DIR_GAME = "/Users/dangvietchung/Aero-Fullstack4kid/courses/11_GAME_DEV/unity-csharp-10weeks"

lessons_mobile = [
    ("Nhập môn React Native & Expo", "Cài đặt môi trường phát triển Expo CLI, chạy ứng dụng đầu tiên trên điện thoại (Expo Go) và hiểu sự khác biệt giữa DOM và Native Components."),
    ("Core Components & Styling", "Sử dụng View, Text, Image, ScrollView, TextInput. Áp dụng StyleSheet và Flexbox để bố cục giao diện linh hoạt (Responsive)."),
    ("State & Props trong Mobile", "Quản lý trạng thái bằng useState, truyền dữ liệu bằng Props, vòng đời ứng dụng cơ bản."),
    ("Điều hướng (Navigation)", "Cài đặt React Navigation. Thiết lập Stack Navigator (chuyển trang) và Tab Navigator (thanh menu dưới đáy)."),
    ("Làm việc với List & Dữ liệu lớn", "Tối ưu hóa hiệu năng danh sách dài với FlatList và SectionList. Tuỳ biến giao diện từng phần tử (List Item)."),
    ("Kết nối API & Bất đồng bộ", "Sử dụng fetch/axios gọi RESTful API. Xử lý trạng thái Loading, hiển thị dữ liệu từ máy chủ và xử lý lỗi mạng."),
    ("Lưu trữ cục bộ (Local Storage)", "Lưu trạng thái offline bằng AsyncStorage. Lưu thông tin đăng nhập, điểm số hoặc cài đặt người dùng."),
    ("Sử dụng Native Modules", "Tích hợp thư viện truy cập phần cứng: Camera, Thư viện ảnh, GPS (Location) và cảm biến cơ bản."),
    ("Hoàn thiện Ứng dụng & UI/UX", "Thêm hiệu ứng Animation (Animated API). Làm đẹp giao diện với thư viện UI như React Native Paper hoặc NativeBase."),
    ("Đóng gói & Xuất bản Ứng dụng", "Tạo file APK/AAB cho Android và cấu hình build iOS. Chuẩn bị đưa ứng dụng lên Google Play và App Store.")
]

lessons_game = [
    ("Nhập môn Game Dev & Unity Engine", "Cài đặt Unity Hub, Editor. Làm quen giao diện Scene, Game, Hierarchy, Inspector. Khái niệm GameObject và Component."),
    ("Cơ bản về C# trong Unity", "Tạo script C#. Biến, Kiểu dữ liệu, Câu lệnh điều kiện (if/else), Vòng lặp. Khai báo biến hiển thị trên Inspector (SerializeField)."),
    ("Điều khiển nhân vật 2D", "Transform.Translate, lấy Input từ bàn phím (Input.GetAxis). Code di chuyển nhân vật sang trái/phải, nhảy (Jump)."),
    ("Hệ thống Vật lý (Physics 2D)", "Gắn Rigidbody2D và Collider2D. Xử lý trọng lực, va chạm (OnCollisionEnter2D, OnTriggerEnter2D). Tránh lỗi xuyên tường."),
    ("Animation 2D & Sprite", "Cắt Sprite Sheet. Tạo Animation Clip (Idle, Run, Jump). Sử dụng Animator Controller và thiết lập Parameters chuyển đổi trạng thái."),
    ("Tạo môi trường (Tilemap) & Camera", "Xây dựng màn chơi bằng Tilemap/Grid. Cấu hình Cinemachine để Camera tự động bám theo nhân vật chính."),
    ("Giao diện Người dùng (UI)", "Canvas, Text, Button, Image. Tạo màn hình Menu chính (Main Menu), hiển thị Điểm số (Score), và màn hình Game Over."),
    ("Quản lý Màn chơi (Scene Management)", "Chuyển cảnh giữa Menu và Game bằng SceneManager. Load/Reload màn chơi, xử lý trạng thái tạm dừng (Pause)."),
    ("Âm thanh (Audio) & Hiệu ứng hạt (Particle)", "Gắn AudioSource phát nhạc nền và hiệu ứng (SFX). Tạo Particle System cho hiệu ứng cháy nổ, ăn tiền."),
    ("Tối ưu hóa & Xuất Game (Build)", "Khái niệm Prefab, Object Pooling (tối ưu đạn bắn). Build game ra file .exe (Windows), WebGL (chơi trên trình duyệt) hoặc Android APK.")
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

    # INDEX.md
    index_content = f"""# {title}

{desc}

## Cấu trúc thư mục
- \`schedule.md\`: Lộ trình chi tiết 10 tuần.
- \`lessons/\`: Các bài giảng lý thuyết và bài tập thực hành.
- \`projects/\`: Đồ án cuối khoá.
"""
    write_file(os.path.join(base_dir, "INDEX.md"), index_content)

    # schedule.md
    schedule_content = f"# Lộ trình {title} (10 Tuần)\n\n"
    for i, (l_title, l_desc) in enumerate(lessons):
        schedule_content += f"## Tuần {i+1}: {l_title}\n- {l_desc}\n- [Chi tiết bài học](lessons/week{i+1:02d}.md)\n\n"
    write_file(os.path.join(base_dir, "schedule.md"), schedule_content)

    # lessons
    for i, (l_title, l_desc) in enumerate(lessons):
        week_num = i + 1
        lesson_content = f"""# Tuần {week_num}: {l_title}

## 1. Mục tiêu bài học
- {l_desc}

## 2. Hướng dẫn thực hành (Hands-on)
- Trình bày từng bước thực hiện trên dự án mẫu.
- Chú ý các lỗi thường gặp (Common pitfalls).

## 3. Mã nguồn tham khảo (Code Snippets)
- Đưa các đoạn mã nguồn quan trọng (C# hoặc JavaScript/React) vào đây.

## 4. Thử thách (Challenge)
- Bài tập nhỏ rèn luyện cuối buổi.
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    # final_project.md
    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_MOBILE, 
        "Lập Trình Di Động: React Native", 
        "Học cách phát triển ứng dụng di động đa nền tảng (iOS & Android) từ một mã nguồn duy nhất bằng JavaScript/React.",
        lessons_mobile,
        "Ứng Dụng Quản Lý Công Việc & Thời Gian (Todo/Timer App)",
        "Xây dựng một ứng dụng cho phép người dùng thêm/sửa/xoá công việc, lưu trạng thái offline, có đồng hồ đếm ngược Pomodoro và cảnh báo bằng âm thanh."
    )

    generate_course(
        BASE_DIR_GAME, 
        "Lập Trình Game: Unity 2D & C#", 
        "Bắt đầu hành trình làm game chuyên nghiệp bằng Unity Engine. Học cách viết kịch bản C#, xử lý vật lý và tạo ra thế giới tương tác.",
        lessons_game,
        "Siêu Phẩm Game Đi Cảnh 2D (Platformer)",
        "Xây dựng một trò chơi có nhân vật chính di chuyển qua các chướng ngại vật, ăn tiền vàng, tiêu diệt quái thú (AI cơ bản) và hệ thống màn chơi nối tiếp nhau."
    )

    print("Successfully generated Mobile and Game courses.")

if __name__ == "__main__":
    main()
