
Đề thi thành phố Hồ Chí Minh 2020

Trên sân trường, các bạn học sinh đang đứng với hướng nhìn khác nhau so với bạn Nam. Các bạn nhìn về phía Nam ta gọi là nhìn về trước, các bạn quay lưng về phía Nam ta gọi là nhìn về sau, các bạn nhìn về phía bên trái Nam gọi là nhìn sang trái, các bạn nhìn về phía bên phải của Nam ta gọi là nhìn sang phải. <br/>

Nam muốn hô để điều động các bạn xoay về cùng một hướng nhưng Nam không muốn các bạn phải xoay nhiều (Mỗi lần xoay, các bạn chỉ xoay một góc 90^0 nên bạn đang xoay lưng lại với Nam muốn nhìn về phía Nam thì cần phải xoay 2 lần).<br/>

Yêu cầu: <br/>
Em hãy giúp Nam tìm hướng nào nên chọn để các bạn trên sân chỉ phải xoay với số lần ít nhất là có thể cùng nhìn về hướng ấy.
Dữ liệu vào: Trong tập tin văn bản cỏ tên là DOIHUONG.INPmghi 10 test trên 10 dòng, mỗi dòng ghi một dãy các chữ số viết liền với nhau, dãy số chỉ gồm các chữ số 1, 2, 3, 4 mô tả hướng nhìn của từng bạn trên sân theo guy tắc:
1 - nhìn về trước
2 - nhìn về phía sau
3 - nhìn sang trái
4 - nhìn sang phải

Kết quả: Ghi ra tếp văxn bản có tên là DOIHUONG.OUT với kết qủa của mỗi test ghi trên 2 dòng theo mô tả sau:
+Dòng thứ nhất ghi số tương ứng với hướng mà Nam cần chọn để hô điều động. Nếu có nhiều hơn một hướng có thể chọn thì ghi lần lượt từng số tương ứng với các hướng theo thứ tự từ nhỏ đến lớn ( trước - sau - trái - phải), mỗi số cách nhau ít nhất một khoảng trắng.
+Dòng thứ hai ghi số lần cần xoay ít nhất để các bạn trên sân cùng nhìn về hướng cần điều động.
Ví dụ:
DOIHUONG.INP
1143322
Có 7 bạn trên sân với hướng nhìn lần lượt là:
2 bạn nhìn về trước, 1 bạn nhìn phải, 2 bạn nhìn trái và 2 bạn nhìn phía sau

DOIHUONG.OUT
3
6

Bộ test
1143322
2311124334
1334232142141423


Do đó Nam nên chọn hướng điều động là nhìn về bên trái (3) thì các bận cần chỉ phải xoay với số lần ít nhất là 6 vì
2 bạn nhìn trước (1,1) thì chỉ cần quay 1 lần với 2 bạn tổng cộng là 2 lần
1 bạn nhìn phải (4) thì quay về trái cần quay 2 lần
2 bạn nhìn sau (3) chỉ cần quay 1 bạn 1 lần với 2 người thì quay 2 lần.


trong khi lập trình chúng ta chú ý, quan sát các hướng theo đề bài mô tả. Giả sử hướng lên trên là về trước. Khi muốn tính số lần xoay với các hướng như vậy ta cần kiểm tra từng hướng các bạn học sinh đang đứng và từng huóng mà bạn Nam cần hô.

Ví dụ: Nếu Nam muốn hô xoay về hướngg 1, ta cần kiểm tra nếu hướng hiện tại của bạn học sinh là 3 thì số lần xoay là 1, nếu hướng là số 2, số lần xoay là 2, nếu hướng là 4 số lần xoay là 1. Để tính được số lần xoay, ta cần kiểm tra từng hướng.

