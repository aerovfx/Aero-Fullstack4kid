#!/usr/bin/env python3
"""
week06_password_strength.py
Password Strength Analyzer - Công cụ phân tích độ mạnh mật khẩu (DEFENSIVE / BLUE TEAM)
Tuần 6 - CEH v13 Module 06 (System Hacking - Password Attacks & Hardening)

=====================================================================================
ETHICS BANNER / CẢNH BÁO ĐẠO ĐỨC
=====================================================================================
[!] Tool này CHỈ dùng để PHÒNG THỦ (defensive) trên MÁY CỦA BẠN.
[!] Mục đích: giúp bạn đánh giá độ mạnh mật khẩu trước khi đặt / thay đổi, và
     hiểu cách kẻ tấn công khai thác mật khẩu yếu để xây dựng chính sách an toàn.
[!] TUYỆT ĐỐI KHÔNG được dùng để:
      - Phân tích / phá mật khẩu của NGƯỜI KHÁC.
      - Quét, dump hash, hay khai thác tài khoản trên hệ thống không thuộc về bạn.
[!] TOOL KHÔNG LƯU TRỮ mật khẩu dưới BẤT KỲ hình thức nào (không ghi file,
     không in ra terminal, không cache). Mật khẩu chỉ tồn tại trong RAM 1 lần
     trong thời gian chương trình chạy rồi được thải bỏ (gc / đè bộ nhớ).
[!] Vi phạm các quy tắc trên là vi phạm pháp luật (Luật An ninh mạng VN 2018,
     Nghị định 06/2022/NĐ-CP) và ĐẠO ĐỨC CEH -> FAIL toàn bộ khoá học.
=====================================================================================

Demo (học viên tự chạy keyword mode):
    python3 week06_password_strength.py --demo
=====================================================================================
"""

import argparse
import math
import re
import sys
import time

# =====================================================================================
# 1. DANH SÁCH MẬT KHẨU PHỔ BIẾN (TOP COMMON PASSWORDS - BLACKLIST)
#    Trích lọc từ NordPass / HaveIBeenPwned 2024 - chỉ giữ các mẫu ngắn để demo an toàn.
#    Kẻ tấn công dictionary attack sẽ thử danh sách NÀY đầu tiên trước khi brute-force.
# =====================================================================================
TOP_COMMON_PASSWORDS = {
    "123456", "password", "123456789", "12345678", "12345",
    "111111", "1234567", "sunshine", "qwerty", "iloveyou",
    "princess", "admin", "welcome", "666666", "abc123",
    "football", "123123", "monkey", "654321", "!@#$%^&*",
    "charlie", "aa123456", "donald", "password1", "qwerty123",
    "admin123", "letmein", "shadow", "master", "dragon",
    "michael", "superman", "batman", "passw0rd", "qazwsx",
    "zaq12wsx", "p@ssw0rd", "1q2w3e4r", "passw0rd!", "trustno1",
    "ashley", "baseball", "freedom", "whatever", "q1w2e3",
}

# =====================================================================================
# 2. CHARSET - CÁC TẬP KÝ TỰ DÙNG ĐỂ TÍNH ENTROPY
# =====================================================================================
CHARSET = {
    "lowercase":      "abcdefghijklmnopqrstuvwxyz",
    "uppercase":      "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    "digits":         "0123456789",
    "symbols":        "!@#$%^&*()_+-=[]{}|;:,.<>?/~` ",
}


# =====================================================================================
# 3. HÀM TÍNH ENTROPY (ĐƠN VỊ: BIT)
#    entropy = chiều dài mật khẩu x log2(kích thước bảng ký tự khả dụng)
#    Đây là cùng cơ chế CEH dạy để giải thích VÌ SAO "mật khẩu dài + đa dạng" hơn
#    "mật khẩu ngắn + phức tạp": entropy tăng theo LUỸ THỪA của chiều dài.
# =====================================================================================
def compute_entropy(password: str) -> float:
    """Tính entropy (bits) của mật khẩu dựa trên charset thực tế được sử dụng.

    Trả về giá trị >= 0. 0 nếu mật khẩu rỗng.
    """
    pw = password.strip()
    if not pw:
        return 0.0

    pool = 0
    if re.search(r"[a-z]", pw):
        pool += 26
    if re.search(r"[A-Z]", pw):
        pool += 26
    if re.search(r"[0-9]", pw):
        pool += 10
    if re.search(r"[^a-zA-Z0-9]", pw):
        pool += 33  # bảng ký tự đặc biệt thông dụng (đếm chặn dưới an toàn)

    if pool == 0:
        return 0.0
    return len(pw) * math.log2(pool)


