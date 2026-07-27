import os

BASE_DIR_SCRATCH = "/Users/dangvietchung/Aero-Fullstack4kid/courses/0_CS_FUNDAMENTALS/scratch-10weeks"

lessons_scratch = [
    ("Làm quen giao diện & Tọa độ", "Giới thiệu sân khấu (Stage), nhân vật (Sprite) và các khối lệnh di chuyển cơ bản (Motion). Hiểu trục tọa độ X và Y."),
    ("Vòng lặp & Sự kiện", "Sử dụng lá cờ xanh (Green flag), khối lệnh lặp (Repeat / Forever). Làm nhân vật nhảy múa liên tục."),
    ("Trang phục (Costumes) & Âm thanh", "Thay đổi hình dáng nhân vật để tạo hoạt ảnh (Animation). Chèn nhạc nền và hiệu ứng âm thanh."),
    ("Câu lệnh điều kiện & Cảm biến", "Sử dụng khối If-Else và Sensing (Chạm vào màu sắc, chạm vào nhân vật khác). Làm game mèo đuổi chuột."),
    ("Biến số (Variables) - Điểm & Thời gian", "Khái niệm lưu trữ dữ liệu. Tạo biến Score (tăng điểm khi ăn táo) và Timer (đếm ngược thời gian)."),
    ("Trọng lực & Vật lý cơ bản", "Mô phỏng lực hút trái đất. Tạo game Flappy Bird đơn giản với cơ chế nhảy lên và tự động rơi xuống."),
    ("Hàm (My Blocks) & Tái sử dụng code", "Tạo khối lệnh tùy chỉnh để gom nhóm các đoạn code lặp đi lặp lại. Làm code ngắn gọn và dễ hiểu hơn."),
    ("Bản sao (Clones)", "Sử dụng tính năng Clone để tạo ra hàng loạt quái vật, chướng ngại vật hoặc đạn bắn mà không cần nhân bản Sprite."),
    ("Game nhiều người chơi (Local Multiplayer)", "Sử dụng 2 bộ phím điều khiển (WASD và Phím mũi tên). Thiết kế game đối kháng hoặc đua xe 2 người chơi trên 1 máy tính."),
    ("Hoàn thiện & Chia sẻ dự án", "Tổng hợp kiến thức. Gắn thêm màn hình Bắt đầu (Start Screen) và Kết thúc (Game Over). Xuất bản dự án lên cộng đồng Scratch.")
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
- Cung cấp hình ảnh kéo thả các khối lệnh.

## 3. Mã giả mô phỏng (Pseudo-code)
- Mô tả logic của các khối lệnh.

## 4. Thử thách (Challenge)
- Các bé tự thêm tính năng mới cho trò chơi.
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_SCRATCH, 
        "Nhập Môn Lập Trình: Scratch (Dành cho thiếu nhi)", 
        "Khoá học lập trình trực quan (Block-based) giúp các bé rèn luyện tư duy logic, sự kiện và vòng lặp qua việc tự tay thiết kế game và hoạt hình tương tác.",
        lessons_scratch,
        "Đại Chiến Không Gian (Space Shooter)",
        "Thiết kế trò chơi bắn phi thuyền. Có nhân vật chính di chuyển bằng chuột, tự động bắn đạn (Clone). Có thiên thạch rơi ngẫu nhiên, hệ thống tính điểm, âm thanh cháy nổ và màn hình Game Over khi bị thiên thạch chạm trúng."
    )
    print("Successfully generated Scratch course.")

if __name__ == "__main__":
    main()
