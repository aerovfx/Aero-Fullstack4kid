import os

BASE_DIR_UIUX = "/Users/dangvietchung/Aero-Fullstack4kid/courses/5_GRAPHICS_HCI/1_UI_UX_Design/ui-ux-design-10weeks"

lessons_uiux = [
    ("Nhập môn UI/UX & Design Thinking", "Sự khác biệt giữa UI (User Interface) và UX (User Experience). Quy trình Design Thinking: Empathize, Define, Ideate, Prototype, Test."),
    ("Nghiên cứu Người dùng (User Research) & Persona", "Thiết kế xoay quanh con người. Cách phỏng vấn người dùng, tạo chân dung khách hàng (User Persona) và lập bản đồ hành trình (User Journey Map)."),
    ("Kiến trúc Thông tin (Information Architecture) & Wireframe", "Tổ chức nội dung ứng dụng hợp lý. Phác thảo giao diện thô (Low-fidelity Wireframe) bằng giấy hoặc công cụ Whimsical."),
    ("Làm quen với Figma & Nguyên lý Thiết kế", "Giao diện và công cụ cơ bản của Figma. Các nguyên lý thị giác: Căn chỉnh (Alignment), Tương phản (Contrast), Không gian trắng (White Space)."),
    ("Màu sắc, Nghệ thuật Chữ (Typography) & Iconography", "Tâm lý học màu sắc. Cách chọn font chữ dễ đọc cho màn hình. Thiết kế hoặc sử dụng hệ thống Icon đồng bộ."),
    ("Hệ thống Thiết kế (Design Systems) & Components", "Tạo các thành phần tái sử dụng (Components) trong Figma. Xây dựng thư viện phong cách (Style Guide) để duy trì sự nhất quán."),
    ("Auto Layout & Thiết kế Đáp ứng (Responsive Design)", "Sử dụng tính năng Auto Layout trong Figma để thiết kế giao diện tự động co giãn linh hoạt trên Mobile, Tablet, và Desktop."),
    ("Tạo Mẫu Tương tác (Prototyping) & Micro-interactions", "Biến các thiết kế tĩnh thành bản mẫu có thể click được (High-fidelity Prototype). Thêm các hiệu ứng chuyển động nhỏ (Micro-interactions)."),
    ("Kiểm thử Người dùng (Usability Testing) & Bàn giao", "Sử dụng các công cụ như Maze để kiểm thử bản mẫu với người dùng thật. Quy trình Handoff (bàn giao tài nguyên) cho đội ngũ Lập trình (Dev Team)."),
    ("Đồ án cuối khoá: Thiết kế Ứng dụng Di động Toàn diện", "Áp dụng toàn bộ quy trình từ Research đến Prototype để thiết kế một ứng dụng di động hoàn chỉnh giải quyết một vấn đề thực tế.")
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
- \`lessons/\`: Lý thuyết tâm lý học người dùng và thực hành thiết kế Figma.
- \`projects/\`: Đồ án cuối khoá thiết kế UI/UX hoàn chỉnh.
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

## 2. Công cụ Thực hành (Figma/Miro)
- Hướng dẫn chi tiết các tính năng công cụ liên quan đến bài học.

## 3. Case Study Thực tế
- Phân tích UX/UI của một ứng dụng nổi tiếng (ví dụ: Spotify, Airbnb) để rút ra bài học.

## 4. Bài tập (Challenge)
- Thực hiện một mini-project trong Figma (ví dụ: redesign màn hình Login).
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_UIUX, 
        "Thiết kế Giao diện & Trải nghiệm Người dùng (UI/UX Design)", 
        "Học cách tư duy như một nhà thiết kế sản phẩm. Từ nghiên cứu hành vi con người đến việc sử dụng Figma tạo ra các nguyên mẫu tương tác (Interactive Prototypes) đẹp mắt và tiện dụng.",
        lessons_uiux,
        "Thiết kế Ứng dụng Quản lý Sức Khoẻ Tinh Thần",
        "Học viên sẽ tự chọn một nhóm đối tượng, thực hiện User Research, phác thảo Wireframe, xây dựng hệ thống Design System chuẩn chỉnh trên Figma và xuất bản một Prototype 10-15 màn hình có thể tương tác đầy đủ, sẵn sàng bàn giao cho Developer."
    )
    print("Successfully generated UI/UX course.")

if __name__ == "__main__":
    main()
