# Quy Định An Toàn & Đạo Đức Nghề Nghiệp / Safety & Ethical Hacking Guidelines

An ninh mạng là một lĩnh vực đầy thách thức nhưng cũng đi kèm với trách nhiệm pháp lý và đạo đức to lớn. Mọi kỹ thuật bạn học được trong khoá học này chỉ được phép sử dụng cho mục đích học tập, nghiên cứu và phòng thủ hợp pháp.

---

## ⚖️ Quy Tắc Đạo Đức Của Pentester / Penetration Tester's Code of Ethics

1. **Sự Đồng Ý Rõ Ràng (Explicit Consent)**:
   - KHÔNG bao giờ tiến hành quét mạng, kiểm thử lỗ hổng hoặc khai thác bất kỳ hệ thống nào mà không có sự cho phép bằng văn bản từ chủ sở hữu hợp pháp của hệ thống đó.
   - Thỏa thuận kiểm thử phải làm rõ: Phạm vi kiểm thử (Scope), Thời gian tiến hành, và Các giới hạn kỹ thuật để tránh làm gián đoạn dịch vụ.

2. **Tôn Trọng Sự Riêng Tư (Respect for Privacy)**:
   - Trong quá trình thực hành, nếu vô tình truy cập được dữ liệu nhạy cảm hoặc thông tin cá nhân của người dùng, bạn phải lập tức dừng lại, báo cáo cho quản trị viên và không được sao chép, phân tán hoặc lợi dụng thông tin này.

3. **Báo Cáo Kịp Thời (Responsible Disclosure)**:
   - Khi phát hiện lỗ hổng trên bất kỳ hệ thống thực tế nào, hãy thực hiện quy trình công bố lỗ hổng có trách nhiệm: Báo cáo trực tiếp cho chủ quản hệ thống để họ khắc phục trước khi công bố thông tin ra ngoài.

4. **Tránh Gây Thiệt Hại (Do No Harm)**:
   - Không chạy các lệnh có khả năng phá hủy hoặc làm treo hệ thống (ví dụ: DDoS, Fork bomb, rm -rf) trên môi trường production của doanh nghiệp hoặc cá nhân khác.

---

## 🛡️ Hướng Dẫn Thực Hành An Toàn Trong Phòng Lab / Safe Lab Environment Instructions

Để tránh các rủi ro pháp lý ngoài ý muốn, học viên bắt buộc phải tuân thủ các quy định cấu hình mạng sau:

1. **Sử Dụng Mạng Nội Bộ Cách Ly (Isolated NAT Network)**:
   - Thiết lập các máy ảo Kali Linux và máy ảo Victim (Ubuntu/Windows Server) trong cùng một dải mạng NAT cách ly trong phần mềm ảo hóa (VMware/VirtualBox).
   - KHÔNG sử dụng chế độ Bridge Network nếu bạn đang kết nối Wi-Fi tại các quán cà phê công cộng hoặc mạng công ty khi thực hành quét lỗ hổng.

2. **Quản Lý API Keys Chặt Chẽ**:
   - Khi viết các công cụ bảo mật tích hợp AI, không được lưu cứng (hardcode) API Keys của Gemini/OpenAI trực tiếp vào mã nguồn công khai trên GitHub.
   - Luôn sử dụng biến môi trường (Environment Variables) hoặc tệp cấu hình `.env` được đưa vào `.gitignore`.

3. **Thực Hành Wi-Fi Trên Thiết Bị Cá Nhân**:
   - Chỉ chạy các công cụ bẻ khóa như \`aircrack-ng\` hoặc \`aireplay-ng\` đối với điểm truy cập Wi-Fi (Access Point) do chính bạn thiết lập để thử nghiệm. Việc phát gói tin Deauth làm mất kết nối Wi-Fi của hàng xóm hoặc cơ quan là hành vi bất hợp pháp.
