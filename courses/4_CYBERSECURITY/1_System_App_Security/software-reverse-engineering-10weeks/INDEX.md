# Software Reverse Engineering & Secure Patching — 10 tuần

Khóa học phân tích bảo mật phần mềm Windows có ủy quyền, dùng x64dbg, Detect It Easy và các binary do lớp tự biên dịch. Mục tiêu là hiểu chương trình, xác nhận lỗ hổng, sửa lỗi, kiểm tra bản vá và tăng khả năng chống tampering — không phá bản quyền hoặc vượt cơ chế cấp phép của phần mềm bên thứ ba.

## Nguồn chuyên đề

- [Thư mục 12 bài Software Ethical Hacking](https://drive.google.com/drive/folders/1yrgDXoBcun9603AjPqCJHfGQr0KP-Qvv?usp=share_link)
- Nội dung nguồn: x64dbg, Detect It Easy, workspace, stepping, breakpoint, jump/control flow, patching, PE GUI và serial-key analysis.
- Giáo trình đã chuyển hóa các bài “cracking” thành reverse engineering phòng thủ, secure patching và kiểm thử anti-tamper.

## Điều kiện học

Biết C/C++ cơ bản, số hexadecimal, process/thread, stack/heap và assembly x86-64 ở mức nhập môn. Lab cần Windows VM tách biệt, snapshot sạch và tool tải từ nguồn chính thức.

## Quy tắc bắt buộc

- Chỉ phân tích binary tự viết, challenge/CTF có giấy phép hoặc phần mềm được chủ sở hữu cho phép bằng văn bản.
- Không dùng kỹ thuật khóa học để phá license, DRM, serial key hoặc phân phối bản vá trái phép.
- Không chạy mẫu không tin cậy trên máy thật; VM không chứa credential, file cá nhân hay shared clipboard mặc định.
- Không upload binary bí mật lên dịch vụ công cộng; hash và log phải được xử lý theo chính sách dữ liệu.
- Bản vá phải có source-of-truth, test hồi quy, khả năng rollback và chữ ký/hash phát hành.

## Cấu trúc

- [Lịch trình 10 tuần](schedule.md)
- `lessons/week01.md` đến `week10.md`
- `code/pe_triage.py`: kiểm tra PE32/PE32+ tĩnh, mitigation và section mà không thực thi file.
- `code/test_pe_triage.py`: unit test tạo PE tổng hợp, không cần binary bên ngoài.
- `code/hash_manifest.py`: tạo/xác minh manifest SHA-256 cho artifact lab.

## Đầu ra

Học viên có thể triage PE, đọc control flow, dùng debugger có kiểm soát, lập báo cáo finding, sửa lỗi từ source hoặc patch binary lab khi không còn source, rồi chứng minh bản vá đúng và không phá chức năng khác.
