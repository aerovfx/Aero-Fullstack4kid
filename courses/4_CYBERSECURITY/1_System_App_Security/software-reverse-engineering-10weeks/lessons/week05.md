# Tuần 5: Audit branch và tìm root cause

## Nguồn bài học

- **Reversing Jumps in Software Cracking** được chuyển thành bài audit control flow phòng thủ. Không thực hành đảo jump để vượt license hoặc authorization.

## Chuyên đề: Bí Mật Đằng Sau Những Bản Patch — Quy Trình Phân Tích & Vá Mã Phần Mềm

### 1. Lời mở đầu

Trong thế giới an ninh mạng, kỹ thuật đảo ngược (Reverse Engineering) không chỉ đơn thuần là việc vượt qua các rào cản bản quyền. Đó là một nghệ thuật phân tích mã nguồn để hiểu rõ bản chất của phần mềm, phục vụ cho việc kiểm thử bảo mật (security auditing) hoặc phân tích mã độc (malware analysis). Tại sao một công cụ yêu cầu mã kích hoạt lại có thể bị "khuất phục" chỉ bởi vài dòng lệnh thay thế? Với tư cách là một chuyên gia, bài học này sẽ dẫn dắt bạn đi qua quy trình làm việc (workflow) từ cơ bản đến nâng cao để xử lý các ứng dụng giao diện dòng lệnh (CLI). Đây là nền tảng quan trọng nhất trước khi bạn đối đầu với những hệ thống phức tạp hơn.

### 2. Điều kiện tiên quyết: Lỗ hổng (Vulnerability) - Cánh cửa dẫn vào hệ thống

Trước khi bắt đầu, chúng ta cần hiểu một thực tế: không phải phần mềm nào cũng có thể đảo ngược dễ dàng. Sự tồn tại của một lỗ hổng (vulnerability) hay một điểm yếu trong logic kiểm tra chính là yếu tố quyết định để một chuyên gia có thể can thiệp.

> *"Nếu có một lỗ hổng, bạn có thể đảo ngược ứng dụng và cố gắng tạo ra một bản vá cho nó."*

Nếu một ứng dụng được bảo mật hoàn hảo và không có kẽ hở, việc tạo bản vá gần như là bất khả thi. Vì vậy, bước đầu tiên của mọi nhà phân tích chuyên nghiệp luôn là tìm kiếm điểm yếu này.

### 3. Bước 1: Trở thành "Thám tử" với công cụ Detect It Easy (DIE)

Mọi cuộc phân tích chính xác đều bắt đầu bằng việc trinh sát. Công cụ "Detect It Easy" (DIE) đóng vai trò như một chiếc kính hiển vi để chúng ta soi xét file thực thi.

Nhiệm vụ cốt lõi ở đây là phân tích cấu trúc PE (Portable Executable). Bạn cần xác định hai thông số quan trọng: **Image Base** (địa chỉ cơ sở) và **Entry Point** (điểm nhập). Khi kết hợp hai giá trị này, bạn sẽ tính toán được "Actual Entry Point" – vị trí chính xác mà chương trình bắt đầu thực thi mã lệnh của nó. Việc hiểu rõ "điểm bắt đầu" này quan trọng hơn việc lao vào chỉnh sửa ngay lập tức, vì nó giúp bạn không bị lạc trong mê cung của hàng triệu dòng lệnh.

### 4. Bước 2: Gỡ lỗi và Nghệ thuật đảo ngược các "Bước nhảy"

Sau khi định vị được mục tiêu, chúng ta nạp chương trình vào trình gỡ lỗi (debugger) như **x64dbg** (hoặc S64 DBG).

Tại đây, chúng ta sử dụng **Breakpoints** (Điểm dừng). Đây là kỹ thuật sống còn cho phép chuyên gia "tạm dừng" chương trình tại những thời điểm nhạy cảm, ví dụ như ngay trước khi phần mềm kiểm tra mã kích hoạt.

Mục tiêu tối thượng là điều hướng lại các lệnh nhảy (jumps). Trong hợp ngữ (Assembly), các lệnh như `JZ` (Jump if Zero) hoặc `JE` (Jump if Equal) sẽ quyết định số phận của ứng dụng: hoặc là bị từ chối, hoặc là được chấp nhận. Bằng cách đảo ngược chúng (ví dụ chuyển `JZ` thành `JNZ`) hoặc vô hiệu hóa chúng bằng lệnh `NOP` (No Operation), chúng ta sẽ thay đổi hoàn toàn logic của chương trình.

> *"Không ai muốn nhận một thông báo lỗi cả. Mục tiêu của chúng ta là nhận được thông báo tốt lành."*

### 5. Bước 3: "Phẫu thuật" mã nguồn bằng lệnh Patch và Assemble

Khi đã tìm ra đoạn mã gây ra "thông báo lỗi" (bad message), chúng ta tiến hành "phẫu thuật" bằng cách thay thế các hướng dẫn (instructions) cũ bằng hướng dẫn mới thông qua lệnh **Assemble**. Sau đó, chúng ta lưu lại các thay đổi này thành một file thực thi mới đã được vá (patched file).

