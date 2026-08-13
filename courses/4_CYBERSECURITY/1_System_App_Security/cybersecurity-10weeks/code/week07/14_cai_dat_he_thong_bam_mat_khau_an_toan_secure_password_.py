"""cybersecurity-10weeks · Tuần 07 · Bài 14.

Chủ đề: Cài đặt Hệ thống Băm Mật Khẩu An Toàn (Secure Password Hashing System)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Cài đặt Hệ thống Băm Mật Khẩu An Toàn (Secure Password Hashing System):', result)
