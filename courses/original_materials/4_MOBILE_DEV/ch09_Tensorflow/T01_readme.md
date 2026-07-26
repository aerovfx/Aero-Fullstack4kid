### TensorFlow Checkpoint là gì? Ứng dụng

**TensorFlow Checkpoint** là một cơ chế trong TensorFlow để lưu trữ trạng thái của một mô hình học máy trong quá trình huấn luyện. Checkpoint bao gồm các giá trị của các tham số mô hình (weights, biases) và có thể được sử dụng để:

1. **Khôi phục mô hình**: Giúp tiếp tục huấn luyện từ điểm đã lưu trước đó mà không cần phải huấn luyện lại từ đầu.
2. **Đánh giá mô hình**: Cho phép đánh giá mô hình trên tập dữ liệu kiểm tra mà không cần huấn luyện lại.
3. **Chia sẻ mô hình**: Dễ dàng chia sẻ mô hình đã huấn luyện với người khác hoặc triển khai mô hình vào môi trường sản xuất.

Ứng dụng của TensorFlow Checkpoint bao gồm:

- **Huấn luyện dài hạn**: Giúp tiết kiệm thời gian và tài nguyên bằng cách lưu trữ và khôi phục trạng thái mô hình.
- **Khắc phục sự cố**: Nếu quá trình huấn luyện bị gián đoạn, có thể khôi phục từ checkpoint gần nhất.
- **Tối ưu hóa mô hình**: Dễ dàng thử nghiệm với các tham số khác nhau bằng cách khôi phục từ các checkpoint khác nhau.
- **Triển khai mô hình**: Lưu trữ mô hình đã huấn luyện để triển khai vào các ứng dụng thực tế.