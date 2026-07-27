# Buổi 3: ADC, cảm biến ánh sáng và âm thanh

> **Câu hỏi lớn:** Làm sao biến tín hiệu liên tục thành quyết định số đáng tin?  
> **Sản phẩm:** Đèn tự động và công tắc vỗ tay  
> **Thời lượng:** 90–120 phút · **Nhóm:** 3–4 học sinh

## 1. Mục tiêu

Sau bài học, em có thể:

1. Giải thích: ADC; dải 0–65535; sampling; trung bình; threshold; hysteresis.
2. Vẽ sơ đồ input–process–output và bảng chân kết nối.
3. Lập trình nguyên mẫu MicroPython đáp ứng chức năng chính.
4. Kiểm thử bằng dữ liệu, chẩn đoán lỗi và thực hiện một cải tiến.
5. Làm việc an toàn và giải thích quyết định thiết kế.

## 2. Chuẩn bị và an toàn

**Thiết bị:** Pico, light sensor, sound sensor, LED.

- Xác nhận điện áp và chân từ nhãn/tài liệu đúng phiên bản kit.
- Pico dùng GPIO 3,3 V; không đưa tín hiệu 5 V trực tiếp vào GPIO.
- Ngắt nguồn trước khi thay dây. Motor/servo dùng driver và nguồn phù hợp.
- Giáo viên duyệt sơ đồ trước khi cấp nguồn.

## 3. Khởi động — 10 phút

Vẽ nhanh hệ thống và ghi: input nào được đo, chương trình phải quyết định gì, output nào thay đổi, trạng thái lỗi an toàn là gì. Chia sẻ dự đoán với bạn cùng nhóm.

## 4. Kiến thức cốt lõi — 15 phút

**Từ khóa:** ADC; dải 0–65535; sampling; trung bình; threshold; hysteresis.

Một hệ embedded đáng tin cậy cần bốn lớp: kết nối điện đúng, đọc input ổn định, thuật toán xử lý rõ ràng và output có trạng thái an toàn. Giá trị ngưỡng phải dựa trên dữ liệu của chính cảm biến, không sao chép máy móc từ nhóm khác.

## 5. Mã MicroPython khung

Các số GPIO và hằng số dưới đây là điểm khởi đầu. Hãy thay bằng cấu hình đã được kiểm tra của bộ kit.

```python
from machine import ADC, Pin
from time import sleep_ms
sensor = ADC(26)  # ADC0, xác nhận theo kit
led = Pin(15, Pin.OUT)
def average(n=10):
    return sum(sensor.read_u16() for _ in range(n)) // n
while True:
    value = average()
    led.value(value < 25000)  # hiệu chuẩn lại
    sleep_ms(100)
```

Trước khi chạy, hãy chú thích từng khối: **khởi tạo**, **đọc input**, **xử lý**, **điều khiển output**, **xử lý lỗi**.

## 6. Thực hành có hướng dẫn — 25 phút

1. Điền bảng chân, kiểm tra VCC/GND/signal và vẽ sơ đồ.
2. Chạy một chương trình chỉ kiểm tra input; ghi giá trị thực tế.
3. Chạy một chương trình chỉ kiểm tra output ở mức an toàn.
4. Tích hợp input–process–output; thêm thông báo trạng thái qua REPL/LCD/LED.
5. Lưu phiên bản `Lop_Nhom_Pico_Bai03_v1.py`.

## 7. Thử thách chế tạo — 35 phút

Hoàn thiện **Đèn tự động và công tắc vỗ tay**. Sản phẩm phải có chức năng chính, trạng thái chờ, trạng thái lỗi và cách dừng/reset an toàn. Nhóm tự chọn một cải tiến phục vụ người dùng thay vì chỉ trang trí.

### Tiêu chí thành công

- [ ] Chức năng chính hoạt động lặp lại ổn định.
- [ ] Kết nối đúng điện áp, nguồn và driver.
- [ ] Mã có tên biến/hàm rõ ràng và không dùng delay dài vô lý.
- [ ] Có phản hồi trạng thái và xử lý ít nhất một lỗi.
- [ ] Mọi thành viên giải thích được một phần hệ thống.

## 8. Kiểm thử và dữ liệu — 15 phút

**Yêu cầu riêng:** ghi ≥10 mẫu ở ba điều kiện; chọn ngưỡng từ dữ liệu; thử báo sai.

| Lần | Điều kiện/input | Dự kiến | Thực tế/dữ liệu | Đạt? | Điều chỉnh |
|---:|---|---|---|:---:|---|
| 1 | Bình thường | | | | |
| 2 | Điều kiện khác | | | | |
| 3 | Biên/ngưỡng | | | | |
| 4 | Lỗi/mất tín hiệu | An toàn | | | |
| 5 | Sau cải tiến | | | | |

Chỉ thay đổi một yếu tố mỗi lần và chạy lại cùng ca kiểm thử.

## 9. Mở rộng

- **Hỗ trợ:** dùng mã khung và hoàn thành chức năng tối thiểu.
- **Đạt chuẩn:** tách chương trình thành ít nhất hai hàm và thêm xử lý lỗi.
- **Nâng cao:** thêm lọc dữ liệu, state machine, class/module hoặc giao diện dữ liệu.
- **Pico W/IoT:** nếu phù hợp, xuất dữ liệu qua web/MQTT; không ghi mật khẩu vào mã chia sẻ.

## 10. Báo cáo và exit ticket

Demo 60–90 giây: **vấn đề → sơ đồ → chức năng → dữ liệu → cải tiến**.

1. Phần nào em trực tiếp thực hiện?
2. Dữ liệu nào chứng minh sản phẩm đáng tin?
3. Lỗi khó nhất là gì và nhóm cô lập nguyên nhân ra sao?
4. Nếu làm phiên bản tiếp theo, em thay đổi điều gì?

## Hồ sơ nộp

Mã nguồn, bảng chân, ảnh mạch, bảng kiểm thử, ảnh/video demo và phản tư cá nhân. Tên bản cuối: `Lop_Nhom_Pico_Bai03_final.py`.
