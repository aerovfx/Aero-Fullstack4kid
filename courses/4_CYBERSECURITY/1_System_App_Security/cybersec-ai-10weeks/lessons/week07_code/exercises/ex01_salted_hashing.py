"""
BÀI TẬP 1 (Tuần 7): BĂM MẬT KHẨU CÓ SALT (PBKDF2, thư viện chuẩn)
Ôn lại: hàm băm, salt, vì sao không lưu mật khẩu dạng thô.

BỐI CẢNH:
Bài giảng dùng bcrypt. Bài tập này dùng `hashlib.pbkdf2_hmac` có sẵn trong
Python (không cần cài gì) để bạn hiểu BẢN CHẤT: băm 1 chiều + salt ngẫu nhiên +
lặp nhiều vòng cho chậm lại.

NHIỆM VỤ:
1. hash_password(pw): sinh salt ngẫu nhiên 16 byte, băm PBKDF2-HMAC-SHA256
   với 200_000 vòng, trả về (salt, hash).
2. verify_password(pw, salt, expected): băm lại pw với ĐÚNG salt đó và so sánh
   AN TOÀN bằng hmac.compare_digest (chống timing attack).
3. Chứng minh vai trò của salt: băm CÙNG một mật khẩu 2 lần -> ra 2 hash khác nhau.

CHẠY:  python3 ex01_salted_hashing.py
"""

import hashlib
import hmac
import os

ITERATIONS = 200_000


def hash_password(password):
    """Trả về (salt: bytes, hash: bytes)."""
    salt = os.urandom(16)
    # TODO 1: dùng hashlib.pbkdf2_hmac("sha256", password.encode(), salt, ITERATIONS)
    pw_hash = b""
    return salt, pw_hash


def verify_password(password, salt, expected_hash):
    """True nếu password khớp. Dùng compare_digest để so sánh an toàn."""
    # TODO 2: băm lại password với salt + ITERATIONS.
    # TODO 3: return hmac.compare_digest(computed, expected_hash)
    return False


if __name__ == "__main__":
    print("=== BĂM MẬT KHẨU CÓ SALT (PBKDF2) ===\n")

    pw = "SuperSecret123!"
    salt, h = hash_password(pw)
    print(f"Salt : {salt.hex()}")
    print(f"Hash : {h.hex()}")

    # TODO 4: in kết quả verify với mật khẩu ĐÚNG và mật khẩu SAI.
    # TODO 5: gọi hash_password(pw) LẦN NỮA, in hash mới và nhận xét:
    #         cùng mật khẩu nhưng salt khác -> hash khác -> kẻ tấn công không thể
    #         dùng "rainbow table" dựng sẵn, và không biết 2 user có trùng mật khẩu.
