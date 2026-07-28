# Tuần 4: Stepping, call stack và breakpoint

## Nguồn bài học

- **Stepping Into Call Function of x64dbg**.
- **How to Use Breakpoints in Software Cracking**.
- Kỹ thuật được áp dụng để debug toy binary, không nhằm vượt kiểm soát phần mềm thật.

## Kết quả cần đạt

- Chọn đúng run, pause, step into, step over, run until return và run to user code.
- Phân biệt software, hardware, memory và conditional breakpoint.
- Đọc call stack, argument/return value theo calling convention.
- Tạo debugging timeline có thể lặp lại sau restart.

## 1. Stepping đúng mục đích

| Thao tác | Dùng khi | Rủi ro |
|---|---|---|
| Step into | Muốn hiểu callee | Rơi sâu vào runtime/library |
| Step over | Call đã biết/không liên quan | Bỏ qua side effect cần quan sát |
| Run until return | Đang ở callee không cần thiết | Có thể chạy nhiều code hơn dự kiến |
| Run to user code | Muốn bỏ loader/runtime | Tool có thể nhận diện module chưa hoàn hảo |
| Pause | Cần snapshot trạng thái | Dừng giữa critical section có thể làm lệch timing |

## 2. Breakpoint types

- **Software breakpoint:** thường thay instruction bằng trap byte; linh hoạt nhưng thay đổi code memory tạm thời.
- **Hardware breakpoint:** dùng debug register; số lượng ít, phù hợp execute/read/write tại địa chỉ cụ thể.
- **Memory breakpoint:** theo dõi page access; có thể noisy và ảnh hưởng timing.
- **Conditional breakpoint:** chỉ dừng khi expression/thread/counter thỏa điều kiện.

Breakpoint là công cụ quan sát, không phải bằng chứng tự thân. Luôn ghi câu hỏi mà breakpoint đang kiểm tra.

## 3. Calling convention x64 khái quát

Trên Windows x64, bốn integer/pointer argument đầu thường qua `RCX`, `RDX`, `R8`, `R9`; return value thường ở `RAX`. Stack vẫn chứa return address, shadow space và dữ liệu khác. Compiler có thể inline hoặc tối ưu nên không áp dụng máy móc.

## 4. Lab từng bước

Target là `toy_control_flow` do khóa cung cấp.

1. Tính hash, tạo working copy và snapshot.
2. Đặt breakpoint tại `main` bằng symbol hoặc module entry đã xác minh.
3. Run tới `classify_score` và ghi thread/call stack.
4. Quan sát argument trước call, step into, ghi branch và `RAX` trước return.
5. Restart target; đặt conditional breakpoint chỉ khi score bằng `80`.
6. Tạo hardware execute breakpoint tại cùng function và so sánh hành vi.
7. Xóa breakpoint, restart và chứng minh target chạy bình thường.

## 5. Debugging timeline

```markdown
Question: classify_score nhận input ở đâu?
Breakpoint: toy.exe + RVA <...>
Precondition: argv[1] = 80
Observation: first integer argument = 80; return register = 2
State modified by analyst: No
Conclusion: function maps 80 to class 2 (high confidence)
Evidence: W04-E03 screenshot + register export
```

## Lỗi thường gặp

- Đặt breakpoint trên địa chỉ tuyệt đối không ổn định.
- Quên tắt breakpoint rồi đo performance.
- Nhầm first-chance exception với crash cuối cùng.
- Sửa memory/register và trộn kết quả với run nguyên bản.
- Bước qua system library hàng nghìn instruction mà không có câu hỏi.
- Dùng breakpoint quá rộng làm Heisenbug/timing thay đổi.

## Bài tập và rubric

Nộp timeline tối đa 12 bước cho ba input, kèm call stack và so sánh software/hardware breakpoint. Chấm: breakpoint choice 25, call/argument reasoning 25, reproducibility 20, evidence 20, safety 10.

