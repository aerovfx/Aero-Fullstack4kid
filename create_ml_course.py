import os

BASE_DIR_ML = "/Users/dangvietchung/Aero-Fullstack4kid/courses/1_AI_DATA_SCIENCE/2_Machine_Learning/machine-learning-10weeks"

lessons_ml = [
    ("Nhập môn Machine Learning & Scikit-Learn", "Phân biệt AI, ML và Deep Learning. Quy trình huấn luyện một mô hình (Train/Test Split). Sử dụng thư viện Scikit-Learn."),
    ("Hồi quy tuyến tính & Hồi quy Logistic", "Xây dựng mô hình Linear Regression để dự đoán giá nhà. Sử dụng Logistic Regression để phân loại nhị phân (ví dụ: email spam/non-spam)."),
    ("Cây quyết định & Rừng ngẫu nhiên (Decision Trees & Random Forests)", "Hiểu cách mô hình cây đưa ra quyết định. Áp dụng Random Forest để tăng độ chính xác và giảm Overfitting trên tập dữ liệu y tế."),
    ("Phân cụm dữ liệu & Giảm chiều (K-Means & PCA)", "Học máy không giám sát (Unsupervised Learning). Sử dụng K-Means để phân nhóm khách hàng và thuật toán PCA để nén dữ liệu."),
    ("Nhập môn Mạng nơ-ron (Neural Networks) & TensorFlow", "Tìm hiểu cấu trúc Perceptron, các lớp ẩn (Hidden Layers) và hàm kích hoạt (Activation Functions). Huấn luyện mạng nơ-ron đầu tiên với TensorFlow/Keras."),
    ("Mạng nơ-ron tích chập (CNN) cơ bản", "Ứng dụng CNN trong bài toán nhận dạng hình ảnh. Giới thiệu các lớp Convolution, MaxPooling và Flatten."),
    ("Xử lý Ngôn ngữ Tự nhiên (NLP) & Mạng nơ-ron hồi quy (RNN)", "Làm việc với dữ liệu văn bản. Mã hoá từ vựng (Word Embedding). Sử dụng RNN và LSTM để dự đoán cảm xúc (Sentiment Analysis) từ bình luận phim."),
    ("Transformer & Mô hình ngôn ngữ lớn (LLMs)", "Cơ chế Attention trong Transformer. Giới thiệu cách các mô hình lớn như GPT hoạt động. Hướng dẫn Fine-tuning một mô hình ngôn ngữ mã nguồn mở."),
    ("Hệ thống gợi ý (Recommendation Systems)", "Xây dựng hệ thống gợi ý sản phẩm hoặc phim ảnh dựa trên Collaborative Filtering và Content-Based Filtering."),
    ("Đồ án cuối khoá & Triển khai (Deployment)", "Tích hợp mô hình AI vào một ứng dụng Web (Flask/FastAPI) hoặc Web App bằng Streamlit để người dùng có thể tương tác thực tế.")
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
- \`lessons/\`: Các bài giảng lý thuyết và bài tập thực hành mã nguồn Python.
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

## 2. Dữ liệu & Công cụ (Dataset & Tools)
- Cung cấp đường dẫn tới tập dữ liệu trên Kaggle hoặc HuggingFace.
- Hướng dẫn import các thư viện Python (Scikit-Learn, TensorFlow, PyTorch).

## 3. Mã nguồn thực hành (Hands-on Code)
- Các Jupyter Notebooks mẫu trình bày từng bước tiền xử lý, huấn luyện và đánh giá mô hình.

## 4. Bài tập (Challenge)
- Áp dụng thuật toán vừa học lên một tập dữ liệu thực tế mới.
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_ML, 
        "Học Máy & Học Sâu (Machine Learning & Deep Learning)", 
        "Khoá học toàn diện về Trí tuệ Nhân tạo. Học viên sẽ đi từ các thuật toán học máy thống kê cơ bản đến các mạng nơ-ron sâu phức tạp, ứng dụng trong dự đoán dữ liệu, xử lý ngôn ngữ tự nhiên và xây dựng hệ thống AI thực tế.",
        lessons_ml,
        "Hệ Thống Trợ Lý Phân Tích Thông Minh (Smart AI Assistant)",
        "Học viên sẽ xây dựng một ứng dụng Web (bằng Streamlit) kết hợp 2 tính năng: 1) Hệ thống gợi ý phim ảnh dựa trên sở thích người dùng. 2) Mô hình phân loại cảm xúc từ đoạn văn bản đánh giá. Ứng dụng phải được train từ dữ liệu thực tế và cho phép người dùng cuối (End-User) tương tác."
    )
    print("Successfully generated Machine Learning course.")

if __name__ == "__main__":
    main()
