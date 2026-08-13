"""drone-diy-10weeks · Tuần 05 · Bài 06.

Chủ đề: Center of gravity calculation
"""
def transform(value: int) -> int:
    """Hàm nhỏ, dễ kiểm thử và tái sử dụng."""
    return value * 2
result = [transform(value) for value in (1, 2, 3)]
assert result is not None
print('06 - Center of gravity calculation:', result)
