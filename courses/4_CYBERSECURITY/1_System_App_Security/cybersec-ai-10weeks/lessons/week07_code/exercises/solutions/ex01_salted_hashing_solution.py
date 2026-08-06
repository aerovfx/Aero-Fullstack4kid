"""ĐÁP ÁN - Bài tập 1 (Tuần 7): Băm mật khẩu có salt (PBKDF2)."""

import hashlib
import hmac
import os

ITERATIONS = 200_000


def hash_password(password):
    salt = os.urandom(16)
    pw_hash = hashlib.pbkdf2_hmac("sha256", password.encode(), salt, ITERATIONS)
    return salt, pw_hash


def verify_password(password, salt, expected_hash):
    computed = hashlib.pbkdf2_hmac("sha256", password.encode(), salt, ITERATIONS)
    return hmac.compare_digest(computed, expected_hash)


if __name__ == "__main__":
    print("=== BĂM MẬT KHẨU CÓ SALT (PBKDF2) ===\n")

    pw = "SuperSecret123!"
    salt, h = hash_password(pw)
    print(f"Salt : {salt.hex()}")
    print(f"Hash : {h.hex()}")

    print(f"\nVerify đúng mật khẩu : {verify_password(pw, salt, h)}")
    print(f"Verify sai mật khẩu  : {verify_password('WrongPassword', salt, h)}")

    salt2, h2 = hash_password(pw)
    print("\n--- Vai trò của salt ---")
    print(f"Hash lần 1: {h.hex()[:32]}...")
    print(f"Hash lần 2: {h2.hex()[:32]}...")
    print("=> Cùng một mật khẩu nhưng salt khác nhau -> hash khác nhau hoàn toàn.")
    print("   Nhờ vậy: rainbow table dựng sẵn vô dụng, và nhìn hash không biết")
    print("   hai người dùng có đặt trùng mật khẩu hay không.")
