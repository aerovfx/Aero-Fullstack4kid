Đọc dữ liệu từ input.
Tạo một mảng kết quả có độ dài bằng n và ban đầu tất cả các phần tử đều bằng 0.
Duyệt qua từng đoàn viên và kiểm tra số lượng đoàn viên có thời gian chạy nhỏ hơn hoặc bằng thời gian chạy của đoàn viên hiện tại.
Gán số lượng đoàn viên tìm được vào mảng kết quả.
In ra kết quả từ mảng kết quả.

Bước này là để đọc dữ liệu từ input. Đầu tiên, chúng ta đọc số nguyên n, biểu thị số đoàn viên tham gia chạy. Sau đó, đọc dãy thời gian chạy của các đoàn viên vào mảng times.

Ở bước này, chúng ta tạo một mảng results có độ dài bằng n, và tất cả các phần tử trong mảng đều được khởi tạo là 0. Mảng này sẽ lưu trữ số lượng đoàn viên được trao giải tương ứng với từng đoàn viên.

Bước này tính toán số lượng đoàn viên được trao giải tương ứng với từng đoàn viên. Chúng ta duyệt qua từng đoàn viên, và với mỗi đoàn viên, ta duyệt qua tất cả các đoàn viên khác để kiểm tra xem có bao nhiêu đoàn viên có thời gian chạy nhỏ hơn hoặc bằng thời gian chạy của đoàn viên hiện tại. Nếu điều này xảy ra, ta tăng số lượng đoàn viên được trao giải cho đoàn viên hiện tại lên 1.

Cuối cùng, chúng ta in ra kết quả từ mảng results, tức là số lượng đoàn viên được trao giải tương ứng với từng đoàn viên.