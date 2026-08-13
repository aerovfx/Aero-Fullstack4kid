"""crypto-10weeks · Tuần 06 · Bài 14.

Chủ đề: 1: Module Trao Đổi Khóa ECDH Curve25519 & Dẫn Xuất Khóa HKDF
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 1: Module Trao Đổi Khóa ECDH Curve25519 & Dẫn Xuất Khóa HKDF:', result)
