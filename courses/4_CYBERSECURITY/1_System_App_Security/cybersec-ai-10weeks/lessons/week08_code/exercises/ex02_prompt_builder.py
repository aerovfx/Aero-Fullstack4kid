"""
BÀI TẬP 2 (Tuần 8): DỰNG PROMPT PHÂN TÍCH RỦI RO CHO AI (Prompt Engineering)
Ôn lại: nguyên tắc prompt engineering (vai trò, ngữ cảnh, định dạng đầu ra).

BỐI CẢNH:
Chất lượng phân tích của AI phụ thuộc vào prompt. Bài này KHÔNG gọi API (không
tốn tiền, không cần mạng): bạn viết hàm dựng một prompt CÓ CẤU TRÚC từ dữ liệu
mục tiêu, rồi in ra để nộp. Prompt tốt gồm 4 phần: Vai trò (Role) - Ngữ cảnh
(Context) - Nhiệm vụ (Task) - Định dạng đầu ra (Output format).

NHIỆM VỤ:
Viết build_prompt(target) trả về một chuỗi prompt hoàn chỉnh, có đủ 4 phần,
nhúng dữ liệu từ dict target vào.

CHẠY:  python3 ex02_prompt_builder.py
"""

TARGET = {
    "domain": "demo-target.example",
    "open_ports": [22, 80, 443, 3389, 3306],
    "services": ["OpenSSH 7.4", "nginx 1.14", "Microsoft RDP", "MySQL 5.5"],
}


def build_prompt(target):
    """Dựng prompt 4 phần cho AI đóng vai chuyên gia bảo mật (White Hat)."""
    # TODO 1: ROLE - "Bạn là chuyên gia đánh giá bảo mật (ethical hacker mũ trắng)..."
    # TODO 2: CONTEXT - nhúng domain, open_ports, services từ target.
    # TODO 3: TASK - yêu cầu: đánh giá rủi ro từng dịch vụ, xếp mức độ, gợi ý khắc phục.
    # TODO 4: OUTPUT FORMAT - yêu cầu trả lời dạng bảng Markdown: Dịch vụ | Rủi ro | Khắc phục.
    # TODO 5: ghép 4 phần thành 1 chuỗi và return.
    prompt = ""
    return prompt


if __name__ == "__main__":
    print("=== PROMPT ĐÃ DỰNG (copy sang ChatGPT/Gemini/Ollama để chạy) ===\n")
    print(build_prompt(TARGET))
    # Ghi chú: prompt tốt luôn RÀNG BUỘC AI đóng vai mũ trắng và chỉ đưa khuyến nghị
    # phòng thủ, tránh việc mô hình bị lái sang tạo mã tấn công.
