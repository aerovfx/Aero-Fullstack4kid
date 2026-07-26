import os
import requests
import json
import sys

# Cấu hình API Key (Ví dụ sử dụng Gemini API)
# API configuration (using Gemini API as example)
API_KEY = os.getenv("GEMINI_API_KEY", "YOUR_API_KEY_HERE")
API_URL = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key={API_KEY}"

def scan_file_with_ai(file_path):
    if not os.path.exists(file_path):
        print(f"[-] Lỗi: Không tìm thấy file / Error: File not found: {file_path}")
        return None
        
    print(f"[*] Đang đọc mã nguồn file / Reading source: {file_path}")
    with open(file_path, "r", encoding="utf-8") as f:
        code_content = f.read()
        
    # Tạo prompt phân tích chuyên nghiệp
    # Craft professional security prompt
    prompt = f"""
Bạn là chuyên gia đánh giá mã nguồn bảo mật (Secure Code Reviewer).
Hãy phân tích mã nguồn sau và phát hiện các lỗ hổng bảo mật. 
Chỉ trả về chuỗi JSON hợp lệ theo cấu trúc sau, không kèm thêm bất kỳ ký tự nào khác (không có markdown ```json):
{{
  "file": "{os.path.basename(file_path)}",
  "vulnerabilities": [
    {{
      "name": "Tên lỗ hổng",
      "severity": "High/Medium/Low",
      "line": "Dòng code chứa lỗi",
      "description": "Giải thích chi tiết",
      "remediation": "Cách vá lỗi an toàn"
    }}
  ]
}}

Mã nguồn cần quét:
{code_content}
"""

    headers = {"Content-Type": "application/json"}
    payload = {
        "contents": [{"parts": [{"text": prompt}]}]
    }

    try:
        response = requests.post(API_URL, headers=headers, json=payload)
        response_data = response.json()
        ai_response_text = response_data['candidates'][0]['content']['parts'][0]['text']
        
        # Làm sạch chuỗi JSON nhận được từ AI
        if "```json" in ai_response_text:
            ai_response_text = ai_response_text.split("```json")[1].split("```")[0].strip()
        elif "```" in ai_response_text:
            ai_response_text = ai_response_text.split("```")[1].split("```")[0].strip()
            
        result = json.loads(ai_response_text)
        return result
    except Exception as e:
        print(f"[-] Lỗi kết nối hoặc xử lý API / API Error: {e}")
        return None

if __name__ == "__main__":
    target_file = "buffer_overflow.cpp"
    if len(sys.argv) >= 2:
        target_file = sys.argv[1]
        
    if API_KEY == "YOUR_API_KEY_HERE":
        print("[!] Lưu ý: Bạn cần cấu hình biến môi trường GEMINI_API_KEY để chạy quét.")
        print("[!] Note: You must configure GEMINI_API_KEY environment variable to run scans.")
    else:
        report = scan_file_with_ai(target_file)
        if report:
            print(json.dumps(report, indent=4, ensure_ascii=False))
