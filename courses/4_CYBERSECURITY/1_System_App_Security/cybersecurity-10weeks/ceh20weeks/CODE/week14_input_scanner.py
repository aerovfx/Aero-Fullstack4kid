#!/usr/bin/env python3
"""week14_input_scanner.py — Input Injection Scanner & Sanitizer (BLUE TEAM)

Tuan 14 - CEH Module 14 (Hacking Web Applications).

Cong cu PHONG THU: phan tich MOT CHUOI input ban tu nhap (VD du lieu form cua
web app ban) de phat hien pattern injection (SQLi, XSS, command injection,
path traversal) va in ra phien ban SANITIZED (escape) de tham khao.

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi phan tich chuoi BAN TU NHAP. Khong gui request, khong tan cong web app,
    khong ket noi mang. Tool nay chi lam viec tren chuoi ky tu.
"""
import argparse
import html
import re
import sys

SQLI_PATTERNS = [
    (r"(?i)(union\s+select)", "UNION SELECT"),
    (r"(?i)(['\"]\s*or\s+['\"]?\s*1\s*=\s*1)", "OR 1=1"),
    (r"(?i)(;|--|\#)$", "comment (--/#)"),
    (r"(?i)(;drop\s+table|;delete\s+from|;insert\s+into)", "SQL DDL/DML"),
    (r"(?i)(sleep\s*\(|benchmark\s*\(|waitfor\s+delay)", "time-based"),
]

XSS_PATTERNS = [
    (r"(?i)(<\s*script)", "<script>"),
    (r"(?i)(javascript\s*:)", "javascript:"),
    (r"(?i)(onerror\s*=|onload\s*=|onclick\s*=)", "event handler"),
    (r"(?i)(<\s*iframe)", "<iframe>"),
]

CMD_PATTERNS = [
    (r"(;|\||&&|\n)\s*(\w+)", "command separator"),
    (r"(?i)\b(cat|wget|curl|nc|bash|sh|powershell|rm|mkfifo)\b", "shell command"),
    (r"(`[^`]+`)", "backtick"),
    (r"(\$\([^)]*\))", "$() subshell"),
]

TRAVERSAL_PATTERNS = [
    (r"(\.\.(/|\\|%2f|%5c))", "path traversal"),
    (r"(/etc/passwd|/etc/shadow|c:\\windows)", "sensitive file"),
]


def check(input_str: str):
    print("=" * 60)
    print("INPUT INJECTION SCANNER (BLUE TEAM)")
    print("=" * 60)
    print(f"[INPUT]  {input_str}")

    findings = []

    def scan(name, patterns):
        for pat, label in patterns:
            if re.search(pat, input_str):
                findings.append((name, label))

    scan("SQLi", SQLI_PATTERNS)
    scan("XSS", XSS_PATTERNS)
    scan("Command", CMD_PATTERNS)
    scan("PathTraversal", TRAVERSAL_PATTERNS)

    print(f"[SANITIZED]")
    print(f"  SQL : {input_str.replace(chr(39), chr(92) + chr(39))}   (dùng tham số hóa là tốt nhất)")
    print(f"  HTML: {html.escape(input_str)}")
    print(f"  URL : {urllib_quote(input_str)}")

    print("-" * 60)
    if findings:
        print(f"[KẾT LUẬN] {len(findings)} dấu hiệu nguy hiểm:")
        for cat, label in findings:
            print(f"  - [{cat}] {label}")
        print("[LƯU Ý] Không nối input vào query/shell/HTML trực tiếp.")
        print("        Phòng thủ đúng: parameterized query + output encoding + whitelist.")
    else:
        print("[KẾT LUẬN] Không phát hiện pattern phổ biến (vẫn kiểm tra logic phía server).")


def urllib_quote(s: str) -> str:
    return re.sub(r"[^A-Za-z0-9\-._~]", lambda m: "%%%02X" % ord(m.group(0)), s)


DEMO = [
    "1' OR 1=1--",
    "<script>alert(1)</script>",
    "hello world; rm -rf /tmp/x",
    "../../etc/passwd",
    "normal input",
]


def main():
    ap = argparse.ArgumentParser(description="Input injection scanner (offline)")
    ap.add_argument("--input", help="chuoi input ban muon kiem tra")
    ap.add_argument("--demo", action="store_true", help="chay demo 5 input mau")
    args = ap.parse_args()

    if args.input:
        check(args.input)
    elif args.demo:
        for s in DEMO:
            check(s)
            print()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week14_input_scanner.py --demo")


if __name__ == "__main__":
    main()
