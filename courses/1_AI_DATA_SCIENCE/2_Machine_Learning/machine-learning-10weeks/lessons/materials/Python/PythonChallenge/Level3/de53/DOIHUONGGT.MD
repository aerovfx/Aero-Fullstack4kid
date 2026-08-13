Đọc dữ liệu từ file DOIHUONG.INP<br/>
Khởi tạo mảng count_directions = [0, 0, 0, 0] (đếm số lượng học sinh nhìn mỗi hướng)<br/>

Duyệt qua từng số trong dãy dữ liệu:<br/>
    Tăng giá trị count_directions tương ứng cho hướng nhìn của học sinh<br/>

Tìm hướng có số lượng học sinh nhìn nhiều nhất (nếu có nhiều hướng cùng số lượng thì ưu tiên hướng có giá trị nhỏ hơn):<br/>
    max_count = max(count_directions)<br/>
    direction = index của max_count trong mảng count_directions (1, 2, 3 hoặc 4)<br>

In ra kết quả hướng điều động của Nam:<br/>
    In direction<br/>

Tính số lần xoay ít nhất cần thiết để các bạn học sinh cùng nhìn về hướng điều động (số lần xoay là tổng khoảng cách của mỗi hướng khác hướng điều động):<br/>
    Khởi tạo biến min_turns = 0<br/>
    Duyệt qua từng số trong dãy dữ liệu:<br/>
        Nếu số không trùng với hướng điều động:<br/>
            min_turns += số lần xoay ít nhất để chuyển từ hướng đó về hướng điều động<br/>

In ra kết quả min_turns<br/>
