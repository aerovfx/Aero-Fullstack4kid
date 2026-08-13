Để giải bài toán theo yêu cầu đề thi Thành phố Hà Nội năm 2020, ta có thể sử dụng các bước sau để tính tổng N chữ số sau dấu phẩy của phép chia a cho b:<br/>

Thực hiện phép chia a cho b và lưu kết quả vào biến phan_thap_phan. <br/>
Chuyển phần thập phân thành chuỗi bằng cách sử dụng hàm str(phan_thap_phan).<br/>
Khởi tạo biến tong = 0 để tính tổng các chữ số.<br/>
Sử dụng vòng lặp for từ i = 2 đến N+1 (vị trí các chữ số sau dấu phẩy).<br/>
Kiểm tra nếu i nhỏ hơn độ dài của chuỗi phan_thap_phan:<br/>
Tăng tổng lên giá trị của chữ số tại vị trí i trong chuỗi phan_thap_phan bằng cách sử dụng int(chuoi_phan_thap_phan[i]).<br/>
Ngược lại, tức là i vượt quá độ dài của chuỗi phan_thap_phan:<br/>
Tăng tổng lên 0, do ta thêm vô hạn số 0 vào cuối phần thập phân.<br/>
Trả về tổng kết quả.<br/>

function tinh_tong_chu_so_phan_thap_phan(a, b, N):
    phan_thap_phan = a / b
    chuoi_phan_thap_phan = chuyển phần thập phân thành chuỗi (str(phan_thap_phan))
    tong = 0
    for i từ 2 đến N+1:
        nếu i < độ dài của chuỗi phan_thap_phan:
            tăng tổng lên giá trị của chữ số tại vị trí i trong chuỗi phan_thap_phan (int(chuoi_phan_thap_phan[i]))
        ngược lại:
            tăng tổng lên 0
    trả về tổng
