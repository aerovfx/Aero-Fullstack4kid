"""software-reverse-engineering-10weeks · Tuần 03 · Bài 02.

Chủ đề: Kiến trúc x86 vs x64 và Các Thanh Ghi CPU
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('02 - Kiến trúc x86 vs x64 và Các Thanh Ghi CPU:', result)
