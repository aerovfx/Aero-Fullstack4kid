"""
BÀI TẬP 2 (Tuần 9): KIỂM TOÁN MÃ NGUỒN TỰ ĐỘNG (theo OWASP)
Ôn lại: secure code auditing, các hàm/nguy cơ nguy hiểm.

BỐI CẢNH:
Bài giảng đưa code lỗi cho AI phân tích theo OWASP. Bài tập này dạy bạn viết bộ
quét TĨNH (static analyzer) cơ bản: dò các "mẫu nguy hiểm" trong mã nguồn - đây
là thứ AI làm ở quy mô lớn, nhưng hiểu luật gốc giúp bạn kiểm chứng kết quả AI.

NHIỆM VỤ:
1. Quét từng dòng SAMPLE_CODE, tìm các mẫu nguy hiểm trong DANGER.
2. Với mỗi phát hiện: in số dòng, loại rủi ro, và gợi ý sửa.
3. Chấm điểm an toàn đơn giản dựa trên số phát hiện.

CHẠY:  python3 ex02_code_auditor.py
"""

import re

# Đoạn mã Python "có vấn đề" để kiểm toán (mô phỏng)
SAMPLE_CODE = '''\
import os
password = "admin123"                       # hardcoded secret
user = input("user: ")
os.system("ping " + user)                   # command injection
query = "SELECT * FROM u WHERE n='" + user + "'"   # SQL injection
result = eval(input("expr: "))              # eval nguy hiểm
print(password, query, result)
'''

# mẫu nguy hiểm -> (loại rủi ro OWASP, gợi ý sửa)
DANGER = {
    r"password\s*=\s*[\"']":  ("Hardcoded Secret (A07)", "Đưa bí mật ra biến môi trường / secret manager."),
    r"os\.system\(":          ("Command Injection (A03)", "Dùng subprocess.run([...]) với list tham số, không nối chuỗi."),
    r"SELECT .*\+":           ("SQL Injection (A03)", "Dùng truy vấn tham số hoá (prepared statement)."),
    r"\beval\(":              ("Code Injection (A03)", "Không dùng eval trên input; dùng ast.literal_eval nếu cần."),
}


def audit(code):
    """Trả về list (line_no, dòng, loại, gợi_ý) cho mỗi phát hiện."""
    findings = []
    # TODO 1: enumerate từng dòng (bắt đầu từ 1).
    # TODO 2: với mỗi mẫu trong DANGER, nếu re.search(pattern, line) thì
    #         thêm (line_no, line.strip(), loại, gợi_ý) vào findings.
    return findings


if __name__ == "__main__":
    print("=== KIỂM TOÁN MÃ NGUỒN (STATIC AUDIT) ===\n")
    findings = audit(SAMPLE_CODE)

    # TODO 3: in từng phát hiện: "Dòng X [loại]: <code>  -> gợi ý".
    # TODO 4: chấm điểm: 0 phát hiện = AN TOÀN; càng nhiều càng rủi ro.
