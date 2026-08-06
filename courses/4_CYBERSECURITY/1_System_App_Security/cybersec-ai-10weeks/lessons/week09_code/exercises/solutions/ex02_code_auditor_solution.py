"""ĐÁP ÁN - Bài tập 2 (Tuần 9): Kiểm toán mã nguồn tĩnh."""

import re

SAMPLE_CODE = '''\
import os
password = "admin123"                       # hardcoded secret
user = input("user: ")
os.system("ping " + user)                   # command injection
query = "SELECT * FROM u WHERE n='" + user + "'"   # SQL injection
result = eval(input("expr: "))              # eval nguy hiểm
print(password, query, result)
'''

DANGER = {
    r"password\s*=\s*[\"']":  ("Hardcoded Secret (A07)", "Đưa bí mật ra biến môi trường / secret manager."),
    r"os\.system\(":          ("Command Injection (A03)", "Dùng subprocess.run([...]) với list tham số, không nối chuỗi."),
    r"SELECT .*\+":           ("SQL Injection (A03)", "Dùng truy vấn tham số hoá (prepared statement)."),
    r"\beval\(":              ("Code Injection (A03)", "Không dùng eval trên input; dùng ast.literal_eval nếu cần."),
}


def audit(code):
    findings = []
    for line_no, line in enumerate(code.splitlines(), start=1):
        for pattern, (risk, fix) in DANGER.items():
            if re.search(pattern, line):
                findings.append((line_no, line.strip(), risk, fix))
    return findings


if __name__ == "__main__":
    print("=== KIỂM TOÁN MÃ NGUỒN (STATIC AUDIT) ===\n")
    findings = audit(SAMPLE_CODE)

    for line_no, code_line, risk, fix in findings:
        print(f"Dòng {line_no} [{risk}]")
        print(f"    {code_line}")
        print(f"    -> {fix}\n")

    n = len(findings)
    print("=" * 55)
    if n == 0:
        level = "AN TOÀN"
    elif n <= 2:
        level = "CẦN XEM LẠI"
    else:
        level = "RỦI RO CAO"
    print(f"Tổng phát hiện: {n}  |  Đánh giá: {level}")
