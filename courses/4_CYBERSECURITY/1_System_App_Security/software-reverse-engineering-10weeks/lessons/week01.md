# Tuần 1: Phạm vi, đạo đức và xây dựng lab cô lập

## Nguồn bài học

- **Overview of Software Ethical Hacking**.
- **Setting up your cracking workspace and workflow**.
- Nội dung “cracking” trong nguồn được chuyển thành phân tích bảo mật có ủy quyền.

## Phá Đóng Gói Tư Duy: 5 Góc Nhìn Bất Ngờ Từ Thế Giới "Software Ethical Hacking"

Hàng ngày, chúng ta tương tác với hàng chục ứng dụng, nhưng phần lớn người dùng chỉ nhìn thấy lớp bề mặt của tệp thực thi. Bên dưới lớp vỏ đó là một mê cung của mã máy, các lời gọi hệ thống và những logic bảo mật phức tạp. Khóa học "Software Ethical Hacking" từ kênh **Learn with Your Brains**, dẫn dắt bởi chuyên gia Dr. D, không chỉ đơn thuần dạy cách "bẻ khóa" phần mềm. Đó là một hành trình thâm nhập vào cấu trúc cốt lõi của chương trình để hiểu rõ cách chúng vận hành, từ đó xây dựng tư duy phản biện và kỹ năng bảo mật chuyên sâu. Với một chuyên gia an ninh mạng, kỹ thuật đảo ngược (Reverse Engineering) chính là chiếc kính hiển vi để soi chiếu những lỗ hổng mà lập trình viên vô tình hay hữu ý để lại.

### 1. "Bẻ khóa" nhưng phải "Hợp pháp" – Nghệ thuật của Kỹ thuật Đảo ngược

Trong giới công nghệ chuyên nghiệp, kỹ thuật đảo ngược không phải là hành vi phá hoại. Ngược lại, nó là một công cụ kiểm định tối thượng. Mục tiêu cốt lõi của Software Ethical Hacking là học cách tháo rời phần mềm một cách hợp pháp trong môi trường thử nghiệm (Sandbox) để phân tích logic và kiểm tra tính an toàn của mã nguồn. Thay vì sử dụng phần mềm trái phép, chúng ta học cách "đối thoại" với các tệp thực thi để nhận diện cách thức bảo mật của chúng.

Dr. D nhấn mạnh rằng đây là một cuộc đấu trí về mặt kỹ thuật giữa người xây dựng và người phân tích:

> *"Đây là khóa học về kỹ thuật đảo ngược. Trong khi các lập trình viên viết chương trình, chúng ta thực hiện đảo ngược nó để xem liệu họ có thực sự tạo ra một chương trình đúng đắn hay không, bởi vì có những phần mềm rất khó để thực hiện kỹ thuật đảo ngược."*

### 2. Thuật ngữ gây hiểu lầm – Khi BP không phải là "Huyết áp"

Trong y khoa, BP là chỉ số huyết áp, nhưng với một "Reverser" đang sử dụng trình gỡ lỗi tiêu chuẩn công nghiệp như **x64dbg**, BP chính là **Breakpoints** (Điểm ngắt). Đây là công cụ quan trọng nhất để "đóng băng" thời gian của một chương trình đang chạy, cho phép chúng ta quan sát trạng thái hệ thống tại một thời điểm cực kỳ chính xác.

Việc làm chủ Breakpoints giúp chuyên gia can thiệp sâu vào:
- **Windows API**: Các hàm hệ thống mà phần mềm gọi ra để giao tiếp với OS.
- **Stack (Ngăn xếp)**: Nơi lưu trữ các tham số và địa chỉ trả về của hàm.
- **Hardware Breakpoints**: Kỹ thuật nâng cao sử dụng các thanh ghi đặc biệt của CPU (như DR0-DR7) để dừng chương trình khi truy cập bộ nhớ, một phương pháp khó bị phát hiện hơn so với Software BP thông thường.

### 3. Cuộc chiến chống lại "Nag Screens" và Kỹ thuật Patching

Một trong những bài toán kinh điển của kỹ thuật đảo ngược là xử lý các màn hình nhắc nhở (Nag Screens) hoặc các hạn chế dùng thử (Time Trials). Để vượt qua, chuyên gia cần thực hiện phân tích tệp **PE (Portable Executable)** – cấu trúc chuẩn của các chương trình chạy trên Windows – để tìm ra điểm yếu trong logic kiểm tra bản quyền.

