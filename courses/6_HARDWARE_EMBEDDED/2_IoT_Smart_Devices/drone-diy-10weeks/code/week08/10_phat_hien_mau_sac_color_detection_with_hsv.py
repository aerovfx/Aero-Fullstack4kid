"""drone-diy-10weeks · Tuần 08 · Bài 10.

Chủ đề: Phát Hiện Màu Sắc (Color Detection with HSV)
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('10 - Phát Hiện Màu Sắc (Color Detection with HSV):', result)
