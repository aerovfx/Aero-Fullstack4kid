"""raspi4-autonomous-car-10weeks · Tuần 10 · Bài 18.

Chủ đề: Kiểm tra dữ liệu tuần 10
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('18 - Kiểm tra dữ liệu tuần 10:', result)
