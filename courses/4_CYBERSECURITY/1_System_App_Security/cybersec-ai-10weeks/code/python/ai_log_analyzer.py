import requests
import json
import time

OLLAMA_API = "http://localhost:11434/api/generate"
MODEL_NAME = "llama3"

def analyze_log_line(log_line):
    """
    Sử dụng Ollama (Local LLM) để phân tích một dòng log máy chủ
    Use Ollama (Local LLM) to analyze a server log line
    """
    prompt = f"""
Phân tích dòng log sau để phát hiện hành vi tấn công mạng.
Trả về kết quả JSON duy nhất theo cấu trúc:
{{
  "is_attack": true/false,
  "attack_type": "Tên loại tấn công (Ví dụ: SQL Injection, Brute force, None)",
  "explanation": "Lý do phát hiện"
}}

Dòng log:
{log_line}
"""
    payload = {
        "model": MODEL_NAME,
        "prompt": prompt,
        "format": "json",
        "stream": False
    }
    
    try:
        response = requests.post(OLLAMA_API, json=payload, timeout=10)
        result = response.json()
        return json.loads(result['response'])
    except Exception as e:
        print(f"[-] Lỗi kết nối Ollama local / Ollama local error: {e}")
        return None

if __name__ == "__main__":
    # Dòng log giả lập cuộc tấn công SQL Injection
    # Simulated log line showing SQL Injection attack
    simulated_log = '192.168.1.100 - - [26/Jul/2026:19:00:00 +0700] "GET /item.php?id=1%20UNION%20SELECT%20username,password%20FROM%20users HTTP/1.1" 200 4502'
    
    print("[*] Đang chạy thử nghiệm phân tích log với Ollama...")
    print("[*] Running log analysis test with Ollama...")
    print(f"[*] Log gốc / Raw log: {simulated_log}")
    
    analysis = analyze_log_line(simulated_log)
    if analysis:
        print("\n[+] BÁO CÁO PHÂN TÍCH AI / AI ANALYSIS REPORT:")
        print(json.dumps(analysis, indent=4, ensure_ascii=False))
