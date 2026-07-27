# Khung chương trình 36 buổi micro:bit STEM

Mỗi bài dùng cấu trúc 90 phút trong hướng dẫn giáo viên. Cột “đạt chuẩn” là căn cứ thiết kế hoạt động và đánh giá, không chỉ là mô tả nội dung.

## Giai đoạn 1 — Làm quen và nền tảng lập trình

| Bài | Chủ đề và câu hỏi lớn | Sản phẩm/thiết bị | Trọng tâm | Minh chứng đạt chuẩn | Thử thách mở rộng |
|---:|---|---|---|---|---|
| 1 | **Khám phá micro:bit** — Một máy tính tí hon nhận và phát thông tin thế nào? | Thẻ tên số; micro:bit | Input–process–output, LED 5×5, nút, USB, an toàn | Nạp được chương trình, gọi đúng 4 bộ phận, tuân thủ checklist | Thiết kế biểu tượng cá nhân có hoạt ảnh |
| 2 | **Điều khiển LED** — Làm sao biểu diễn thông tin bằng 25 điểm sáng? | Biển báo động; LED tích hợp | Tọa độ, trạng thái on/off, pause, sequence | Tạo hoạt ảnh ≥3 khung, đúng thời gian | Mã hóa chữ/số thành biểu tượng tối giản |
| 3 | **Biến và phép toán** — Máy tính lưu và cập nhật giá trị ra sao? | Bộ đếm sự kiện; nút A/B | Biến, gán, tăng/giảm, toán tử | Bộ đếm không âm, hiển thị đúng sau ≥10 thao tác | Thêm reset và giới hạn trên |
| 4 | **Điều kiện** — Thiết bị quyết định dựa vào dữ liệu thế nào? | Huy hiệu cảm xúc; nút/cảm biến | Boolean, if/else, so sánh | Có ≥2 nhánh và kiểm thử mọi nhánh | Dùng if/else-if cho 3 trạng thái |
| 5 | **Vòng lặp** — Khi nào nên lặp thay vì sao chép lệnh? | Đèn tín hiệu theo chu kỳ | repeat, forever, while, biến đếm | Rút gọn mã và giải thích điều kiện dừng | Tạo nhịp có chu kỳ thay đổi |
| 6 | **Hàm** — Làm sao tổ chức mã để dễ đọc và tái sử dụng? | Thư viện hiệu ứng LED | Hàm, tham số, phân rã bài toán | Có ≥2 hàm được gọi nhiều lần; tên có nghĩa | Hàm nhận tham số tốc độ/biểu tượng |

**Đánh giá giai đoạn:** quiz 10 câu + thử thách cá nhân “bộ đếm có cảnh báo”.

## Giai đoạn 2 — Điều khiển thiết bị

| Bài | Chủ đề và câu hỏi lớn | Sản phẩm/thiết bị | Trọng tâm | Minh chứng đạt chuẩn | Thử thách mở rộng |
|---:|---|---|---|---|---|
| 7 | **Buzzer** — Dữ liệu số tạo âm thanh thế nào? | Chuông cửa/melody; buzzer | Tần số, cao độ, nhịp, digital output | Phát ≥4 nốt đúng thứ tự, có nút kích hoạt | Soạn tín hiệu âm thanh cho 3 trạng thái |
| 8 | **Servo** — Làm sao điều khiển chính xác một góc quay? | Cửa tự động; servo | PWM, góc, cơ cấu chấp hành | Đóng/mở đúng 2 góc, không kẹt cơ khí | Điều khiển 3 vị trí và chuyển động êm |
| 9 | **RGB LED** — Ba màu cơ bản phối thành màu mới ra sao? | Đèn trang trí; RGB/NeoPixel | RGB, độ sáng, dãy pixel | Tạo ≥3 màu và một hiệu ứng lặp | Ánh xạ dữ liệu cảm biến sang màu |
| 10 | **Motor rung** — Phản hồi xúc giác truyền thông tin gì? | Đồng hồ nhắc việc; motor rung | Nhịp rung, duty cycle, driver | Phân biệt được ≥2 mẫu rung | Mã Morse bằng rung |
| 11 | **Cảm ứng chạm** — Cơ thể người trở thành input thế nào? | Đàn phím cảm ứng; touch | Capacitive touch, debounce, event | Ba vùng chạm tạo ba phản hồi ổn định | Tạo mật mã chạm theo chuỗi |
| 12 | **Cổng logic** — Nhiều điều kiện phối hợp để ra quyết định ra sao? | Báo động hai điều kiện | AND, OR, NOT, bảng chân trị | Mã khớp bảng chân trị với mọi tổ hợp | Thiết kế chế độ armed/disarmed |

**Đánh giá giai đoạn:** quiz + bài thực hành “thiết bị báo hiệu đa phương thức”.

## Giai đoạn 3 — Cảm biến và đo lường

