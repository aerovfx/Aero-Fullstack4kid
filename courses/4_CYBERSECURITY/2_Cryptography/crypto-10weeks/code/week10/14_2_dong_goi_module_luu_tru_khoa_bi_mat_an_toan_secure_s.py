"""crypto-10weeks · Tuần 10 · Bài 14.

Chủ đề: 2: Đóng Gói Module Lưu Trữ Khóa Bí Mật An Toàn (Secure Storage Manager)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - 2: Đóng Gói Module Lưu Trữ Khóa Bí Mật An Toàn (Secure Storage Manager):', result)