# =====================================================================================
# 4. CÁC BỘ KIỂM TRA PHÁT HIỆN MẪU YẾU (PATTERN DETECTION)
#    Kẻ tấn công không chỉ brute-force: chúng dùng RULE-BASED (Hashcat mang, s, $, 1-&gt;i)
#    và từ điển kết hợp -> mật khẩu "giống người thật" dễ vỡ hơn entropy thuần.
# =====================================================================================
# 4.1 Mật khẩu có trong blacklist phổ biến
def is_in_blacklist(password: str) -> bool:
    return password.strip().lower() in TOP_COMMON_PASSWORDS


# 4.2 Từ điển greets / tên / năm sinh thường gặp (demo, không đầy đủ)
WEAK_WORDS = {
    "hanoi", "saigon", "vietnam", "tuan", "hoang", "minh", "anh", "linh",
    "password", "admin", "welcome", "user", "test", "qwerty", "iloveyou",
}

# 4.3 Mẫu tuần tự chuỗi (trên bàn phím / chữ số liền nhau)
def is_sequential(password: str) -> bool:
    pw = password.lower()
    seqs = ["abcdefghijklmnopqrstuvwxyz", "0123456789",
            "qwertyuiop", "asdfghjkl", "zxcvbnm"]
    for seq in seqs:
        for i in range(len(seq) - 2):
            if seq[i:i + 3] in pw:
                return True
    return False


# 4.4 Mật khẩu chứa tên gọi hoặc thông tin cá nhân phổ biến
def contains_weak_word(password: str) -> bool:
    pw = password.lower()
    return any(word in pw for word in WEAK_WORDS)


# 4.5 Ký tự lặp nhiều lần (aaaa, 1111...) - yếu dù dài
def has_repetition(password: str) -> bool:
    pw = password.strip().lower()
    for ch in set(pw):
        if pw.count(ch) >= 4:
            return True
    return False


# =====================================================================================
# 5. BỘ CHẤM ĐIỂM VÀ XẾP HẠNG ĐỘ MẠNH
#    Tiêu chuẩn tham khảo: NIST SP 800-63B + khuyến nghị CEH Module 06.
# =====================================================================================
def grade_password(password: str) -> dict:
    """Trả về dict kết quả: entropy, các cảnh báo, điểm, mức độ, khuyến nghị."""
    pw = password.strip()
    result = {
        "pw_length": len(pw),
        "entropy_bits": round(compute_entropy(pw), 2),
        "warnings": [],
        "score": 0,                 # 0..100
        "level": "REJECT",
        "recommendations": [],
    }

    if not pw:
        result["warnings"].append("Mật khẩu RỖNG - bị từ chối ngay lập tức.")
        return result

    if is_in_blacklist(pw):
        result["warnings"].append(
            f"Trong top common passwords -> dictionary attack sẽ vỡ TRONG 1s.")

    if is_sequential(pw):
        result["warnings"].append(
            "Chứa chuỗi tuần tự (abc / 123 / qwerty...) -> dễ bị rule attack.")

    if has_repetition(pw):
        result["warnings"].append(
            "Ký tự lặp >= 4 lần -> kẻ tấn công dùng mask attack đánh bại nhanh.")

    if contains_weak_word(pw):
        result["warnings"].append(
            "Chứa từ ngữ / tên gọi phổ biến -> dễ nằm trong dictionary hybrid attack.")

    if len(pw) < 8:
        result["warnings"].append(
            f"Chiều dài {len(pw)} < 8 ký tự - KHÔNG đạt chuẩn tối thiểu.")

    # Điểm chấm cơ bản
    score = 0.0
    score += min(len(pw) / 12.0, 1.0) * 30.0          # chiều dài: tối đa 30đ
    score += min(result["entropy_bits"] / 60.0, 1.0) * 40.0  # entropy: tối đa 40đ
    classes = 0
    if re.search(r"[a-z]", pw): classes += 1
    if re.search(r"[A-Z]", pw): classes += 1
    if re.search(r"[0-9]", pw): classes += 1
    if re.search(r"[^a-zA-Z0-9]", pw): classes += 1
    score += min(classes / 4.0, 1.0) * 20.0           # đa dạng ký tự: tối đa 20đ
    if not (is_in_blacklist(pw) or is_sequential(pw) or has_repetition(pw)):
        score += 10.0                                 # thưởng khi không vướng pattern yếu

    # Trừ điểm mạnh nếu mắc pattern yếu
    penalty = 0
    if is_in_blacklist(pw):    penalty += 35
    if is_sequential(pw):      penalty += 20
    if has_repetition(pw):     penalty += 15
    if contains_weak_word(pw): penalty += 15

    result["score"] = max(0, int(round(score - penalty)))

    # Xếp hạng
    s = result["score"]
    if s < 40 or len(pw) < 8:
        result["level"] = "REJECT"
    elif s < 70:
        result["level"] = "WEAK"
    elif s < 85:
        result["level"] = "FAIR"
    else:
        result["level"] = "STRONG"

    _build_recommendations(result)
    return result


