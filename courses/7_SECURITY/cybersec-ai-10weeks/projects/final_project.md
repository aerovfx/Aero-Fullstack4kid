# Hướng Dẫn Dự Án Cuối Khoá / Final Capstone Project Guide

Dự án tốt nghiệp cuối khoá chiếm 40% trọng số điểm đánh giá toàn khóa. Học viên chọn một trong ba hướng đề tài (Tracks) dưới đây để triển khai và bảo vệ trong ngày Demo Day.

---

## 🧭 Hướng Đề Tài 1 / Track A: Hệ thống Tự động hóa Trinh sát OSINT & Vẽ Bản đồ Rủi ro (OSINT & Target Intel System)
*Tập trung vào trinh sát bề mặt tấn công mạng, thu thập dữ liệu và phân tích rủi ro mục tiêu.*

### 1. Mô tả Nhiệm vụ / Task Description
Xây dựng một công cụ Python thực hiện tự động hóa thu thập dữ liệu OSINT về một tên miền mục tiêu (WHOIS, DNS records, Subdomains, Shodan port scan) sau đó gửi toàn bộ ngữ cảnh này qua API cho AI để lập báo cáo đánh giá bề mặt tấn công (Attack Surface Report) tự động.

### 2. Yêu cầu Tối thiểu / Minimum Requirements
- Viết script Python tự động thực hiện truy vấn thông tin DNS và tích hợp API Shodan tìm kiếm IP/Ports mở.
- Kết nối API của LLM (Gemini hoặc Ollama local) để phân tích dữ liệu thô.
- Xuất báo cáo kết quả dưới dạng tệp Markdown/HTML trực quan.

### 3. Khung Mã nguồn Gợi ý / Code Skeleton
```python
import os
import requests

class OSINTCollector:
    def __init__(self, target_domain):
        self.target = target_domain
        self.report_data = {}
        
    def gather_dns(self):
        # Thực hiện truy vấn DNS (A, MX, TXT)
        pass
        
    def query_shodan(self):
        # Gọi API Shodan tìm kiếm thông tin IP
        pass
        
    def generate_ai_report(self):
        # Gửi dữ liệu thu thập được cho LLM và nhận báo cáo rủi ro
        pass
```

### 4. Tính năng Nâng cao (Bonus)
- Vẽ sơ đồ mạng các subdomains tìm thấy bằng thư viện Graphviz hoặc matplotlib.
- Kiểm tra các file nhạy cảm lộ lọt qua Google Dorking tự động.

---

## 🤖 Hướng Đề Tài 2 / Track B: Trình kiểm toán Mã nguồn Bảo mật thông minh (AI-Powered Static Code Auditor)
*Tập trung vào việc áp dụng AI để quét, phát hiện lỗi bảo mật và sửa mã nguồn C++/Python.*

### 1. Mô tả Nhiệm vụ / Task Description
Xây dựng một chương trình quét tĩnh (Static Analysis Security Testing - SAST) quét qua toàn bộ mã nguồn của một thư mục dự án, tự động phát hiện các lỗ hổng theo tiêu chuẩn OWASP Top 10 hoặc CWE và tự động tạo ra một bản vá (Patch code) đề xuất.

### 2. Yêu cầu Tối thiểu / Minimum Requirements
- Quét đệ quy các tệp tin trong thư mục được cấu hình.
- Phân tích cú pháp cơ bản và trích xuất hàm/lớp gửi cho LLM.
- Lưu lại báo cáo chi tiết: Tên file, Dòng code lỗi, Mô tả lỗi, Mức độ nghiêm trọng, Đề xuất vá lỗi.

### 3. Khung Mã nguồn Gợi ý / Code Skeleton
```python
import glob

def read_source_files(directory):
    files = glob.glob(directory + '/**/*.cpp', recursive=True) + glob.glob(directory + '/**/*.py', recursive=True)
    return files

def audit_file_with_ai(file_path):
    # Đọc nội dung file và gửi prompt phân tích bảo mật đến AI
    pass

def save_report(audit_results):
    # Lưu báo cáo lỗi ra file HTML hoặc JSON
    pass
```

### 4. Tính năng Nâng cao (Bonus)
- Tích hợp trực tiếp vào Git Hook để tự động quét mỗi khi có lập trình viên commit mã nguồn mới.
- So sánh hiệu quả phát hiện lỗi giữa mô hình local (Ollama) và mô hình cloud (Gemini/OpenAI).

---

## 🚨 Hướng Đề Tài 3 / Track C: Trình giám sát Log & Săn lùng Mối đe dọa (AI Threat Hunting & Alerting Console)
*Tập trung vào phân tích thời gian thực và tự động phát hiện, cảnh báo tấn công.*

### 1. Mô tả Nhiệm vụ / Task Description
Xây dựng hệ thống giám sát liên tục tệp log của Web Server (Nginx/Apache) hoặc Syslog hệ thống. Sử dụng AI để phân loại các dòng log bất thường và tự động gửi tin nhắn cảnh báo thời gian thực qua Telegram Bot cho đội ngũ quản trị mạng.

### 2. Yêu cầu Tối thiểu / Minimum Requirements
- Đọc tệp log theo thời gian thực (real-time tailing).
- Lọc nhiễu hiệu quả (loại bỏ log tĩnh vô hại như .css, .png trước khi gửi cho AI).
- Tích hợp gửi cảnh báo qua Webhook Telegram/Slack khi phát hiện tấn công mức độ High/Critical.

### 3. Khung Mã nguồn Gợi ý / Code Skeleton
```python
import time

def monitor_log(log_path):
    with open(log_path, 'r') as f:
        f.seek(0, 2)
        while True:
            line = f.readline()
            if not line:
                time.sleep(0.1)
                continue
            analyze_log_line(line)

def analyze_log_line(line):
    # Gửi dòng log nghi vấn cho AI phân tích
    # Nếu là tấn công, gọi send_telegram_alert()
    pass
```

### 4. Tính năng Nâng cao (Bonus)
- Thiết lập cơ chế tự động chặn (Block IP) kẻ tấn công bằng cách tự động sinh và chạy lệnh iptables trên hệ thống Linux.
- Xây dựng dashboard Web đơn giản hiển thị biểu đồ thống kê các dạng tấn công theo thời gian.

---

## 🏆 Tiêu Chí Đánh Giá Dự Án / Project Assessment Rubric

Tổng điểm dự án là **100 điểm**, được phân bổ chi tiết như sau:

| Tiêu Chí / Criteria | Điểm / Points | Chi Tiết Đánh Giá / Details |
|---------------------|---------------|----------------------------|
| **Chất lượng Mã nguồn (Code Quality)** | 30 | Cấu trúc code rõ ràng, xử lý lỗi (Exception handling) tốt, không bị rò rỉ API keys, code sạch dễ bảo trì. |
| **Độ hoàn thiện Tính năng (Functionality)** | 30 | Đáp ứng đầy đủ các yêu cầu tối thiểu của Track đã chọn, chạy mượt mà không lỗi crash. |
| **Phòng Lab & Kiểm thử (Lab & Demo)** | 20 | Quay video hoặc demo trực tiếp hoạt động của công cụ trong môi trường lab ảo, mô phỏng thành công kịch bản tấn công/phòng thủ thực tế. |
| **Báo cáo & Thuyết trình (Presentation)** | 20 | Tài liệu hướng dẫn sử dụng (README.md) chi tiết, slide thuyết trình rõ ràng, giải thích tốt cơ chế hoạt động của thuật toán và AI prompts. |