| Bài | Chủ đề và câu hỏi lớn | Sản phẩm/thiết bị | Trọng tâm | Minh chứng đạt chuẩn | Thử thách mở rộng |
|---:|---|---|---|---|---|
| 13 | **Âm thanh** — Làm sao biến tiếng động thành hành động? | Vỗ tay bật đèn; sound | Analog, ngưỡng, nhiễu | Thu ≥10 mẫu, chọn ngưỡng có căn cứ | Lọc trung bình, chống kích hoạt kép |
| 14 | **Từ trường** — Có thể phát hiện cửa mở mà không chạm không? | Báo mở cửa; Hall/reed | Digital input, nam châm, trạng thái | Phát hiện đúng ≥9/10 lần | Thêm trễ vào/ra và chế độ kích hoạt |
| 15 | **Siêu âm** — Khoảng cách được đo bằng thời gian thế nào? | Thước điện tử; ultrasonic | Time-of-flight, vận tốc âm, sai số | Đo 3 khoảng cách, sai số theo tiêu chí lớp | Hiệu chuẩn tuyến tính và cảnh báo vùng |
| 16 | **Độ ẩm đất** — Khi nào cây thực sự cần nước? | Chậu cây thông minh; soil sensor | Analog, hiệu chuẩn khô/ướt, ngưỡng | Có dữ liệu khô–ẩm–ướt và ngưỡng giải thích được | Trung bình trượt, hysteresis |
| 17 | **Nhiệt độ** — Đo nhiệt độ chip khác môi trường ra sao? | Nhiệt kế số; sensor tích hợp | Đo, offset, °C/°F, hạn chế cảm biến | So với nhiệt kế chuẩn và tính offset | Ghi chuỗi thời gian, cảnh báo nhiệt |
| 18 | **Gia tốc kế** — Thiết bị nhận biết chuyển động và tư thế thế nào? | Xúc xắc điện tử; accelerometer | Trục x/y/z, gesture, random | Lắc tạo 1–6, phân bố được kiểm thử | Đếm bước hoặc cảnh báo ngã mô phỏng |
| 19 | **La bàn** — Từ trường Trái Đất giúp định hướng ra sao? | La bàn số; magnetometer | Heading, calibration, mapping | Hiệu chuẩn và chỉ 4 hướng chính | La bàn 8 hướng, cảnh báo nhiễu từ |
| 20 | **Đa cảm biến** — Làm sao giảm báo động sai? | Cảnh báo môi trường; ≥2 sensor | Sensor fusion, AND/OR, state | Sơ đồ hệ thống rõ và test ≥4 kịch bản | Xếp mức cảnh báo xanh–vàng–đỏ |

**Đánh giá giai đoạn:** hồ sơ dữ liệu một cảm biến + quiz + demo hệ đa cảm biến.

## Giai đoạn 4 — Dữ liệu, giao tiếp và lập trình nâng cao

| Bài | Chủ đề và câu hỏi lớn | Sản phẩm/thiết bị | Trọng tâm | Minh chứng đạt chuẩn | Thử thách mở rộng |
|---:|---|---|---|---|---|
| 21 | **Mảng** — Làm sao lưu và phân tích nhiều lần đo? | Bộ phân tích điểm/dữ liệu | Array/list, index, loop, min/max/mean | Xử lý ≥5 giá trị và giải thích index | Thu dữ liệu cảm biến trực tiếp |
| 22 | **Chuỗi** — Thiết bị tạo thông điệp có cấu trúc thế nào? | Biển tên/thông báo | String, nối, độ dài, parse đơn giản | Tạo thông điệp từ ≥3 phần dữ liệu | Giao thức `ID:VALUE:UNIT` |
| 23 | **Radio** — Hai thiết bị trao đổi dữ liệu không dây ra sao? | Bộ đàm số; 2 micro:bit | Group/channel, send/receive, protocol | Gửi nhận hai chiều ổn định trong 10 lần | ACK, số thứ tự gói tin |
| 24 | **Điều khiển từ xa** — Cử chỉ ở thiết bị A điều khiển B thế nào? | Remote nghiêng điều khiển servo | Mapping, radio, sender/receiver | Điều khiển ≥3 trạng thái, có failsafe | Điều khiển tỷ lệ theo góc nghiêng |
| 25 | **Phát triển trò chơi** — Luật chơi được chuyển thành trạng thái và mã ra sao? | Kéo–búa–bao | Random, state, event, fairness | Chơi ≥10 lượt, tính điểm đúng | Hai người chơi qua radio |
| 26 | **Mini IoT** — Dữ liệu thiết bị được đóng gói để quan sát thế nào? | Trạm dữ liệu serial | Sampling, CSV/JSON, serial, privacy | Xuất dữ liệu có timestamp/nhãn, đọc được | Vẽ biểu đồ và phát hiện bất thường |
| 27 | **Thuật toán** — Giải pháp nào đúng và hiệu quả hơn? | Tìm kiếm/sắp xếp dữ liệu nhỏ | Linear search, bubble sort, complexity trực quan | Trace đúng từng bước trên mảng | So sánh số phép toán hai thuật toán |
| 28 | **Gỡ lỗi** — Làm sao tìm nguyên nhân thay vì sửa ngẫu nhiên? | Phòng khám mã lỗi | Syntax/logic/hardware, logging, test case | Chẩn đoán ≥4 lỗi và ghi nguyên nhân–cách sửa | Tạo bộ test hồi quy |

