Yêu cầu người dùng nhập số phần tử của dãy N.<br/>
Yêu cầu người dùng nhập dãy số, các số cách nhau bằng khoảng trắng. Sử dụng hàm map và split để chuyển đổi chuỗi nhập vào thành một danh sách numbers.<br/>
Yêu cầu người dùng nhập số nguyên K.<br/>
Sắp xếp lại dãy số numbers theo thứ tự giảm dần bằng cách sử dụng phương thức sort() với tham số reverse=True.<br/>
Dùng vòng lặp for để duyệt qua từng phần tử trong danh sách numbers.<br.>
Kiểm tra nếu số nguyên K lớn hơn hoặc bằng phần tử thứ i trong danh sách numbers, thì chèn K vào vị trí i trong danh sách numbers. Sau đó, đánh dấu biến inserted = True và thoát khỏi vòng lặp bằng break.<br.>
Nếu không chèn được K vào bất kỳ vị trí nào trong danh sách numbers, tức là K lớn hơn tất cả các phần tử trong danh sách, thì chèn K vào cuối danh sách bằng cách sử dụng phương thức append().<br/>
In dãy số đã xếp lại giảm dần bằng cách sử dụng phương thức join() để chuyển danh sách numbers thành một chuỗi và in ra màn hình.<br/>
In dãy số đã xếp lại giảm dần và đã chèn thêm số nguyên K bằng cách sử dụng phương thức join() để chuyển danh sách numbers thành một chuỗi và in ra màn hình.<br/>