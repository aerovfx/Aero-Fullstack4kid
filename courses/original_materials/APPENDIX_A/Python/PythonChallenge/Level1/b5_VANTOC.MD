Bạn Cà chua đi từ nhà tới trường với quãng đường s = 100m, thời gian đi là t = 5 phút = 300s.
a) hãy dùng print để in vận tốc của bạn Cà chua với v = s/t
b) mở rộng bài toán bằng cách nhập quãng đường s và thời gian t. Sau đó tự in kết quả vận tốc v ra màn hình


Hướng dẫn:

Hàm float() được sử dụng để chuyển đổi chuỗi s và t thành số thực trước khi thực hiện phép chia.
Thay vì sử dụng phương thức read() để đọc toàn bộ nội dung của tệp vào một chuỗi, ta sử dụng readline() để chỉ đọc một dòng đầu tiên từ tệp và loại bỏ dấu cách thừa bằng phương thức strip().
Sử dụng map(float, quangduong_thoigian) để chuyển đổi từng phần tử trong quangduong_thoigian thành số thực và gán vào s và t.
Kết quả được lưu vào biến result mà không cần ghi trực tiếp vào tệp OUTPUT.
Kết quả được ghi vào tệp OUTPUT bằng cách sử dụng write() với định dạng "result\n" để đảm bảo kết quả được ghi trên một dòng mới.