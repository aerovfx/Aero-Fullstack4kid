"""software-reverse-engineering-10weeks · Tuần 10 · Bài 02.

Chủ đề: Chuyên đề: Đánh Giá Thiết Kế License Integrity, Chống Can Thiệp (Anti-Tamper) & Đồ Á Capst
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Chuyên đề: Đánh Giá Thiết Kế License Integrity, Chống Can Thiệp (Anti-Tamper) & Đồ Á Capst:', result)
