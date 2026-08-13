"""pico-stem-10weeks · Tuần 07 · Bài 18.

Chủ đề: Khái niệm nền tảng tuần 07
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - Khái niệm nền tảng tuần 07:', result)
