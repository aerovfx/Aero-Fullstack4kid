Mở tệp SO45.INP để đọc dữ liệu. <br/>
Đọc dòng đầu tiên của tệp để lấy hai số nguyên n và k bằng cách sử dụng input_file.readline() và map(int, ...).<br/>
Khởi tạo chuỗi rỗng A để xây dựng chuỗi từ các số từ 1 đến n. Dùng vòng lặp for để ghép các số thành chuỗi A.<br/>
Mở tệp SO45.OUT để ghi kết quả. Ghi chuỗi A vào dòng đầu tiên của tệp sử dụng output_file.write(A + "\n").<br/>
Kiểm tra nếu k nhỏ hơn hoặc bằng độ dài của chuỗi A, tức là k nằm trong số các chữ số của A, thì ghi chữ số tương ứng với vị trí k vào dòng thứ hai của tệp sử dụng output_file.write(A[k - 1] + "\n"). Lưu ý là vị trí trong chuỗi A được đánh số từ 0, nên để lấy chữ số tại vị trí k, ta phải truy cập A[k - 1].<br/>
Nếu k lớn hơn độ dài của chuỗi A, tức là k không nằm trong số các chữ số của A, thì ghi -1 vào dòng thứ hai của tệp sử dụng output_file.write("-1\n").<br/>