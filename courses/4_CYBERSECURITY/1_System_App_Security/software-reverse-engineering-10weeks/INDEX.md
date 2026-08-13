# Software Reverse Engineering — 10 tuần

Triage, phân tích tĩnh/động và secure patching trên binary lab tự biên dịch.

## Cấu trúc

- [Lịch học](schedule.md)
- `lessons/week01.md` … `week10.md`: bài học.
- `code/week01.py` … `week10.py`: code/cấu hình mẫu an toàn.
- `exercises/week01/` … `week10/`: starter và rubric.
- [Dự án cuối khóa](projects/final_project.md)
- [Ánh xạ tài liệu nguồn từ docs](references/source-map.md)
- [Hướng dẫn viết mã, công thức và báo cáo](references/reporting-and-writing.md)

## Quy tắc bắt buộc

Chỉ thực hành trong lab thuộc quyền kiểm soát và có Rules of Engagement. Mặc định offline, read-only hoặc dry-run; không quét Internet, không dùng dữ liệu cá nhân, credential hay malware thật. Mọi finding phải kèm bằng chứng đã ẩn danh, đề xuất phòng thủ và cách rollback.

Khóa học đã hợp nhất 11 bài x64dbg/DIE trong thư mục `docs` thành
lộ trình 10 tuần. Các bản sao trùng byte được loại khỏi chương trình,
và địa chỉ email cá nhân không được đưa vào tài liệu học.
