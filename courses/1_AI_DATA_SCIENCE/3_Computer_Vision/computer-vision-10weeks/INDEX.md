# Thị Giác Máy Tính (Computer Vision) với OpenCV & YOLO

Trang bị cho máy tính 'đôi mắt'. Xử lý hình ảnh số, nhận diện khuôn mặt, phát hiện vật thể (xe tự lái, camera an ninh) bằng các mô hình Deep Learning tiên tiến.

## Cấu trúc thư mục

- `schedule.md`: Lộ trình chi tiết 10 tuần.
- `lessons/`: Bài giảng, code minh họa, lỗi thường gặp và thử thách từng tuần.
- `projects/`: Đồ án cuối khóa.

## Chuẩn bị môi trường

Từ thư mục `courses/1_AI_DATA_SCIENCE`, tạo môi trường ảo và cài các thư viện:

```bash
python -m venv .venv
source .venv/bin/activate       # macOS/Linux
python -m pip install -r requirements.txt
```

Trên Windows PowerShell, dùng `.venv\\Scripts\\Activate.ps1` để kích hoạt môi trường. Một số bài tải dataset hoặc trọng số pretrained trong lần chạy đầu tiên nên cần kết nối mạng.

## Quy ước khi thực hành

- Đặt ảnh/video đầu vào trong thư mục `data/` của dự án thực hành.
- Đặt kết quả trong `output/`; không ghi đè dữ liệu gốc.
- Chạy ví dụ nhỏ trước, kiểm tra shape và kiểu dữ liệu trước khi train toàn bộ.
- Chỉ thu thập hoặc lưu hình ảnh có khuôn mặt khi đã có sự đồng ý.