# =====================================================================================
# 6. SINH KHUYẾN NGHỊ CHÍNH SÁCH (DỰA TRÊN KẾT QUẢ)
# =====================================================================================
def _build_recommendations(result: dict) -> None:
    rec = result["recommendations"]
    if result["level"] == "REJECT":
        rec.append("TỪ CHỐI: đặt lại mật khẩu khác (xem gợi ý bên dưới).")
    if result["pw_length"] < 12:
        rec.append("Tăng chiều dài lên ít nhất 12-16 ký tự (entropy tăng mũ - rẻ nhất).")
    if result["entropy_bits"] < 60:
        rec.append("Thêm nhiều loại ký tự hơn để nâng entropy trên 60 bits.")
    if result["warnings"]:
        rec.append("Tránh mọi mẫu trong danh sách cảnh báo (dictionary/pattern/rule).")
    rec.append("Bật MFA / 2FA cho tài khoản - lớp phòng thủ thứ hai bất kể mật khẩu.")
    rec.append("Không tái sử dụng mật khẩu giữa các website (dùng password manager).")
    if result["level"] in ("FAIR", "STRONG"):
        rec.append("Đạt chuẩn - giữ nguyên & bật MFA; xoay mật khẩu định kỳ theo chính sách.")


# =====================================================================================
# 7. TEMPLATE POLICY (KẾT QUẢ ĐỀ XUẤT CHÍNH SÁCH CHO DOANH NGHIỆP)
# =====================================================================================
POLICY_TEMPLATE = {
    "min_length": 12,
    "password_classes": 4,
    "max_age_days": 90,
    "no_common_passwords": True,
    "no_username_in_password": True,
    "mfa_required": True,
    "lockout_attempts": 5,
    "lockout_minutes": 15,
    "reference_source": "NIST SP 800-63B / CEH v13 Module 06 / CIS Benchmark"
}


# =====================================================================================
# 8. CHẾ ĐỘ TƯƠNG TÁC - CHỈ NHẬN QUA STDIN, KHÔNG LƯU TRỮ
# =====================================================================================
def interactive_mode() -> None:
    print("Nhập mật khẩu để phân tích (sẽ KHÔNG được lưu trữ / không hiển thị):")
    try:
        pw = input("> ")
    except KeyboardInterrupt:
        print("\n[*] Hủy bởi người dùng.")
        return

    _analyze_and_show(pw)
    # Mật khẩu đã nằm trong biến pw -> đè bộ nhớ trước khi thoát
    pw = "x" * len(pw)