Thay vì tìm kiếm một key có sẵn, chúng ta sử dụng kỹ thuật **Patching** (vá mã) để thay đổi trực tiếp luồng thực thi:
- **Reverse Jumps**: Đảo ngược các lệnh nhảy có điều kiện (ví dụ: biến lệnh "nhảy nếu sai" thành "nhảy nếu đúng").
- **Direct Memory Patching**: Can thiệp trực tiếp vào bộ nhớ để thay đổi giá trị đăng ký ngay khi chương trình đang vận hành.
- **Bypass Registration**: Vượt qua các bước kiểm tra tệp đăng ký (registration file checks) hoặc các giá trị trong Registry của Windows.
- **Xử lý Logic**: Vô hiệu hóa các thông báo phiền nhiễu bằng cách chuyển hướng mã thực thi tới các hàm xử lý thành công.

### 4. Khi Lập trình viên "Thách đấu" các Reverser

Thế giới an ninh mạng luôn tồn tại một nét văn hóa thú vị: các lập trình viên chủ động đưa sản phẩm của mình lên internet để thách thức cộng đồng tìm ra thông tin ẩn hoặc "giải mã" được logic bên trong. Đây không chỉ là cuộc chơi, mà là cách để họ kiểm tra độ bền vững của các phương thức mã hóa và bảo vệ.

Trong các cuộc "thách đấu" này, chuyên gia thường sử dụng bộ công cụ tiêu chuẩn:
- **Detect It Easy (DIE)**: Công cụ "vỡ lòng" nhưng cực mạnh để phân tích Header, nhận diện loại trình biên dịch, và các lớp bảo vệ (Packer/Protector).
- **Serial Fishing**: Kỹ thuật "câu" mã đăng ký bằng cách theo dõi cách chương trình so sánh chuỗi ký tự trong bộ nhớ.
- **Loaders**: Xây dựng các tệp thực thi phụ để can thiệp vào chương trình chính ngay khi nó vừa khởi động, giúp vượt qua các lớp bảo vệ mà không cần sửa đổi tệp gốc.

### 5. Sự phức tạp của các tầng bảo vệ (Anti-debugging & Packing)

