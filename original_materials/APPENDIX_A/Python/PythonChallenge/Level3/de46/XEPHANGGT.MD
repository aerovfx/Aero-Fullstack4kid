** Đọc dữ liệu từ file XEPHANG.INP:<br/>
** Đọc số học sinh n từ dòng đầu tiên của file.<br/>
Đọc danh sách chiều cao của từng học sinh từ dòng thứ hai của file.<br/>
Tạo hàm count_max_height_friends(heights):<br/>
Khởi tạo một từ điển height_count để đếm số lần xuất hiện của từng chiều cao.<br/>
Duyệt qua danh sách chiều cao heights, nếu chiều cao đã xuất hiện thì tăng số lần xuất hiện trong từ điển height_count, nếu chưa thì thêm chiều cao đó vào từ điển với số lần xuất hiện là 1.<br/>
Tìm chiều cao xuất hiện nhiều nhất và số lần xuất hiện của nó bằng cách sử dụng hàm max() và key=height_count.get.<br/>
Trả về chiều cao xuất hiện nhiều nhất và số lần xuất hiện đó.
Thực hiện hàm chính main():
Đọc dữ liệu từ file XEPHANG.INP.
Gọi hàm count_max_height_friends() để tìm chiều cao xuất hiện nhiều nhất và số lần xuất hiện của nó.
Ghi kết quả vào file XEPHANG.OUT theo đúng định dạng yêu cầu:
Ghi lần lượt các cặp số (số bạn có chiều cao bằng nhau, chiều cao) trên mỗi dòng của file XEPHANG.OUT.
Trong khi số bạn có chiều cao bằng nhau nhiều nhất lớn hơn 0:
Ghi số bạn có chiều cao bằng nhau nhiều nhất và chiều cao tương ứng vào file XEPHANG.OUT.
Loại bỏ các bạn đã được đếm ra khỏi danh sách heights.
Tìm chiều cao xuất hiện nhiều nhất trong danh sách heights và tiếp tục thực hiện các bước trên cho đến khi không còn chiều cao nào xuất hiện nhiều nhất.
Kết thúc chương trình:
Chương trình kết thúc sau khi thực hiện xong hàm main().
File XEPHANG.OUT sẽ chứa kết quả đếm số bạn có chiều cao bằng nhau nhiều nhất theo đúng định dạng yêu cầu.



