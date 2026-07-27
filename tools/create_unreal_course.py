import os

BASE_DIR_UNREAL = "/Users/dangvietchung/Aero-Fullstack4kid/courses/11_GAME_DEV/unreal-rpg-10weeks"

lessons_unreal = [
    ("Nhập môn UE5 & Cấu trúc Project", "Khởi tạo dự án C++ Third Person. Làm quen giao diện Editor, hệ thống chiếu sáng Lumen và hình học ảo hoá Nanite."),
    ("Lập trình C++ trong Unreal", "Khái niệm UCLASS, UPROPERTY, UFUNCTION. Kế thừa từ class AActor và ACharacter. Biên dịch code (Live Coding)."),
    ("Di chuyển nhân vật (Enhanced Input)", "Thiết lập Input Mapping Context (IMC). Lập trình C++ di chuyển đa hướng và xoay Camera bằng chuột (Mouse Look)."),
    ("Hệ thống Animation cơ bản", "Khái niệm Skeletal Mesh. Animation Blueprint, State Machine, Retargeting Animation từ Mixamo sang Mannequin UE5."),
    ("Cơ chế Chiến đấu (Melee Combat)", "Sử dụng Animation Montages cho các đòn đánh liên tiếp (Combo). Sử dụng Anim Notifies để kích hoạt logic tại thời điểm cụ thể của hoạt ảnh."),
    ("Tránh né (Dodge/Roll) & Thể lực (Stamina)", "Cơ chế quản lý chỉ số Stamina. Khóa hướng nhân vật (Lock-on targeting) giống Dark Souls."),
    ("Hệ thống Sát thương & Xử lý va chạm", "Sử dụng Line Trace (Raycast) dọc theo lưỡi kiếm để phát hiện va chạm cực kỳ chính xác (Hitbox thay vì Capsule Overlap). Truyền Damage Data."),
    ("Trí Tuệ Nhân Tạo (Enemy AI)", "Navigation Mesh. Sử dụng Behavior Trees và Blackboard để lập trình AI quái vật (Tuần tra, Phát hiện người chơi, Tấn công)."),
    ("Trùm Cuối (Boss Fight & Phases)", "Thiết kế cơ chế Boss với nhiều kỹ năng. Chuyển đổi Phase khi Boss dưới 50% máu (Tăng tốc độ, đổi vũ khí)."),
    ("Đánh bóng Game & Đóng gói (Packaging)", "Thêm hiệu ứng Niagara (Máu văng, tia lửa). Thiết kế UI (Thanh máu, Stamina) bằng UMG. Đóng gói game ra file thực thi (.exe).")
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

## 2. Hướng dẫn thực hành (Hands-on)
- Trình bày từng bước thiết lập Node Blueprint hoặc viết mã C++ tương ứng.

## 3. Mã nguồn tham khảo (C++ Snippets)
- Đưa các đoạn mã nguồn C++ quan trọng vào đây.

## 4. Thử thách (Challenge)
- Bài tập rèn luyện tư duy thiết kế.
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_UNREAL, 
        "Unreal Engine 5 & C++: 3D RPG (Soulslike)", 
        "Kết hợp sức mạnh của lập trình C++ và hệ thống Blueprint để xây dựng một tựa game nhập vai hành động 3D có cơ chế chiến đấu phức tạp.",
        lessons_unreal,
        "Đấu Trường Sinh Tử (Boss Fight Arena)",
        "Hoàn thiện một vòng lặp chiến đấu đầy đủ: Người chơi bước vào đấu trường, né tránh các đòn tấn công diện rộng của Boss, quản lý thanh thể lực và phản công để giành chiến thắng."
    )
    print("Successfully generated Unreal Engine course.")

if __name__ == "__main__":
    main()
