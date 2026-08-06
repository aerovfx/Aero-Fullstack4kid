"""ĐÁP ÁN - Bài tập 2 (Tuần 8): Dựng prompt phân tích rủi ro."""

TARGET = {
    "domain": "demo-target.example",
    "open_ports": [22, 80, 443, 3389, 3306],
    "services": ["OpenSSH 7.4", "nginx 1.14", "Microsoft RDP", "MySQL 5.5"],
}


def build_prompt(target):
    role = (
        "VAI TRÒ: Bạn là chuyên gia đánh giá bảo mật (ethical hacker mũ trắng), "
        "chỉ đưa ra khuyến nghị PHÒNG THỦ, không tạo mã tấn công."
    )
    context = (
        "NGỮ CẢNH:\n"
        f"- Tên miền: {target['domain']}\n"
        f"- Cổng mở: {', '.join(str(p) for p in target['open_ports'])}\n"
        f"- Dịch vụ phát hiện: {', '.join(target['services'])}"
    )
    task = (
        "NHIỆM VỤ: Với mỗi dịch vụ, đánh giá mức rủi ro (Thấp/Trung bình/Cao/Rất cao), "
        "giải thích ngắn gọn vì sao, và đề xuất cách khắc phục cụ thể."
    )
    output = (
        "ĐỊNH DẠNG ĐẦU RA: Trả lời bằng bảng Markdown gồm 3 cột: "
        "| Dịch vụ | Mức rủi ro | Khuyến nghị khắc phục |"
    )
    return "\n\n".join([role, context, task, output])


if __name__ == "__main__":
    print("=== PROMPT ĐÃ DỰNG (copy sang ChatGPT/Gemini/Ollama để chạy) ===\n")
    print(build_prompt(TARGET))