Để kiểm soát luồng thực thi trong quá trình này, bạn phải thành thạo các lệnh điều khiển sau:
- **Run (`F9`)**: Thực thi chương trình cho đến khi gặp điểm dừng.
- **Step over (`F8`)**: Đi qua lệnh hiện tại. Sử dụng lệnh này khi bạn không muốn đi sâu vào chi tiết bên trong của một hàm hệ thống không liên quan.
- **Step into (`F7`)**: Đi vào bên trong hàm để phân tích chi tiết từng bước nhảy nhỏ nhất.
- **Call**: Lệnh gọi một chương trình con hoặc hàm.
- **Execute**: Thực thi một lệnh cụ thể.
- **Return (`Ctrl+F9` hoặc Run to user code)**: Đây là lệnh cực kỳ quan trọng giúp bạn thoát khỏi các thư viện hệ thống (DLLs) phức tạp để quay trở về đúng phân đoạn mã nguồn của ứng dụng mục tiêu.

### 6. Từ CLI đến GUI: Thử thách mới đang chờ đợi

Toàn bộ quy trình trên đại diện cho Session 1: Xử lý các ứng dụng giao diện dòng lệnh (CLI). Đây là bước đệm hoàn hảo để rèn luyện tư duy logic.

Tuy nhiên, đỉnh cao tiếp theo là giao diện đồ họa (GUI). Ở đó, sự phức tạp tăng lên gấp bội với các sự kiện tương tác người dùng, các cửa sổ thông báo (Pop-up) và các thành phần giao diện đan xem. Đó sẽ là một trận chiến thực sự nơi kỹ năng của bạn sẽ được đẩy lên giới hạn mới.

### 7. Kết luận và Suy ngẫm

Hành trình trở thành một nhà phân tích chuyên sâu trong giới kỹ thuật đảo ngược bắt đầu từ việc nắm vững workflow: từ phân tích cấu trúc PE, thiết lập Breakpoint, cho đến việc lắp ráp (Assemble) lại các lệnh nhảy để biến một "bad message" thành "good message".

Để rèn luyện, bạn nên tìm kiếm các thử thách "CrackMe" trên các trang web chuyên dụng để thực hành kỹ thuật CLI này. Đó là môi trường an toàn và tốt nhất để bạn tự tay tạo ra những bản vá đầu tiên trong phòng thí nghiệm.

> *Bạn đã nắm trong tay quy trình của những chuyên gia hàng đầu. Vậy, bạn đã sẵn sàng để tìm kiếm lỗ hổng đầu tiên và tự tay tạo ra một bản vá cho riêng mình chưa?*

## Kết quả cần đạt

- Truy dữ liệu từ input đến `cmp/test` và conditional branch.
- Phân biệt branch behavior, business rule và security boundary.
- Chứng minh vì sao client-side-only decision không phải trust anchor.
- Đề xuất fix từ source cùng test tampering.

## 1. Branch không phải root cause

Một branch chỉ thể hiện quyết định tại build cụ thể. Đổi `je` thành `jne` có thể thay outcome nhưng:

- Không sửa dữ liệu đầu vào không đáng tin.
- Không tạo authorization đáng tin cậy.
- Có thể phá error path và gây fail-open.
- Không tồn tại sau rebuild/version update.
- Không cung cấp test, review, provenance hoặc rollback đúng chuẩn.

## 2. Toy case study

```c
#include <stdbool.h>
#include <string.h>

bool feature_allowed(const char *role, bool server_approved) {
    if (role == NULL) return false;
    return server_approved && strcmp(role, "student-lab") == 0;
}
```

Phiên bản lỗi chỉ kiểm tra `role` đọc từ file cục bộ. Phiên bản sửa còn yêu cầu `server_approved` từ thành phần tin cậy giả lập. Đây là mô hình dạy trust boundary, không phải cơ chế license production.

## 3. Data-flow questions

1. Input được tạo ở đâu và ai kiểm soát?
2. Parse/normalize trước hay sau validation?
3. Giá trị có chữ ký/xác thực hoặc freshness không?
4. Có đường gọi nào bỏ qua validation không?
5. Failure/timeout dẫn đến deny hay allow?
6. UI state có bị dùng thay authorization server-side không?

## 4. Lab

1. Chạy test matrix cho `role = NULL`, empty, `student-lab`, mixed case và chuỗi dài.
2. Dùng symbol để tới `feature_allowed` và vẽ CFG.
3. Ghi data origin, comparison, branch và caller sử dụng return value.
4. Không sửa jump. Chuyển sang source, bổ sung trust input và fail-closed.
5. Thêm unit test cho config tampering, timeout và approval false.
6. Build lại, tính hash và kiểm tra behavior cũ không bị phá.

## 5. Finding template

```markdown
Title: Authorization decision relies on user-controlled local role
Impact: Local user may request a privileged UI path
Evidence: input origin + CFG + test case; no third-party target
Root cause: untrusted client field used as sole authorization decision
Fix: enforce decision at trusted service; verify signed response; fail closed
Regression: allow valid approval, deny missing/invalid/stale approval
Residual risk: offline mode and clock policy require separate design
```

## Bài tập và rubric

Nộp CFG, data-flow map, finding và source fix. Chấm: root cause 30, evidence 25, remediation 20, tests 15, residual risk 10. Bài chỉ đảo opcode/branch không đạt.

