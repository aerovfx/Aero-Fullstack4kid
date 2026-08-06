"""ĐÁP ÁN - Bài tập 2 (Tuần 7): Dictionary attack."""

import hashlib

LEAKED_HASHES = {
    "alice": "5f4dcc3b5aa765d61d8327deb882cf99",
    "bob":   "e10adc3949ba59abbe56e057f20f883e",
    "carol": "827ccb0eea8a706c4c34a16891f84e7b",
    "dave":  "d8578edf8458ce06fbc5bb76a58c5ca4",
    "erin":  "0000000000000000000000000000dead",
}

WORDLIST = ["admin", "letmein", "password", "123456", "12345",
            "qwerty", "football", "iloveyou", "dragon"]


def md5_hex(text):
    return hashlib.md5(text.encode()).hexdigest()


def crack(leaked, wordlist):
    lookup = {md5_hex(word): word for word in wordlist}
    cracked = {}
    for user, h in leaked.items():
        if h in lookup:
            cracked[user] = lookup[h]
    return cracked


if __name__ == "__main__":
    print("=== DICTIONARY ATTACK (mini-hashcat) ===\n")
    cracked = crack(LEAKED_HASHES, WORDLIST)

    print("Đã crack:")
    for user, pw in cracked.items():
        print(f"  [!] {user} -> {pw}")

    remaining = [u for u in LEAKED_HASHES if u not in cracked]
    print(f"\nChưa crack ({len(remaining)}): {remaining}  (mật khẩu không có trong wordlist)")

    print("\nBÀI HỌC:")
    print(f"- Crack được {len(cracked)}/{len(LEAKED_HASHES)} tài khoản gần như tức thì vì MD5")
    print("  nhanh và KHÔNG salt -> chỉ cần băm wordlist đúng 1 lần rồi tra bảng.")
    print("- Nếu có salt riêng mỗi user: phải băm lại toàn bộ wordlist cho TỪNG user.")
    print("- bcrypt/PBKDF2 cố tình chậm (nhiều vòng lặp): mỗi lần thử tốn thời gian")
    print("  gấp hàng nghìn lần -> tấn công từ điển trở nên bất khả thi trên quy mô lớn.")
