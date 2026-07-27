# Bài 3: Biến và phép toán

> **Câu hỏi lớn:** Máy tính lưu và cập nhật một con số ra sao?  
> **Sản phẩm:** Bộ đếm sự kiện bằng nút A/B  
> **Thời lượng:** 90 phút · **Hình thức:** nhóm 3–4 học sinh

## 1. Mục tiêu bài học

Sau bài học, em có thể:

1. Giải thích các ý chính: biến; phép gán; cộng/trừ; giới hạn dữ liệu.
2. Vẽ được sơ đồ **Input → Process → Output** cho sản phẩm.
3. Lắp và lập trình một nguyên mẫu đáp ứng yêu cầu.
4. Thực hiện ít nhất ba lần kiểm thử, ghi dữ liệu và cải tiến dựa trên bằng chứng.
5. Phối hợp an toàn, trình bày được vai trò và đóng góp của mình.

## 2. Thiết bị

micro:bit, cáp USB. Chuẩn bị thêm giấy A4, bút, thước, nhật ký kỹ thuật và vật liệu chế tạo nếu cần.

> **An toàn:** Ngắt nguồn trước khi đổi kết nối. Kiểm tra đúng chân tín hiệu, 3V và GND. Không cấp nguồn motor, servo hoặc bơm trực tiếp từ chân I/O nếu module yêu cầu driver. Giữ bo mạch tránh xa nước và vật dẫn điện.

## 3. Khởi động — 8 phút

Quan sát một ví dụ thực tế liên quan đến sản phẩm. Trong 2 phút, mỗi em viết một dự đoán: hệ thống cần nhận dữ liệu gì, xử lý ra sao và tạo đầu ra nào. Cả nhóm thống nhất một sơ đồ ban đầu.

**Câu hỏi suy nghĩ:** Sau 10 thao tác theo chuỗi A,A,B,A,B, kết quả phải là bao nhiêu?

## 4. Kiến thức cốt lõi — 15 phút

- Từ khóa: biến; phép gán; cộng/trừ; giới hạn dữ liệu.
- Mọi hệ thống đều có thể mô tả bằng **Input → Process → Output**.
- Chương trình tốt cần rõ trạng thái bắt đầu, điều kiện chuyển trạng thái và trường hợp lỗi.
- Một kết quả chỉ đáng tin khi được kiểm thử trong nhiều điều kiện và có dữ liệu ghi lại.

### Thuật toán gợi ý

```text
set count=0; A: count=count+1; B: if count>0 then count=count-1; A+B: count=0
```

Hãy chuyển thuật toán thành sơ đồ khối trước khi mở MakeCode. Không sao chép chương trình khi chưa giải thích được từng bước.

## 5. Nhiệm vụ chế tạo — 35 phút

1. **Xác định yêu cầu:** Gạch chân input, process và output trong mô tả sản phẩm.
2. **Thiết kế:** Vẽ sơ đồ kết nối; giáo viên kiểm tra trước khi cấp nguồn.
3. **Tạo phiên bản tối thiểu:** Chỉ làm một chức năng chính hoạt động trước.
4. **Kiểm thử từng phần:** thử input, logic, rồi output riêng biệt.
5. **Tích hợp:** ghép các phần và thêm biểu tượng hoặc thông báo trạng thái.
6. **Lưu phiên bản:** đặt tên tệp `Lop_Nhom_Bai03_v1` và chụp sơ đồ kết nối.

### Tiêu chí thành công

- [ ] A tăng, B giảm, A+B đặt lại; giá trị không nhỏ hơn 0.
- [ ] Kết nối chắc chắn, đúng nguồn và đúng chân.
- [ ] Người khác nhìn mã có thể nhận ra các phần input, process và output.
- [ ] Có dữ liệu từ ít nhất ba lần thử, bao gồm một trường hợp biên hoặc lỗi.
- [ ] Tất cả thành viên giải thích được một phần của sản phẩm.

## 6. Bảng kiểm thử — 12 phút

| Lần | Input/điều kiện | Kết quả dự kiến | Kết quả thực tế | Đạt? | Điều chỉnh |
|---:|---|---|---|:---:|---|
| 1 | Điều kiện bình thường | | | | |
| 2 | Điều kiện biên | | | | |
| 3 | Input sai/không có tín hiệu | Hệ thống an toàn | | | |
| 4 | Sau khi cải tiến | | | | |

Chỉ thay đổi **một yếu tố mỗi lần**, sau đó chạy lại bài kiểm thử để biết thay đổi nào tạo ra kết quả.

## 7. Thử thách cải tiến — 12 phút

- **Mức 1 — Hỗ trợ:** hoàn thiện chức năng chính bằng chương trình khung và chú thích từng bước.
- **Mức 2 — Đạt chuẩn:** thêm giao diện trạng thái và xử lý một trường hợp lỗi.
- **Mức 3 — Nhà sáng chế:** thêm hiệu chuẩn, bộ lọc, radio, lưu dữ liệu hoặc một chế độ tiết kiệm năng lượng phù hợp.

Khi chọn tính năng mới, nhóm phải nêu lợi ích và tiêu chí để biết tính năng đó thực sự tốt hơn.

## 8. Báo cáo và đánh giá — 8 phút

Mỗi nhóm demo trong 60 giây theo cấu trúc: **vấn đề → giải pháp → dữ liệu kiểm thử → điều đã cải tiến**.

### Exit ticket cá nhân

1. Em đã tạo hoặc sửa phần nào?
2. Dữ liệu nào chứng minh sản phẩm hoạt động?
3. Nếu có thêm 30 phút, em sẽ cải tiến điều gì và vì sao?

### Tự đánh giá

| Tiêu chí | Chưa đạt | Đang đạt | Đạt tốt |
|---|:---:|:---:|:---:|
| Hiểu khái niệm và thuật toán | ☐ | ☐ | ☐ |
| Kết nối và lập trình an toàn | ☐ | ☐ | ☐ |
| Kiểm thử bằng dữ liệu | ☐ | ☐ | ☐ |
| Hợp tác và giải thích | ☐ | ☐ | ☐ |

## 9. Hồ sơ cần nộp

- Mã chương trình; ảnh sơ đồ kết nối và nguyên mẫu.
- Bảng kiểm thử đã điền; một ảnh/video minh chứng.
- Phản tư cá nhân 3–5 câu và tên phiên bản cuối `Lop_Nhom_Bai03_final`.
