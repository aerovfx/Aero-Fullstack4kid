import os

BASE_DIR_CV = "/Users/dangvietchung/Aero-Fullstack4kid/courses/1_AI_DATA_SCIENCE/computer-vision-10weeks"

lessons_cv = [
    ("Nhập môn Thị giác máy tính & OpenCV", "Tìm hiểu cách máy tính 'nhìn' hình ảnh. Đọc, hiển thị và lưu ảnh, video bằng thư viện OpenCV trên Python."),
    ("Xử lý ảnh cơ bản (Image Processing)", "Thao tác trên ma trận điểm ảnh. Đổi hệ màu (RGB sang Grayscale/HSV), thay đổi kích thước, cắt ghép ảnh."),
    ("Lọc ảnh (Filtering) & Nhận diện biên (Edge Detection)", "Khử nhiễu ảnh bằng Gaussian Blur. Sử dụng thuật toán Canny và Sobel để phát hiện đường viền của vật thể."),
    ("Nhận diện khuôn mặt với Haar Cascades", "Ứng dụng Machine Learning truyền thống. Xây dựng chương trình phát hiện khuôn mặt và mắt từ webcam theo thời gian thực."),
    ("Mạng Neural Tích chập (CNN) cơ bản", "Hiểu cấu trúc của Convolutional Neural Networks. Cách bộ lọc (Filters) trích xuất đặc trưng hình ảnh."),
    ("Phân loại ảnh (Image Classification) với Keras", "Huấn luyện mô hình CNN đầu tiên để phân loại chó/mèo hoặc nhận dạng chữ số viết tay (MNIST)."),
    ("Chuyển giao học tập (Transfer Learning)", "Tận dụng các mô hình khổng lồ đã được huấn luyện sẵn (ResNet, VGG, MobileNet) để phân loại ảnh với độ chính xác cao."),
    ("Phát hiện vật thể (Object Detection) với YOLO", "Ứng dụng mô hình YOLO (You Only Look Once) để nhận diện và đóng khung nhiều vật thể (xe cộ, người) trong video hoặc camera giám sát."),
    ("Phân vùng ảnh (Image Segmentation)", "Tách nền khỏi chủ thể (Background Removal). Tìm hiểu cơ chế hoạt động của các bộ lọc trên TikTok hoặc Zoom."),
    ("Thực tế ảo tăng cường & Đồ án cuối khoá", "Ứng dụng Computer Vision vào nhận diện cử chỉ tay (Hand Tracking với MediaPipe) để điều khiển game hoặc tạo ứng dụng hỗ trợ người khiếm thị.")
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

## 2. Mã nguồn (Python/OpenCV/TensorFlow)
- Cung cấp các đoạn code mẫu xử lý ảnh và train model.

## 3. Thử thách (Challenge)
- Tự động hóa hoặc tối ưu mô hình trên dữ liệu mới.
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_CV, 
        "Thị Giác Máy Tính (Computer Vision) với OpenCV & YOLO", 
        "Trang bị cho máy tính 'đôi mắt'. Xử lý hình ảnh số, nhận diện khuôn mặt, phát hiện vật thể (xe tự lái, camera an ninh) bằng các mô hình Deep Learning tiên tiến.",
        lessons_cv,
        "Hệ Thống Trợ Lý Thị Giác (Vision Assistant)",
        "Xây dựng hệ thống camera an ninh thông minh: Tự động phát hiện người lạ, nhận diện cử chỉ để mở khóa, và cảnh báo khi có vật thể nguy hiểm. Tích hợp giao diện hiển thị real-time bounding box."
    )
    print("Successfully generated Computer Vision course.")

if __name__ == "__main__":
    main()
