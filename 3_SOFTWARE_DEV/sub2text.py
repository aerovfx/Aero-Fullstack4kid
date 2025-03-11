import os
import re

def extract_text_from_srt(file_path):
    """Trích xuất nội dung văn bản từ file SRT, bỏ qua timestamp và số thứ tự."""
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.readlines()
    
    text_lines = []
    for line in content:
        # Bỏ qua số thứ tự và timestamp
        if not re.match(r'^\d+$', line.strip()) and not re.match(r'^\d{2}:\d{2}:\d{2},\d{3} --> \d{2}:\d{2}:\d{2},\d{3}', line.strip()):
            text_lines.append(line.strip())

    return " ".join(text_lines)

def extract_text_from_vtt(file_path):
    """Trích xuất nội dung văn bản từ file VTT, bỏ qua timestamp và tiêu đề WEBVTT."""
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.readlines()
    
    text_lines = []
    for line in content:
        # Bỏ qua timestamp và dòng tiêu đề "WEBVTT"
        if not re.match(r'^\d{2}:\d{2}:\d{2}\.\d{3} --> \d{2}:\d{2}:\d{2}\.\d{3}', line.strip()) and "WEBVTT" not in line:
            text_lines.append(line.strip())

    return " ".join(text_lines)

def extract_and_merge_subtitles(folder_path, output_file):
    """Trích xuất và hợp nhất nội dung từ các file SRT/VTT trong thư mục."""
    all_text = []
    
    # Kiểm tra thư mục tồn tại không
    if not os.path.exists(folder_path):
        print(f"Lỗi: Thư mục '{folder_path}' không tồn tại.")
        return
    
    for file_name in os.listdir(folder_path):
        file_path = os.path.join(folder_path, file_name)
        
        if file_name.endswith(".srt"):
            print(f"Đang xử lý: {file_name}")
            all_text.append(extract_text_from_srt(file_path))
        elif file_name.endswith(".vtt"):
            print(f"Đang xử lý: {file_name}")
            all_text.append(extract_text_from_vtt(file_path))
    
    # Hợp nhất văn bản
    merged_text = "\n".join(all_text)

    # Kiểm tra nếu output_file là thư mục thì thêm tên file mặc định
    if os.path.isdir(output_file):
        output_file = os.path.join(output_file, "merged_text.txt")

    try:
        with open(output_file, "w", encoding="utf-8") as f:
            f.write(merged_text)
        print(f"✔ Văn bản đã được lưu vào: {output_file}")
    except PermissionError:
        print(f"❌ Lỗi: Không thể ghi vào file '{output_file}'. Kiểm tra quyền truy cập.")

if __name__ == "__main__":
    # Nhập đường dẫn từ người dùng
    folder_path = input("Nhập đường dẫn thư mục chứa subtitle: ").strip()
    output_file = input("Nhập đường dẫn file đầu ra (.txt): ").strip()

    # Kiểm tra nếu chỉ nhập thư mục, tự động đặt tên file
    if not output_file.endswith(".txt"):
        output_file = os.path.join(output_file, "merged_text.txt")

    # Chạy hàm xử lý
    extract_and_merge_subtitles(folder_path, output_file)
