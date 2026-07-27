### Tóm tắt sách *Clean Code* – Robert C. Martin  

*Clean Code* (*Mã sạch*) là cuốn sách kinh điển về lập trình do Robert C. Martin (hay còn gọi là Uncle Bob) viết. Cuốn sách hướng dẫn cách viết mã nguồn dễ đọc, dễ bảo trì và có hiệu suất tốt. Nội dung chính được chia thành ba phần:  

### **Phần 1: Nguyên tắc và phương pháp viết mã sạch**  
1. **Mã sạch là gì?**  
   - Mã sạch dễ đọc, dễ hiểu, dễ thay đổi, và có ít lỗi.  
   - Nó tuân theo nguyên tắc KISS (*Keep It Simple, Stupid*) và DRY (*Don’t Repeat Yourself*).  

2. **Cách đặt tên biến, hàm, lớp**  
   - Tên phải có ý nghĩa, rõ ràng, mô tả đúng chức năng.  
   - Không dùng tên viết tắt hoặc ký hiệu khó hiểu.  

3. **Chức năng (Functions) trong mã sạch**  
   - Hàm nên ngắn gọn, làm đúng một việc và có ý nghĩa rõ ràng.  
   - Tránh sử dụng quá nhiều tham số.  

4. **Bình luận trong mã nguồn**  
   - Chỉ viết comment khi thật sự cần thiết.  
   - Mã sạch nên tự giải thích mà không cần nhiều chú thích.  

5. **Xử lý lỗi đúng cách**  
   - Không dùng giá trị trả về đặc biệt (ví dụ: `-1` để báo lỗi).  
   - Sử dụng ngoại lệ (*Exceptions*) để xử lý lỗi hợp lý.  

### **Phần 2: Các mẫu mã sạch (Code Smells) và cách cải thiện**  
- Nhận diện và sửa lỗi trong code xấu, như:  
  - **Code lặp (Duplicate Code)**: Tách ra thành hàm hoặc lớp chung.  
  - **Hàm dài dòng (Long Functions)**: Chia nhỏ thành nhiều hàm đơn giản hơn.  
  - **Lớp cồng kềnh (Large Classes)**: Dùng nguyên tắc *Single Responsibility* (SRP) để chia lớp.  
  - **Phụ thuộc lẫn nhau (Coupling & Cohesion)**: Giữ các module tách biệt và dễ mở rộng.  

### **Phần 3: Case Study và thực hành mã sạch**  
- Robert C. Martin phân tích một số đoạn code thực tế, chỉ ra lỗi và cách làm sạch mã theo nguyên tắc đã đề cập.  

### **Tóm lại**  
- *Clean Code* nhấn mạnh rằng viết code tốt không chỉ là làm cho nó chạy được, mà còn phải dễ đọc, dễ bảo trì và ít lỗi.  
- Áp dụng các nguyên tắc trong sách giúp lập trình viên nâng cao kỹ năng và tạo ra sản phẩm chất lượng cao hơn.  
