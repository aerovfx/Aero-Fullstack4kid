"""software-reverse-engineering-10weeks · Tuần 02 · Bài 02.

Chủ đề: Reverse Engineering là gì?
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Reverse Engineering là gì?:', result)