# =====================================================================================
# 9. CHẾ ĐỘ DEMO - AN TOÀN, KHÔNG HỎI MẬT KHẨU THẬT (DÀNH CHO GIẢNG DẠY)
# =====================================================================================
def demo_mode() -> None:
    print("[DEMO MODE] Dùng mật khẩu mô phỏng CÓ SẴN - không yêu cầu mật khẩu thật.\n")
    samples = [
        "123456",
        "password123",
        "qwerty2024",
        "minhanh1998",
        "Aa111111!",
        "HoaSen!SaiGon#2026",
        "tR4^iN9-M00n_L33p$",
        "XKy7!pQ2#zW9@",
    ]
    for sample in samples:
        r = grade_password(sample)
        print("-" * 62)
        print(f"Mật khẩu demo {len(sample)} ký tự | entropy={r['entropy_bits']} bits | "
              f"score={r['score']} | mức: {r['level']}")
        for w in r["warnings"]:
            print(f"  [!] {w}")
        if not r["warnings"]:
            print("  [+] Không phát hiện pattern yếu nào.")
    print("-" * 62)
    print("\n[p] Gợi ý: chạy interactive để tự đánh giá mật khẩu cá nhân (an toàn).")


def _analyze_and_show(pw: str) -> None:
    """Phân tích 1 mật khẩu và in kết quả ra terminal (không ghi file)."""
    if not pw:
        print("[!] Không có dữ liệu đầu vào.")
        return
    r = grade_password(pw)
    print("=" * 62)
    print("KẾT QUẢ PHÂN TÍCH ĐỘ MẠNH MẬT KHẨU")
    print("=" * 62)
    print(f"  Chiều dài        : {r['pw_length']}")
    print(f"  Entropy          : {r['entropy_bits']} bits "
          f"(thời gian brute-force ~ {_est_crack_time(r['entropy_bits'])})")
    print(f"  Điểm             : {r['score']}/100")
    print(f"  Mức độ           : {r['level']}")
    if r["warnings"]:
        print("  Cảnh báo:")
        for w in r["warnings"]:
            print(f"    [!] {w}")
    else:
        print("  Cảnh báo        : không phát hiện pattern yếu")
    print("  Khuyến nghị:")
    for rec in r["recommendations"]:
        print(f"    [+] {rec}")
    print("=" * 62)


def _est_crack_time(entropy_bits: float) -> str:
    """Ước lượng thời gian vỡ khi offline cracking 10 tỷ hash/s (GPU RTX cluster)."""
    if entropy_bits <= 0:
        return "tức thì"
    attempts = 2 ** entropy_bits
    seconds = attempts / 1e10
    if seconds < 1:
        return "dưới 1 giây"
    if seconds < 60:
        return f"~{seconds:.0f} giây"
    minutes = seconds / 60
    if minutes < 60:
        return f"~{minutes:.0f} phút"
    hours = minutes / 60
    if hours < 24:
        return f"~{hours:.1f} giờ"
    days = hours / 24
    if days < 365:
        return f"~{days:.0f} ngày"
    years = days / 365
    return f"~{years:,.0f} năm"


# =====================================================================================
# 10. MAIN
# =====================================================================================
def main() -> None:
    parser = argparse.ArgumentParser(
        description="Password Strength Analyzer (defensive) - CEH Week 06")
    parser.add_argument("--demo", action="store_true",
                        help="Chạy với mật khẩu demo, không hỏi mật khẩu thật.")
    parser.add_argument("--policy", action="store_true",
                        help="In template chính sách mật khẩu (NIST/CIS/CEH).")
    args = parser.parse_args()

    print("=" * 62)
    print("PASSWORD STRENGTH ANALYZER - CEH v13 Module 06 - BLUE TEAM")
    print("Tool PHÒNG THỦ: không lưu / không in ra mật khẩu nhập vào.")
    print("=" * 62)

    if args.demo:
        demo_mode()
    elif args.policy:
        print("\n[POLICY TEMPLATE - khuyến nghị cho admin doanh nghiệp]:")
        for k, v in POLICY_TEMPLATE.items():
            print(f"  {k:<22}: {v}")
    else:
        interactive_mode()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n[*] Hủy bởi người dùng. Không lưu gì cả.")
        sys.exit(0)