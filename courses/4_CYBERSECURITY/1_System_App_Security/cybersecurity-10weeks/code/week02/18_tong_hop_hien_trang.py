"""cybersecurity-10weeks · Tuần 02 · Bài 18.

Chủ đề: Tổng hợp hiện trạng
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - Tổng hợp hiện trạng:', result)
