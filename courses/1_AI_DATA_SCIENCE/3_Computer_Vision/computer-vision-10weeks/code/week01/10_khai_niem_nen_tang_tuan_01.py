"""computer-vision-10weeks · Tuần 01 · Bài 10.

Chủ đề: Khái niệm nền tảng tuần 01
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Khái niệm nền tảng tuần 01:', result)
