HỘI THI TIN HỌC TRẺ VŨNG TÀU LẦN 12
ĐỀ THÌ BẢNG B CẤP THCS
Thời gian: 120 phút
Ngày 22/4/2023
Bài 1: Chia bánh (6 điểm)
Với mong muốn kỳ thi Tin học trẻ cấp thành phố sẽ là sân chơi bổ ích và vui vẻ cho các bạn học sinh, BTC đã mua N chiéc bánh kem nhỏ xinh để thưởng cho các bạn thí sinh. Vấn đề là BTC muốn tìm ra tất cả các cách chia đều số bánh kem trên cho các bạn mà không cần phải cắt bất kỳ chiếc bánh nào
Yêu cầu: Hãy giúp BTC tìm tất cả các cách chia cho các bạn thí sinh thoả mãn điều kiện trên.
Dữ liệu: Đọc vào từ file CAKES.INP một dòng duy nhất chứa số nguyên N (1 < = N < = 10^(12)) N là số nguyên
Kết quả: Ghi ra file CAKES.OUT: ghi ra đáp án theo thứ tự tăng dần, mỗi số trên một dòng
Ví dụ
CAKES.INP
6

CAKES.OUT
1
2
3
6

Giải thích cách chia:
Với 6 chiếc bảnh, BTC có các cách chia đều như sau: 
1 bạn (mỗi bạn 6 cái)
2 bạn (mỗi bạn 3 cái)
3 bạn (mỗi bạn 2 cái)
6 bạn (mỗi bạn 1 cái)

HƯỚNG DẪN:
Mã trên chia thành hai hàm. Hàm find_divisors(n) tìm tất cả các ước số của số nguyên n và trả về danh sách các ước số được sắp xếp theo thứ tự tăng dần. Hàm divide_cakes(n) gọi hàm find_divisors(n) và trả về danh sách các ước số của n.

Sau đó, mã đọc số nguyên n từ file "CAKES.INP", tính toán các phương án chia bánh bằng cách gọi hàm divide_cakes(n), và ghi kết quả vào file "CAKES.OUT" theo đúng định dạng yêu cầu.