"""cybersecurity-10weeks · Tuần 05 · Bài 18.

Chủ đề: Bước 7: Quét hệ điều hành (OS Detection)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - Bước 7: Quét hệ điều hành (OS Detection):', result)
