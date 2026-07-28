# Tuần 2: x64dbg, Detect It Easy và static PE triage

## Nguồn bài học

- Video/phụ đề: **Introduction to x64dbg and Detect It Easy (DIE)** trong [thư mục Drive](https://drive.google.com/drive/folders/1kmHuF45S66uiI7WnFG8_Hnmrqe4GZYzR?usp=share_link).
- Phụ đề nguồn giới thiệu mục đích của x64dbg và DIE, lựa chọn bản Windows/kiến trúc phù hợp và quy trình chuẩn bị hai công cụ.
- Giáo trình này cập nhật phần nguồn thành workflow an toàn, có kiểm chứng và chỉ áp dụng cho binary được phép phân tích.

## Phẫu Thuật Phần Mềm: 3 Sự Thật Thú Vị Về Bộ Đôi x64dbg và Detect It Easy

Giải mã cấu trúc nhị phân của một tệp thực thi không đơn thuần là một kỹ thuật—đó là một nghệ thuật phẫu thuật số. Bạn đã bao giờ tự hỏi làm thế nào để nhìn thấu bên dưới "lớp da" của một tệp `.exe`, giải mã cơ chế kiểm tra serial key hay can thiệp vào luồng vận hành của nó? Trong lộ trình "Learn with your brains" (Học bằng bộ não), x64dbg và Detect It Easy (DIE) không chỉ là công cụ; chúng là những "vũ khí" tối thượng cho bất kỳ ai muốn làm chủ kỹ năng phân tích tĩnh và động.

### 1. Sự khác biệt về nền tảng: Tại sao Windows vẫn là "Phòng mổ" chính?

Trong giới kỹ thuật đảo ngược, việc lựa chọn môi trường tác chiến là yếu tố tiên quyết. Một sự thật đặc thù là trong khi Detect It Easy (DIE) cho phép bạn thực hiện "chẩn đoán" trên nhiều nền tảng, thì x64dbg lại được thiết kế như một chuyên gia đặc biệt chỉ dành cho hệ sinh thái Windows.

- **x64dbg**: Được tối ưu hóa chuyên biệt cho Windows (hỗ trợ từ Windows 7, Windows 8 đến các phiên bản mới nhất). Đây là một trình gỡ lỗi 64-bit mã nguồn mở được xây dựng để khai thác triệt để cấu trúc của hệ điều hành phổ biến nhất thế giới.
- **Detect It Easy (DIE)**: Thể hiện tính linh hoạt tuyệt vời khi hỗ trợ đa nền tảng, từ Windows, Mac OS cho đến các hệ thống Linux.

Việc x64dbg tập trung hoàn toàn vào Windows không phải là một hạn chế, mà là một sự lựa chọn chiến lược. Windows là nơi tập trung phần lớn các tệp thực thi phức tạp cần được phân tích. Đối với người mới bắt đầu, việc làm chủ các công cụ trên Windows chính là con đường ngắn nhất để tiếp cận thực tế.

> *"Đây là một trình gỡ lỗi 64-bit mã nguồn mở dành cho Windows. Như tôi đã nói, nó chủ yếu dành cho Windows. Nếu nó dành cho Mac hay Linux, họ đã tuyên bố điều đó, nhưng đây chỉ dành riêng cho Windows."*

### 2. "Thám tử" chẩn đoán đi trước, "Bác sĩ phẫu thuật" theo sau

Sử dụng x64dbg mà không qua bước kiểm tra với Detect It Easy (DIE) chẳng khác nào thực hiện một ca "phẫu thuật mù". Trong quy trình làm việc chuyên nghiệp, DIE đóng vai trò là thiết bị chụp X-quang, xác định bản chất của đối tượng trước khi đặt lên bàn mổ x64dbg.

Được lưu trữ tại địa chỉ `fork.github.io`, DIE giúp kỹ sư xác định loại tệp và "ngôn ngữ" gốc mà lập trình viên đã sử dụng—liệu đó là Visual Studio, Python hay một trình biên dịch đặc thù nào khác. Đây là điểm cốt lõi (core point): Thông tin từ DIE sẽ quyết định chiến lược của bạn. Nếu DIE cho biết tệp đã được đóng gói (packed) hoặc bảo vệ, phương thức tiếp cận điểm nhập (entry point) trong x64dbg sẽ thay đổi hoàn toàn. Tư duy của một chuyên gia luôn ưu tiên phân tích thông tin hơn là nhảy vào gỡ lỗi ngay lập tức.

> *"Detect It Easy là một chương trình dùng để xác định loại tệp mà lập trình viên đã sử dụng để xây dựng ứng dụng đó."*

### 3. Con số ấn tượng: 13.4 GB dữ liệu và sức sống mã nguồn mở

Sự tin cậy của một công cụ bảo mật nằm ở tính minh bạch và sự bền bỉ của cộng đồng. Trên SourceForge, x64dbg không chỉ là một phần mềm đơn lẻ mà là một dự án đồ sộ với bề dày lịch sử đáng kinh ngạc.

Dự án này lưu trữ toàn bộ các bản "snapshot" (phiên bản lịch sử) kể từ khi mới hình thành. Tổng dung lượng của các bản snapshot này đã vượt con số **13.4 GB**, minh chứng cho một quá trình tiến hóa không ngừng nghỉ. Sự nhiệt huyết của cộng đồng lập trình viên đứng sau công cụ này lớn đến mức các bản cập nhật được phát hành liên tục; thậm chí có những bản vá lỗi chỉ mới được xuất xưởng cách đây **2 ngày**. Việc sử dụng một công cụ mã nguồn mở được cập nhật sát sao như vậy đảm bảo bạn luôn có những "lưỡi dao" sắc bén nhất để xử lý các kỹ thuật bảo mật hiện đại.

### Kết luận và Thông điệp suy ngẫm

Hiểu rõ công cụ là bước đệm bắt buộc trước khi bạn thiết lập "Kraken Workspace"—không gian làm việc chuyên sâu cho các dự án Reverse Engineering sắp tới. Hãy nhớ rằng, triết lý "Learn with your brains" không chỉ nói về kỹ thuật, mà còn về đạo đức và mục đích: Hãy sử dụng năng lực tư duy của bạn để xây dựng giá trị công nghệ, thay vì những mục tiêu phá hoại vô ích.

> *Kỹ thuật đảo ngược trao cho bạn một quyền năng đặc biệt để thấu hiểu thế giới số. Nếu bạn có quyền năng nhìn thấu cấu trúc của bất kỳ phần mềm nào, bạn sẽ dùng nó để sáng tạo hay chỉ để phá bỏ?*

## Kết quả cần đạt

Sau bài này, học viên có thể:

- Giải thích khác biệt giữa static detector và debugger động.
- Xác định PE32/PE32+, CPU architecture, section, entry point và một số mitigation.
- Tính SHA-256, giữ nguyên evidence gốc và tạo báo cáo triage tái lập được.
- Chọn đúng x32dbg/x64dbg theo target, không chỉ theo Windows đang dùng.
- Phân biệt observation, hypothesis và conclusion khi đọc kết quả tool.

## 1. Hai công cụ giải quyết hai câu hỏi khác nhau

| Công cụ | Câu hỏi chính | Có chạy target? | Dữ liệu quan sát |
|---|---|---:|---|
| Detect It Easy | “File này được đóng gói/biên dịch như thế nào?” | Không trong bước triage thông thường | Format, architecture, compiler/packer heuristic, entropy, section |
| x64dbg/x32dbg | “Chương trình làm gì khi thực thi?” | Có | Register, memory, stack, thread, exception, instruction và control flow |
| `pe_triage.py` | “Header PE khai báo điều gì?” | Không | Hash, machine, section, timestamp, entry point, image base, mitigation flags |

DIE cho giả thuyết ban đầu; x64dbg giúp kiểm tra giả thuyết trong môi trường động. Không công cụ nào tự chứng minh file an toàn hoặc độc hại.

## 2. x32dbg hay x64dbg?

Chọn debugger theo **kiến trúc target**:

- PE32/x86 → x32dbg.
- PE32+/x86-64 → x64dbg.
- ARM64 không được phân tích trực tiếp bằng x64dbg như một binary x86-64.

Windows 64-bit vẫn có thể chạy ứng dụng x86 qua WOW64. Vì vậy, “máy 64-bit” không có nghĩa mọi target đều phải mở bằng x64dbg.

## 3. Chuẩn bị lab an toàn

1. Dùng Windows VM được cập nhật và tạo snapshot `week02-clean`.
2. Không dùng tài khoản cá nhân; tắt shared folder/clipboard nếu target chưa tin cậy.
3. Tải công cụ từ trang phát hành chính thức; kiểm tra chữ ký/hash nếu dự án công bố.
4. Ghi phiên bản tool, Windows build và thời gian thực hành.
5. Chỉ dùng `toy_debug.exe` và `toy_release.exe` do lớp tự biên dịch.
6. Đặt sample gốc trong `samples/original/` ở chế độ read-only; mọi thao tác dùng bản sao.

Không dùng Windows 7/8 chỉ vì video cũ minh họa các phiên bản đó. Hệ điều hành hết hỗ trợ không phù hợp cho máy lab có kết nối mạng.

## 4. Workflow triage trước khi debug

```text
Authorization → Preserve sample → SHA-256 → PE header triage
→ DIE observations → Hypothesis → Decide whether dynamic analysis is needed
→ Snapshot → x32dbg/x64dbg → Evidence → Restore snapshot
```

### Bước 1 — Xác nhận phạm vi

Ghi target name, SHA-256 dự kiến, owner, quyền phân tích và tiêu chí dừng. Nếu hash không khớp danh sách lab, dừng và hỏi giảng viên.

### Bước 2 — Tính hash bằng PowerShell

```powershell
Get-FileHash .\samples\original\toy_release.exe -Algorithm SHA256
```

Hash là định danh evidence, không phải kết luận an toàn.

### Bước 3 — Triage bằng Python

```bash
python code/pe_triage.py samples/original/toy_release.exe
python code/pe_triage.py --json samples/original/toy_release.exe
```

Script chỉ đọc header, không nạp hoặc thực thi binary.

### Bước 4 — Đọc bằng DIE

Ghi lại:

- Format PE32/PE32+ và machine architecture.
- Compiler/linker hoặc packer heuristic cùng confidence.
- Entry point, số section, entropy/overlay nếu tool hiển thị.
- Import, resource hoặc string đáng chú ý nhưng chưa kết luận hành vi.

### Bước 5 — Quyết định có debug không

Chỉ chuyển sang dynamic analysis khi có câu hỏi cụ thể, ví dụ “input được kiểm tra ở module nào?” hoặc “exception xảy ra trước hay sau parser?”. Không mở target chỉ để khám phá tùy tiện.

## 5. Hiểu các trường PE chính

| Trường | Ý nghĩa | Cạm bẫy |
|---|---|---|
| Machine | CPU target | Không cho biết OS host hiện tại |
| NumberOfSections | Số section trong table | Tên/số section lạ chưa chứng minh packing |
| TimeDateStamp | Giá trị COFF timestamp | Có thể bị zero, tái lập hoặc sửa |
| AddressOfEntryPoint | RVA bắt đầu thực thi | Packer có thể đặt entry tại stub |
| ImageBase | Địa chỉ nạp ưu tiên | ASLR có thể thay đổi địa chỉ runtime |
| DllCharacteristics | Cờ ASLR/DEP/CFG liên quan | Cờ có mặt chưa đảm bảo toàn bộ hệ thống an toàn |
| Section flags | Read/write/execute | Section W+X cần điều tra thêm nhưng có thể có lý do hợp lệ |

## 6. Mẫu ghi chép evidence

```markdown
Target: toy_release.exe
SHA-256: <64 hex characters>
Authorization: RE-LAB-W02
Environment: Windows VM snapshot week02-clean
Tools: DIE <version>, x64dbg <version>, pe_triage.py

Observation: PE32+, AMD64, 6 sections, NX compatible enabled.
Hypothesis: Release build from an MSVC-like toolchain.
Confidence: Medium — based on DIE heuristic; not independently confirmed.
Next test: Compare compiler metadata and symbols with the known source build.
```

## 7. Lab: so sánh Debug và Release

Giảng viên cung cấp cùng một toy source, build thành Debug và Release.

1. Tính hash và chạy `pe_triage.py --json` cho hai file.
2. Mở bằng DIE, ghi architecture, compiler heuristic, section và string.
3. So sánh size, entry point, debug information và import.
4. Chọn đúng x32dbg/x64dbg nhưng chưa đặt breakpoint vào logic nhạy cảm.
5. Tạo bảng observation; mọi kết luận phải nêu confidence.

Không chấm điểm dựa trên việc “tìm được nhiều string”. Điểm nằm ở khả năng giải thích vì sao hai build khác nhau và giới hạn của evidence.

## 8. Lỗi thường gặp

- Chọn debugger theo kiến trúc host thay vì target.
- Mở sample gốc bằng tool có thể thay đổi metadata/session file.
- Tin tuyệt đối compiler/packer signature heuristic.
- Đưa binary nội bộ lên dịch vụ scan công cộng mà chưa được phép.
- Nhầm COFF timestamp với thời gian build đáng tin cậy.
- Thấy API network/file rồi kết luận file độc hại.
- Quên ghi hash, tool version hoặc snapshot nên không tái lập được.

## Bài tập cuối buổi

Nộp một báo cáo triage cho hai binary tự biên dịch, gồm JSON output, ảnh DIE đã che đường dẫn cá nhân, bảng Debug/Release, ba hypothesis và kế hoạch kiểm chứng. Không nộp binary bên thứ ba hoặc dữ liệu chứa secret.

## Tiêu chí đánh giá

| Tiêu chí | Điểm |
|---|---:|
| Phạm vi, hash và evidence đầy đủ | 25 |
| Đọc đúng architecture/PE fields | 25 |
| Phân biệt observation và conclusion | 20 |
| So sánh Debug/Release có căn cứ | 20 |
| An toàn lab và trình bày | 10 |

