"""
BÀI TẬP 2 (Tuần 7): TẤN CÔNG TỪ ĐIỂN - VÌ SAO MD5 KHÔNG SALT LÀ THẢM HOẠ
Ôn lại: hashcat, dictionary attack, tại sao hàm băm nhanh + không salt rất yếu.

BỐI CẢNH:
Đây là phiên bản "hashcat mini" để HIỂU nguyên lý (không phá gì của ai). Ta có
sẵn vài hash MD5 KHÔNG salt (biến LEAKED_HASHES) - mô phỏng một CSDL bị rò rỉ -
và một wordlist nhỏ. Nhiệm vụ: dò ngược mật khẩu bằng cách băm từng từ trong
wordlist rồi so khớp.

NHIỆM VỤ:
1. Với mỗi từ trong WORDLIST, tính md5 và lưu vào dict {md5: từ}.
2. Duyệt LEAKED_HASHES, tra xem hash nào crack được.
3. In kết quả + bài học vì sao phải dùng salt + hàm băm chậm (bcrypt/PBKDF2).

AN TOÀN: dữ liệu tự tạo, chỉ để học. Không dùng lên dữ liệu rò rỉ thật của người khác.
"""

import hashlib

# "CSDL bị rò rỉ": các hash MD5 không salt (mô phỏng)
LEAKED_HASHES = {
    "alice": "5f4dcc3b5aa765d61d8327deb882cf99",   # "password"
    "bob":   "e10adc3949ba59abbe56e057f20f883e",   # "123456"
    "carol": "827ccb0eea8a706c4c34a16891f84e7b",   # "12345"
    "dave":  "d8578edf8458ce06fbc5bb76a58c5ca4",   # "qwerty"
    "erin":  "0000000000000000000000000000dead",   # không có trong wordlist
}

WORDLIST = ["admin", "letmein", "password", "123456", "12345",
            "qwerty", "football", "iloveyou", "dragon"]


def md5_hex(text):
    return hashlib.md5(text.encode()).hexdigest()


def crack(leaked, wordlist):
    """Trả về dict {username: mật_khẩu_tìm_được} cho các hash crack được."""
    # TODO 1: dựng bảng tra {md5(từ): từ} cho toàn bộ wordlist.
    # TODO 2: duyệt leaked (username -> hash); nếu hash có trong bảng tra
    #         thì ghi lại username -> từ tương ứng.
    return {}


if __name__ == "__main__":
    print("=== DICTIONARY ATTACK (mini-hashcat) ===\n")
    cracked = crack(LEAKED_HASHES, WORDLIST)

    # TODO 3: in mỗi user đã crack: "user -> mật khẩu".
    # TODO 4: in các user CHƯA crack được (mật khẩu không nằm trong wordlist).
    # TODO 5: in bài học:
    #   - MD5 nhanh + không salt -> crack cả CSDL trong tích tắc.
    #   - Có salt -> phải crack lại từ đầu cho TỪNG user.
    #   - bcrypt/PBKDF2 cố tình chậm -> mỗi lần thử tốn thời gian gấp bội.
