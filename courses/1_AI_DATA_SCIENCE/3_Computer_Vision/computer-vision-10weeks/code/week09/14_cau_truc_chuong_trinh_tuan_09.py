"""computer-vision-10weeks · Tuần 09 · Bài 14.

Chủ đề: Cấu trúc chương trình tuần 09
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('14 - Cấu trúc chương trình tuần 09:', result)
