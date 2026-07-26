Tham khảo ý nghĩa của các thẻ css trong trang dưới.
https://www.w3schools.com/css/default.asp

Chú thích ý nghĩa thẻ trong file stle.css:

body: Selector của thẻ <body> của trang web.<br>
margin: 0; padding: 0;: Đặt margin và padding cho body là 0 để loại bỏ khoảng trắng xung quanh body.<br>
display: flex;: Thêm thuộc tính display: flex cho body để biến nó thành container linh hoạt cho phần tử con bên trong.<br>
justify-content: center; align-items: center;: Đặt giá trị justify-content và align-items là center để canh giữa nội dung trong container.<br>
height: 100vh;: Thiết lập chiều cao của body bằng chiều cao của viewport, giúp nội dung trang web có thể hiển thị trên toàn bộ màn hình.<br>
background: url('https://example.com/image.jpg') no-repeat center center fixed;: Thiết lập background cho body là 1 hình ảnh, được lấy từ đường dẫn 'https://example.com/image.jpg'. Đặt no-repeat để hình ảnh không lặp lại, center center để canh giữa hình ảnh và fixed để giữ hình ảnh không bị di chuyển khi scroll trang web.
background-size: cover;: Thiết lập kích thước của hình ảnh bằng kích thước của viewport, đảm bảo rằng hình ảnh sẽ hiển thị toàn bộ và không bị méo.<br>
.container: Selector của phần tử container chứa phần tử hình tròn và văn bản.<br>
position: relative;: Thiết lập vị trí tương đối cho phần tử container để các phần tử con có thể được định vị tương đối với container.<br>
.circle: Selector của phần tử hình tròn.<br>
position: absolute;: Thiết lập vị trí tuyệt đối cho phần tử hình tròn, giúp nó có thể nằm trên nền hình ảnh.
top: 50%; left: 50%;: Đặt vị trí cho hình tròn ở giữa container bằng cách đặt top: 50% và left: 50%.<br>
transform: translate(-50%, -50%);: Dịch chuyển hình tròn lên trên và sang trái 50% của kích thước của nó, để nó được đặt chính giữa container.<br>
width: 200px; height: 200px;: Đặt kích thước của hình tròn là 200x200 pixels.<br>
border-radius: 50%;: Thiết lập border-radius là 50%, biến hình vuông thành hình tròn.<br>
background-color: black;: Thiết lập màu nền cho hình tròn là đen.<br>