Hacking phần mềm hiện đại là một cuộc chiến đa mặt trận trên nhiều nền tảng, từ các ứng dụng **Native compile** truyền thống, mã nguồn **VBSP (Visual Basic)** cũ kỹ cho đến các framework hiện đại như **.NET (C#, VB.NET)** và các tệp thư viện liên kết động (**DLLs**).

Các rào cản thường gặp bao gồm:
- **Packing & Obfuscation**: Kỹ thuật nén và làm xáo trộn mã để ngăn cản việc đọc hiểu (Static Analysis). Quá trình **Deobfuscation** (giải xáo trộn) là bắt buộc để khôi phục lại logic ban đầu.
- **Anti-debugging Protection**: Các đoạn mã được thiết kế để phát hiện sự hiện diện của debugger. Nếu phát hiện đang bị theo dõi, phần mềm sẽ tự hủy hoặc chạy sai hướng.
- **Sandbox Environment**: Một nguyên tắc "đạo đức" tối quan trọng là luôn thực hiện quá trình phân tích trong môi trường ảo hóa tách biệt để bảo vệ hệ thống thật khỏi các rủi ro tiềm ẩn.

### Lời kết và Câu hỏi suy ngẫm

Học về Software Ethical Hacking không chỉ là để biết cách bẻ khóa một phần mềm, mà là để thấu hiểu ranh giới mong manh giữa bảo mật và lỗ hổng. Khi bạn hiểu cách một hệ thống bị tháo rời, bạn mới thực sự biết cách xây dựng một hệ thống không thể bị phá vỡ.

> *Trong kỷ nguyên mà mọi dòng mã đều có thể bị đảo ngược và phân tích, liệu sự an toàn thực sự nằm ở các lớp khóa bảo vệ phức tạp, hay nằm ở sự minh bạch và bền vững của logic lập trình?*

## Kết quả cần đạt

- Phân biệt reverse engineering, debugging, vulnerability research, malware analysis và piracy.
- Viết Rules of Engagement (RoE) xác định chính xác target và kỹ thuật được phép.
- Tạo Windows VM có snapshot, evidence folder và quy trình khôi phục.
- Tính hash, quản lý chain of custody và biết khi nào phải dừng phân tích.

## 1. Reverse engineering hợp pháp là gì?

Reverse engineering quan sát artifact để hiểu cấu trúc và hành vi khi source không có hoặc cần xác minh độc lập. Hoạt động có thể hợp pháp trong kiểm thử nội bộ, tương thích, điều tra sự cố hoặc CTF; quyền cụ thể vẫn phụ thuộc chủ sở hữu, hợp đồng và luật áp dụng.

| Hoạt động | Mục tiêu | Target phù hợp với khóa |
|---|---|---|
| Debugging | Tìm nguyên nhân lỗi | Chương trình lớp tự viết |
| Security review | Xác nhận weakness và fix | Binary được owner ủy quyền |
| CTF/crackme | Học kỹ thuật | Challenge có license rõ |
| Malware analysis | Hiểu mẫu độc hại | Chỉ trong lab chuyên dụng và có quy trình riêng |
| Bypass license/DRM | Dùng tính năng không được phép | Không thuộc khóa học |

## 2. Rules of Engagement

```markdown
Authorization ID: RE-LAB-W01
Owner / Approver: <name>
Target: toy_validator.exe
Expected SHA-256: <64 hex>
Allowed: static triage, debugger, breakpoint, source patch
Not allowed: third-party software, public upload, external network
Data prohibited: real credentials, personal/customer data
Time window: <start> — <end>
Stop conditions: hash mismatch, VM escape signal, out-of-scope data
Evidence location / retention: <path>, <days>
```

Quyền phân tích phải gắn với **artifact cụ thể**, không phải câu chung chung như “được phép hack phần mềm”.

## 3. Kiến trúc lab

```text
Host
└── Windows Analysis VM
    ├── tools/             # x64dbg, DIE và công cụ đã kiểm hash
    ├── samples/original/  # read-only
    ├── samples/working/   # bản sao để phân tích
    ├── evidence/          # screenshot, JSON, log
    ├── notes/             # hypothesis và timeline
    └── patched/           # artifact sau sửa + manifest
```

Thiết lập đề xuất:

1. Cập nhật Windows VM, không dùng bản Windows đã hết hỗ trợ.
2. Tạo user không có dữ liệu cá nhân và không đăng nhập cloud account.
3. Tắt shared folder, shared clipboard, drag-and-drop và USB passthrough mặc định.
4. Dùng NAT hạn chế hoặc network disabled tùy target; không bridge vào mạng thật.
5. Snapshot `clean-tools`, sau đó snapshot riêng trước mỗi dynamic lab.
6. Đồng bộ thời gian phục vụ log nhưng ghi rõ timezone.

## 4. Chain of custody tối thiểu

```powershell
Get-FileHash .\samples\original\toy_validator.exe -Algorithm SHA256
Get-Date -Format o
```

Ghi: ai nhận file, nhận khi nào, từ đâu, hash ban đầu, bản sao nào được mở và artifact nào được tạo. Không sửa trực tiếp sample gốc.

## 5. Tiêu chí dừng

Dừng và báo giảng viên nếu:

- Hash khác RoE hoặc target không đúng version.
- Binary cố truy cập credential, file cá nhân hoặc hệ thống ngoài lab.
- Cần tắt protection của host hay kết nối production để tiếp tục.
- Phát hiện dữ liệu thật không nằm trong phạm vi.
- Không chắc binary/challenge có quyền phân tích.

## Lab từng bước

1. Tạo VM và cấu trúc thư mục.
2. Chụp ảnh cấu hình isolation, tool version và snapshot name.
3. Copy toy binary vào `original`, tính hash, chuyển read-only.
4. Tạo working copy, xác minh hash giống bản gốc.
5. Viết RoE một trang và analysis journal đầu tiên.
6. Khôi phục snapshot để chứng minh đường rollback hoạt động.

## Bài tập và rubric

Nộp RoE, sơ đồ lab, hash record, screenshot snapshot và recovery checklist. Chấm: authorization 30, isolation 25, evidence 20, stop conditions 15, trình bày 10. Thiếu quyền hoặc target hash: không đạt.

