Hội thi tin học trẻ năm nay có sự tham gia của N học sinh đến từ khắp mọ miền trên địa bàn tỉnh Nghệ An. Một điều đặc biệt hơn nữa là tên của tất cả các em biểu diễn bởi các xâu ký tự không dấu đôi một khác nhau và có độ dài không lớn hơn 10 ký tự
Ngay khi đến với hội thi. Ban tổ chức tiến hành phát phiếu ghi danh và đã thu về tổng cộng N - 1 phiếu với N - 1 tên khác nhau.

Yêu cầu: Cho biết danh sách các tên của tất cả N học sinh, N - 1 tên học sinh đã ghi trong phiếu và các em đều ghi đúng tên của mình. Hãy xác định tên học sinh chưa tham gia ghi danh tại hội thi
Dữ liệu:

File dữ liệu vào có tên: DIEMDANH.INP
3
AN
VIET
TUNG
AN
TUNG
Dòng đầu tiên chưa số nguyên dương N.
N dòng tiếp theo, mỗi dòng là một xâu ký tự xác định tên của từng em học sinh đã ghi danh.
Kết quả
Ghi ra file DIEMDANH.OUT tên của các em học sinh chưa tham gia ghi danh tại hội thi
File dữ liệu đầu ra: DIEMDANH.OUT
VIET

Chú ý: Các tên đều cho dưới dạng xâu ký tự la tinh in hoa và không có dấu cách

Phân tích: Để giải bài toán, ta tạo danh sách có tên là điem_danh, danh sách này ban đầu ta thêm toàn bộ các giá trị là 0 tương ứng chưa có mặt. Khi duyệt các bạn đã ghi danh tại hội thi ta đổi giá trụ tại vị trí của bạn đó thành 1. Cuối cùng giá trị 0 còn lại chính là bạn chưa ghi danh.
Chú ý khi duyệt các dòng, nếu có gíá trị trùng lặp thì đổi giá trị tại vị trí đó thành 1, in ra giá trị 0 là tên thí sinh chưa ghi danh