**Đánh giá giai đoạn:** code review theo cặp + thử thách sửa lỗi có giới hạn thời gian.

## Giai đoạn 5 — Dự án STEAM tích hợp

| Bài | Vấn đề thiết kế | Sản phẩm/thiết bị | Yêu cầu tối thiểu | Dữ liệu kiểm thử | Nâng cấp |
|---:|---|---|---|---|---|
| 29 | **Nhà thông minh** — Tiện nghi nhưng vẫn tiết kiệm và an toàn | Mô hình phòng; light/temp/touch, LED/servo/buzzer | ≥2 input, ≥2 output, 3 trạng thái | Test ma trận ngày/đêm × có/không người | Điều khiển radio và chế độ tiết kiệm |
| 30 | **Trạm thời tiết** — Dữ liệu nào giúp ra quyết định hằng ngày? | Temp + light station | Đo, hiển thị, cảnh báo, ghi dữ liệu | ≥20 mẫu theo thời gian, biểu đồ | Trạm gửi dữ liệu qua radio |
| 31 | **Bãi đỗ xe thông minh** — Hệ thống nhận biết chỗ trống và mở chắn thế nào? | Ultrasonic + servo + LED | Phát hiện xe, barrier an toàn, đèn trạng thái | 10 lượt xe, ghi lỗi nhận dạng | Bộ đếm sức chứa và biển từ xa |
| 32 | **Robot tránh vật cản** — Robot tự chọn hướng dựa vào khoảng cách ra sao? | Ultrasonic + motor/servo | Dừng–lùi–rẽ, ngưỡng an toàn | Hoàn thành đường thử 3 lần | So sánh hai chiến lược điều hướng |
| 33 | **Tưới cây thông minh** — Làm sao tưới đủ mà không lãng phí? | Soil sensor + driver/pump | Hiệu chuẩn, hysteresis, giới hạn thời gian bơm | Độ ẩm trước/sau và lượng nước | Radio dashboard/cảnh báo cạn nước |
| 34 | **Chống trộm** — Làm sao vừa phát hiện tốt vừa giảm báo giả? | Magnetic/motion + buzzer/radio | Arm/disarm, delay, cảnh báo tại chỗ/từ xa | Test ≥8 tình huống kể cả lỗi cảm biến | Mật mã, nhật ký sự kiện |

**Đánh giá giai đoạn:** rubric nguyên mẫu gồm vấn đề 15%, thiết kế 20%, chức năng 25%, kiểm thử 20%, truyền thông 10%, hợp tác 10%.

## Giai đoạn 6 — Dự án cuối khóa

### Bài 35 — Thiết kế và tạo mẫu

**Câu hỏi lớn:** Làm sao biến một nhu cầu thật thành sản phẩm có thể kiểm chứng?

- Khảo sát người dùng/vấn đề và viết một câu tuyên bố nhu cầu.
- Xác định tối thiểu 3 tiêu chí thành công và 2 ràng buộc.
- Đề xuất ít nhất 2 phương án, dùng ma trận lựa chọn có trọng số.
- Vẽ sơ đồ khối input–process–output, sơ đồ kết nối và pseudocode.
- Lập bảng phân công, rủi ro, vật tư và kế hoạch kiểm thử.
- Tạo nguyên mẫu chức năng tối thiểu; giáo viên duyệt an toàn trước khi cấp nguồn.

**Minh chứng:** hồ sơ thiết kế 1–2 trang + nguyên mẫu phiên bản 1 + phản hồi từ ít nhất hai người.

### Bài 36 — Hoàn thiện, demo và bảo vệ

**Câu hỏi lớn:** Bằng chứng nào cho thấy giải pháp có giá trị và đáng tin cậy?

- Thực hiện kế hoạch kiểm thử; ghi ít nhất 5 ca kiểm thử và một cải tiến có căn cứ.
- Chuẩn bị bài trình bày 5 phút: vấn đề, người dùng, giải pháp, thiết kế, dữ liệu, hạn chế.
- Demo trực tiếp 3 phút và trả lời Q&A 3 phút.
- Đánh giá đồng đẳng, tự đánh giá vai trò và nộp hồ sơ số.

**Minh chứng:** sản phẩm hoạt động, mã nguồn, nhật ký kỹ thuật, bảng dữ liệu, poster/slide và phản tư cá nhân.

## Chuẩn hóa giáo án chi tiết

Khi phát triển mỗi bài thành giáo án đầy đủ, dùng mẫu `02_MAU_GIAO_AN_CHUAN.md`. Mỗi giáo án phải có:

1. mục tiêu dùng động từ quan sát/đo được;
2. câu hỏi lớn và bối cảnh thực;
3. tiêu chí thành công công khai trước hoạt động;
4. sơ đồ hệ thống, thuật toán và lưu ý an toàn;
5. tối thiểu ba ca kiểm thử;
6. phương án hỗ trợ và thử thách mở rộng;
7. đánh giá nhanh cuối buổi;
8. ghi chú về khác biệt micro:bit V1/V2 và phần cứng thay thế nếu có.
