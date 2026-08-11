#!/usr/bin/env python3
"""week15_sqli_defender.py — SQL Injection Defender (BLUE TEAM)

Tuan 15 - CEH Module 15 (SQL Injection).

Cong cu PHONG THU:
  1) SCAN input de phat hien pattern SQLi (error-based, union, boolean,
     time-based, comment).
  2) DEMO tren SQLite IN-MEMORY: chay cung query theo 2 cach — string
     concatenation (lo ho) vs parameterized query (an toan) — de minh hoa
     vi sao prepared statement la phong thu goc re.

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi phan tich chuoi BAN TU NHAP. Demo chi dung SQLite trong RAM (khong
    phai DB that), khong ket noi mang, khong tan cong bat ky he thong nao.
"""
import argparse
import re
import sqlite3
import sys

SQLI_PATTERNS = [
    (r"(?i)union\s+select", "UNION SELECT"),
    (r"(?i)\bor\s+['\"]?\w+['\"]?\s*=\s*['\"]?\w+", "OR x=x (boolean)"),
    (r"(?i)\bor\s+1\s*=\s*1\b", "OR 1=1"),
    (r"(?i)['\"]\s*(;|--|#)", "comment (--/#)"),
    (r"(?i)sleep\s*\(|benchmark\s*\(|waitfor\s+delay", "time-based"),
    (r"(?i)(;drop\s+table|;delete\s+from|;insert\s+into)", "SQL DDL/DML"),
    (r"(?i)order\s+by\s+\d+", "ORDER BY (column count)"),
]


def check(input_str: str):
    print("=" * 60)
    print("SQL INJECTION DEFENDER (BLUE TEAM)")
    print("=" * 60)
    print(f"[INPUT] {input_str}")

    hits = []
    for pat, label in SQLI_PATTERNS:
        if re.search(pat, input_str):
            hits.append(label)

    if hits:
        print(f"[CHECK] [!] Phát hiện SQLi: {', '.join(hits)}")
        print("        -> Chặn (như WAF). Đây là lớp phòng thủ thứ hai.")
    else:
        print(f"[CHECK] Không phát hiện pattern phổ biến.")

    print("\n[DEMO] So sánh 2 cách chạy query trên SQLite in-memory:")
    demo(input_str)


def demo(user_input: str):
    conn = sqlite3.connect(":memory:")
    conn.execute("CREATE TABLE users (id INT, user TEXT, role TEXT)")
    conn.executemany("INSERT INTO users VALUES (?,?,?)", [
        (1, "admin", "admin"),
        (2, "alice", "user"),
        (3, "bob", "user"),
    ])

    # Cách 1 — string concatenation (LỖ HỔNG)
    try:
        q = f"SELECT id, user, role FROM users WHERE user='{user_input}'"
        rows = conn.execute(q).fetchall()
        print(f"  [CONCAT] {q}")
        print(f"           -> trả về {len(rows)} dòng: {rows[:5]}")
        if len(rows) > 0:
            print("           [!] LỖ HỔNG: input đã làm thay đổi query!")
    except Exception as e:
        print(f"  [CONCAT] Lỗi DB (error-based leak): {e}")

    # Cách 2 — parameterized query (AN TOÀN)
    q2 = "SELECT id, user, role FROM users WHERE user=?"
    rows2 = conn.execute(q2, (user_input,)).fetchall()
    print(f"  [PREPARED] SELECT ... WHERE user=?")
    print(f"              -> trả về {len(rows2)} dòng: {rows2}")

    print("-" * 60)
    print("[KẾT LUẬN] Prepared statement biến input thành DỮ LIỆU, "
          "không phải SQL — đây là phòng thủ gốc rễ chống SQLi.")


DEMO_INPUTS = ["admin' OR '1'='1", "admin' --", "alice", "1 UNION SELECT id,user,role FROM users"]


def main():
    ap = argparse.ArgumentParser(description="SQL injection defender (offline)")
    ap.add_argument("--input", help="chuoi input ban muon kiem tra")
    ap.add_argument("--demo", action="store_true", help="chay demo 4 input mau")
    args = ap.parse_args()

    if args.input:
        check(args.input)
    elif args.demo:
        for s in DEMO_INPUTS:
            check(s)
            print()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week15_sqli_defender.py --demo")


if __name__ == "__main__":
    main()
